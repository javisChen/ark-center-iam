package com.ark.center.iam.infra.usergroup.repository;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.infra.usergroup.converter.UserGroupDomainConverter;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDAO;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Repository
@RequiredArgsConstructor
public class UserGroupDBRepository extends BaseDBRepository<UserGroup, Long> implements UserGroupRepository {

    private final UserGroupDomainConverter userGroupDomainConverter;
    private final UserGroupDAO userGroupDAO;

    @Override
    public List<Long> selectUserGroupIdsByUserId(Long userId, boolean includeParent) {
        List<UserGroupDO> userGroups = userGroupDAO.getBaseMapper().selectByUserId(userId);
        if (CollectionUtil.isEmpty(userGroups)) {
            return Collections.emptyList();
        }
        if (!includeParent) {
            return userGroups.stream().map(BaseEntity::getId).collect(Collectors.toList());
        }
        return Lists.newArrayList(collectParentUserGroupIds(userGroups));
    }


    private List<UserGroupDO> selectSubUserGroups(String levelPath) {
        return userGroupDAO.lambdaQuery()
                .likeRight(UserGroupDO::getLevelPath, levelPath)
                .list();
    }

    @Override
    public boolean existsByName(Long id, String name) {
        return userGroupDAO.lambdaQuery()
                .ne(id != null, BaseEntity::getId, id)
                .eq(UserGroupDO::getName, name)
                .exists();
    }

    /**
     * 收集继承的父级用户组
     */
    public Set<Long> collectParentUserGroupIds(List<UserGroupDO> userGroups) {
        return userGroups.stream()
                .filter(item -> !item.getPid().equals(0L))
                .flatMap(item -> {
                    if (Objects.equals(item.getInheritType(), InheritType.INHERIT_PARENT.getValue())) {
                        return Stream.of(item.getId(), item.getPid());
                    } else if (Objects.equals(item.getInheritType(), InheritType.INHERIT_ALL.getValue())) {
                        return Stream.of(item.getLevelPath().split("\\."))
                                .map(Long::valueOf)
                                .distinct();
                    } else {
                        return Stream.empty();
                    }
                })
                .collect(Collectors.toSet());

    }

    @Override
    public UserGroup byId(Long id) {
        UserGroupDO groupDO = userGroupDAO.getById(id);
        List<Long> roleIds = userGroupDAO.selectRoleIdsById(groupDO.getId());
        return userGroupDomainConverter.toDomain(groupDO, roleIds);
    }

    @Override
    public void save(UserGroup userGroup) {
        UserGroupDO userGroupDO = userGroupDomainConverter.fromDomain(userGroup);
        List<Long> roleIds = userGroup.getRoleIds();

        Long groupId = userGroupDO.getId();
        userGroupDAO.deleteRoleRelations(groupId);
        userGroupDAO.saveRoleRelations(groupId, roleIds);
    }

    @Override
    public void delete(UserGroup ar) {

        UserGroupDO userGroupDO = userGroupDomainConverter.fromDomain(ar);
        userGroupDAO.removeById(userGroupDO.getId());

        List<UserGroupDO> children = selectSubUserGroups(userGroupDO.getLevelPath());
        List<Long> ids = children.stream().map(BaseEntity::getId).collect(Collectors.toList());
        ids.add(userGroupDO.getId());
        userGroupDAO.removeByIds(ids);
    }

}
