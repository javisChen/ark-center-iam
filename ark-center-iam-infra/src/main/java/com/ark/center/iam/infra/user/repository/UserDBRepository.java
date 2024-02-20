package com.ark.center.iam.infra.user.repository;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.infra.relation.db.UserGroupUserRelDAO;
import com.ark.center.iam.infra.relation.db.UserGroupUserRelDO;
import com.ark.center.iam.infra.relation.db.UserRoleRelDAO;
import com.ark.center.iam.infra.relation.db.UserRoleRelDO;
import com.ark.center.iam.infra.user.converter.UserDomainConverter;
import com.ark.center.iam.infra.user.repository.db.UserDAO;
import com.ark.center.iam.infra.user.repository.db.UserDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserDBRepository extends BaseDBRepository<User, Long> implements UserRepository {

    private final UserDomainConverter domainConverter;
    private final UserDAO userDAO;
    private final UserRoleRelDAO userRoleRelDAO;
    private final UserGroupUserRelDAO userGroupUserRelDAO;

    @Override
    public Long countUserByCode(String code) {
        return userDAO.lambdaQuery()
                .eq(UserDO::getCode, code)
                .count();
    }

    @Override
    public boolean existsByMobile(Long id, String mobile) {
        return userDAO.lambdaQuery()
                .ne(id != null, BaseEntity::getId, id)
                .eq(UserDO::getMobile, mobile)
                .exists();
    }

    @Override
    public boolean existsByMobile(String mobile) {
        return existsByMobile(null, mobile);
    }

    @Override
    public void save(User user) {
        UserDO userDO = domainConverter.fromDomain(user);

        userDAO.saveOrUpdate(userDO);

        List<Long> userGroupIds = user.getUserGroupIds();
        List<Long> roleIds = user.getRoleIds();
        Long userId = userDO.getId();

        if (CollectionUtil.isNotEmpty(userGroupIds)) {
            userGroupIds = userGroupIds.stream().sorted().toList();
            userGroupUserRelDAO.lambdaUpdate()
                    .eq(UserGroupUserRelDO::getUserId, userId)
                    .in(UserGroupUserRelDO::getUserGroupId, userGroupIds)
                    .remove();
            userGroupUserRelDAO.batchSave(userId, userGroupIds);
        }

        if (CollectionUtil.isNotEmpty(roleIds)) {
            roleIds = roleIds.stream().sorted().toList();
            userRoleRelDAO.lambdaUpdate()
                    .eq(UserRoleRelDO::getUserId, userId)
                    .in(UserRoleRelDO::getRoleId, roleIds)
                    .remove();
            userRoleRelDAO.batchSave(userId, roleIds);

        }

    }

    @Override
    public void delete(User user) {
        UserDO userDO = domainConverter.fromDomain(user);

        Long userId = userDO.getId();

        userDAO.lambdaUpdate()
                .set(UserDO::getIsDeleted, 1)
                .eq(BaseEntity::getId, userId);

        userRoleRelDAO.lambdaUpdate()
                .eq(UserRoleRelDO::getUserId, userId)
                .remove();

        userGroupUserRelDAO.lambdaUpdate()
                .eq(UserGroupUserRelDO::getUserId, userId)
                .remove();

    }

    @Override
    public User byId(Long id) {
        UserDO userDO = userDAO.getById(id);
        List<Long> roleIds = userRoleRelDAO.selectIdsByUserId(id);
        List<Long> userGroupIds = userGroupUserRelDAO.selectIdsByUserId(id);
        return domainConverter.toDomain(userDO, roleIds, userGroupIds);
    }
}
