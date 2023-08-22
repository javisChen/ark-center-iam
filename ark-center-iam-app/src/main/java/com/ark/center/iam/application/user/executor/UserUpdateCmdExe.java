package com.ark.center.iam.application.user.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@RequiredArgsConstructor
@Component
@Slf4j
public class UserUpdateCmdExe {

    private final UserBeanConverter beanConverter;

    private final UserGateway userGateway;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;


    public void execute(UserCmd userCmd) {
        log.info("[User]: Begin Modify User, User = {}", userCmd);
        User user = beanConverter.toUserDO(userCmd);

        // 持久化用户
        persistUser(user);

        // 持久化后一些操作
        postPersistUser(user, userCmd);

        // todo 发布事件
    }

    private void postPersistUser(User user, UserCmd userCmd) {
        Long userId = user.getId();

        // 分配角色
        assignRoles(userId, userCmd.getRoleIds());

        // 分配用户组
        assignUserGroups(userId, userCmd.getUserGroupIds());
    }

    private void assignUserGroups(Long userId, List<Long> userGroupIds) {
        userGroupAssignService.clearUserAndUserGroupRelations(userId);

        if (CollectionUtil.isNotEmpty(userGroupIds)) {
            userGroupAssignService.assignUserGroupsToUser(userId, userGroupIds);
        }
    }

    private void assignRoles(Long userId, List<Long> roleIds) {
        roleAssignService.clearUserRoles(userId);

        if (CollectionUtil.isNotEmpty(roleIds)) {
            roleAssignService.assignUserRoles(userId, roleIds);
        }
    }

    private void persistUser(User user) {
        User toUpdateUser = new User();
        toUpdateUser.setId(user.getId());
        toUpdateUser.setUsername(user.getUsername());
        toUpdateUser.setStatus(user.getStatus());
        userGateway.updateByUserId(toUpdateUser);
    }

}
