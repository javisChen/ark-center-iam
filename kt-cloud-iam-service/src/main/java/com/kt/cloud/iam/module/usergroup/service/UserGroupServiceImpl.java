package com.kt.cloud.iam.module.usergroup.service;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kt.cloud.iam.common.util.Assert;
import com.kt.cloud.iam.enums.BizEnums;
import com.kt.cloud.iam.enums.DeletedEnums;
import com.kt.cloud.iam.enums.UserGroupInheritTypeEnums;
import com.kt.cloud.iam.module.usergroup.converter.UserGroupBeanConverter;
import com.kt.cloud.iam.module.usergroup.dto.UserGroupQueryDTO;
import com.kt.cloud.iam.module.usergroup.dto.UserGroupUpdateDTO;
import com.kt.cloud.iam.dao.entity.IamUserGroup;
import com.kt.cloud.iam.dao.entity.IamUserGroupRoleRel;
import com.kt.cloud.iam.dao.entity.IamUserGroupUserRel;
import com.kt.cloud.iam.dao.mapper.IamUserGroupMapper;
import com.kt.cloud.iam.dao.mapper.IamUserGroupRoleRelMapper;
import com.kt.cloud.iam.dao.mapper.IamUserGroupUserRelMapper;
import com.kt.cloud.iam.module.usergroup.vo.UserGroupBaseVO;
import com.kt.cloud.iam.module.usergroup.vo.UserGroupDetailVO;
import com.kt.cloud.iam.module.usergroup.vo.UserGroupListTreeVO;
import com.kt.cloud.iam.module.usergroup.vo.UserGroupTreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户组表 服务实现类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
public class UserGroupServiceImpl extends ServiceImpl<IamUserGroupMapper, IamUserGroup> implements IUserGroupService {

    private final static Long DEFAULT_PID = 0L;
    private final static Integer FIRST_LEVEL = 1;

    @Autowired
    private UserGroupBeanConverter beanConverter;
    @Autowired
    private IamUserGroupUserRelMapper iamUserGroupUserRelMapper;
    @Autowired
    private IamUserGroupRoleRelMapper iamUserGroupRoleRelMapper;

    @Override
    public Page<UserGroupListTreeVO> pageList(UserGroupQueryDTO dto) {
        LambdaQueryWrapper<IamUserGroup> queryWrapper = new LambdaQueryWrapper<IamUserGroup>()
                .like(StrUtil.isNotBlank(dto.getName()), IamUserGroup::getName, dto.getName())
                .eq(IamUserGroup::getPid, DEFAULT_PID)
                .eq(IamUserGroup::getIsDeleted, DeletedEnums.NOT.getCode())
                .orderByAsc(IamUserGroup::getGmtCreate);
        Page<IamUserGroup> pageResult = this.page(new Page<>(dto.getCurrent(), dto.getSize()), queryWrapper);

        List<IamUserGroup> levelOneUserGroups = pageResult.getRecords();
        List<IamUserGroup> anotherUserGroups = this.list(new LambdaQueryWrapper<IamUserGroup>()
                .ne(IamUserGroup::getPid, DEFAULT_PID));

        List<UserGroupListTreeVO> vos = recursionUserGroups(levelOneUserGroups, anotherUserGroups);

        Page<UserGroupListTreeVO> pageVo = new Page<>(pageResult.getCurrent(), pageResult.getSize(), pageResult.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }

    private List<UserGroupListTreeVO> recursionUserGroups(List<IamUserGroup> levelOneUserGroups, List<IamUserGroup> anotherUserGroups) {
        List<UserGroupListTreeVO> vos = CollectionUtil.newArrayList();
        for (IamUserGroup item : levelOneUserGroups) {
            UserGroupListTreeVO vo = beanConverter.convertToUserGroupListTreeVO(item);
            findChildren(vo, anotherUserGroups);
            vos.add(vo);
        }
        return vos;
    }

    private void findChildren(UserGroupListTreeVO parent, List<IamUserGroup> list) {
        for (IamUserGroup route : list) {
            if (parent.getId().equals(route.getPid())) {
                UserGroupListTreeVO item = beanConverter.convertToUserGroupListTreeVO(route);
                parent.getChildren().add(item);
                findChildren(item, list);
            }
        }
    }

    @Override
    @Transactional
    public void saveUserGroup(UserGroupUpdateDTO dto) {
        long count = getUserGroupByName(dto.getName());
        Assert.isTrue(count > 0, BizEnums.USER_GROUP_ALREADY_EXISTS);

        IamUserGroup newUserGroup = beanConverter.convertToDO(dto);

        IamUserGroup parentRoute = null;
        if (this.isFirstLevelUserGroup(newUserGroup)) {
            newUserGroup.setLevel(FIRST_LEVEL);
        } else {
            parentRoute = getUserGroupById(newUserGroup.getPid());
            Assert.isTrue(parentRoute == null, BizEnums.PARENT_ROUTE_NOT_EXISTS);
            newUserGroup.setLevel(parentRoute.getLevel() + 1);
        }
        this.save(newUserGroup);

        // 新增完路由记录后再更新层级信息
        updateLevelPathAfterSave(newUserGroup, parentRoute);

        updateUserGroupRoleRel(newUserGroup.getId(), dto.getRoleIds());
    }

    private void updateUserGroupRoleRel(Long userGroupId, List<Long> roleIds) {
        if (CollectionUtil.isNotEmpty(roleIds)) {
            iamUserGroupRoleRelMapper.insertBatch(userGroupId, roleIds);
        }
    }

    private void updateLevelPathAfterSave(IamUserGroup route, IamUserGroup parentRoute) {
        Long routeId = route.getId();
        String levelPath = isFirstLevelUserGroup(route)
                ? routeId + StrUtil.DOT
                : parentRoute.getLevelPath() + routeId + StrUtil.DOT;
        IamUserGroup entity = new IamUserGroup();
        entity.setId(routeId);
        entity.setLevelPath(levelPath);
        this.updateById(entity);
    }

    public IamUserGroup getUserGroupById(Long id) {
        LambdaQueryWrapper<IamUserGroup> queryWrapper = new LambdaQueryWrapper<IamUserGroup>()
                .eq(IamUserGroup::getId, id);
        return this.getOne(queryWrapper);
    }

    private boolean isFirstLevelUserGroup(IamUserGroup userGroup) {
        return DEFAULT_PID.equals(userGroup.getPid()) || FIRST_LEVEL.equals(userGroup.getLevel());
    }

    private long getUserGroupByName(String name) {
        LambdaQueryWrapper<IamUserGroup> queryWrapper = new LambdaQueryWrapper<IamUserGroup>()
//                .eq(IamUserGroup::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(IamUserGroup::getName, name);
        return this.count(queryWrapper);
    }

    @Override
    @Transactional
    public void updateUserGroupById(UserGroupUpdateDTO dto) {
        IamUserGroup userGroup = getUserGroupByName(dto);

        Assert.isTrue(userGroup != null && !userGroup.getId().equals(dto.getId()),
                BizEnums.USER_GROUP_ALREADY_EXISTS);

        IamUserGroup update = beanConverter.convertToDO(dto);
        this.updateById(update);

        Long userGroupId = update.getId();
        // 清除用户角色和用户组的关联关系
        removeUserGroupRoleRelByUserGroupId(userGroupId);
        // 重新绑定用户角色和用户组的关联关系
        updateUserGroupRoleRel(userGroupId, dto.getRoleIds());
    }

    private IamUserGroup getUserGroupByName(UserGroupUpdateDTO dto) {
        LambdaQueryWrapper<IamUserGroup> queryWrapper = new LambdaQueryWrapper<IamUserGroup>()
                .eq(IamUserGroup::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(IamUserGroup::getName, dto.getName());
        return this.getOne(queryWrapper);
    }

    private void removeUserGroupRoleRelByUserGroupId(Long id) {
        LambdaUpdateWrapper<IamUserGroupRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(IamUserGroupRoleRel::getUserGroupId, id);
        iamUserGroupRoleRelMapper.delete(qw);
    }

    @Override
    public List<Long> getUserGroupIdsByUserId(Long userId) {
        LambdaQueryWrapper<IamUserGroupUserRel> qw = new LambdaQueryWrapper<>();
        qw.eq(IamUserGroupUserRel::getUserId, userId);
        return iamUserGroupUserRelMapper.selectList(qw).stream().map(IamUserGroupUserRel::getUserGroupId)
                .collect(Collectors.toList());
    }

    @Override
    public List<Long> getUserGroupsIdIncludeParentByUserId(Long userId) {
        LambdaQueryWrapper<IamUserGroupUserRel> qw = new LambdaQueryWrapper<>();
        qw.eq(IamUserGroupUserRel::getUserId, userId);
        List<Long> userGroupIds = iamUserGroupUserRelMapper.selectList(qw)
                .stream().map(IamUserGroupUserRel::getUserGroupId)
                .collect(Collectors.toList());
        if (CollectionUtil.isEmpty(userGroupIds)) {
            return CollectionUtil.newArrayList();
        }
        List<IamUserGroup> userGroups = listByIds(userGroupIds);
        Set<Long> userGroupIdSets = filterUserGroupParentIds(userGroups);
        userGroupIdSets.addAll(userGroupIds);
        return CollectionUtil.newArrayList(userGroupIdSets);
    }

    public Set<Long> filterUserGroupParentIds(List<IamUserGroup> userGroups) {

        // 继承类型为只继承父类的话，把pid提取出来
        List<Long> collect = userGroups.stream()
                .filter(item -> !item.getPid().equals(0L) &&
                        Objects.equals(item.getInheritType(), UserGroupInheritTypeEnums.INHERIT_PARENT.getValue()))
                .map(IamUserGroup::getPid)
                .collect(Collectors.toList());

        // 继承类型为继承所有上级的话，把levelPath取出来，拆解后存到Set中进行排重
        List<String> inheritAllLevelPath = userGroups.stream()
                .filter(item -> !item.getPid().equals(0L) &&
                        Objects.equals(item.getInheritType(), UserGroupInheritTypeEnums.INHERIT_ALL.getValue()))
                .map(IamUserGroup::getLevelPath)
                .collect(Collectors.toList());
        Set<String> tempStrSet = new HashSet<>();
        for (String item : inheritAllLevelPath) {
            List<String> split = StrUtil.splitTrim(item, ".");
            tempStrSet.addAll(CollectionUtil.newHashSet(split));
        }
        Set<Long> longs = tempStrSet.stream().map(Long::valueOf).collect(Collectors.toSet());
        Set<Long> userGroupIdSets = new HashSet<>(collect);
        userGroupIdSets.addAll(longs);
        return userGroupIdSets;
    }

    @Override
    public List<UserGroupTreeVO> getTree(UserGroupQueryDTO dto) {
        List<IamUserGroup> list = Optional.ofNullable(this.list()).orElseGet(ArrayList::new);
        return list.stream().map(assembleUserGroupUserGroupTreeVO()).collect(Collectors.toList());
    }

    @Override
    public List<UserGroupBaseVO> listAllVos() {
        LambdaQueryWrapper<IamUserGroup> queryWrapper = new LambdaQueryWrapper<IamUserGroup>()
                .orderByAsc(IamUserGroup::getGmtCreate)
                .orderByAsc(IamUserGroup::getLevel);
        return list(queryWrapper).stream()
                .map(this::assembleUserGroupVO)
                .collect(Collectors.toList());
    }

    @Override
    public List<String> getUserGroupNamesByUserId(Long userId) {
        return this.baseMapper.selectUserGroupNamesByUserId(userId);
    }

    @Override
    public void removeUserGroupUserRelByUserId(Long userId) {
        LambdaQueryWrapper<IamUserGroupUserRel> qw = new LambdaQueryWrapper<>();
        qw.eq(IamUserGroupUserRel::getUserId, userId);
        iamUserGroupUserRelMapper.delete(qw);
    }

    @Override
    public UserGroupDetailVO getUserGroupVOById(Long id) {
        IamUserGroup userGroup = getUserGroupById(id);
        return beanConverter.convertToUserGroupDetailVO(userGroup);
    }

    @Override
    public void removeUserGroupById(Long id) {
        IamUserGroup route = getUserGroupById(id);
        List<Long> ids = getChildRoutes(route).stream().map(IamUserGroup::getId).collect(Collectors.toList());
        removeRouteByIds(ids);
    }

    private List<IamUserGroup> getChildRoutes(IamUserGroup route) {
        LambdaQueryWrapper<IamUserGroup> wrapper = new LambdaQueryWrapper<IamUserGroup>()
                .likeRight(IamUserGroup::getLevelPath, route.getLevelPath());
        return this.list(wrapper);
    }

    private void removeRouteByIds(List<Long> ids) {
        for (Long item : ids) {
            LambdaUpdateWrapper<IamUserGroup> qw = new LambdaUpdateWrapper<>();
            qw.eq(IamUserGroup::getIsDeleted, DeletedEnums.NOT.getCode());
            qw.eq(IamUserGroup::getId, item);
            qw.set(IamUserGroup::getIsDeleted, item);
            this.update(qw);
        }
    }


    private Function<IamUserGroup, UserGroupTreeVO> assembleUserGroupUserGroupTreeVO() {
        return item -> {
            UserGroupTreeVO userGroupTreeVO = new UserGroupTreeVO();
            userGroupTreeVO.setTitle(item.getName());
            userGroupTreeVO.setKey(String.valueOf(item.getId()));
            return userGroupTreeVO;
        };
    }

    private UserGroupBaseVO assembleUserGroupVO(IamUserGroup item) {
        UserGroupBaseVO vo = new UserGroupBaseVO();
        vo.setId(item.getId());
        vo.setPid(item.getPid());
        vo.setName(item.getName());
        vo.setLevel(item.getLevel());
        vo.setStatus(item.getStatus());
        return vo;
    }

}
