package com.ark.center.iam.application.user.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.user.command.UserCommand;
import com.ark.center.iam.infra.role.service.RoleAssignService;
import com.ark.center.iam.infra.user.User;
import com.ark.center.iam.infra.user.gateway.UserGateway;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
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


    public void execute(UserCommand userCommand) {
        log.info("[User]: Begin update user, User = {}", userCommand);
        User user = beanConverter.toUserDO(userCommand);
        // 更新用户禁止修改密码
        user.setPassword(null);

        // 持久化用户
        persistUser(user);

        // 持久化后一些操作
        postPersistUser(user, userCommand);

        // todo 发布事件
    }

    private void postPersistUser(User user, UserCommand userCommand) {
        Long userId = user.getId();

        // 分配角色
        assignRoles(userId, userCommand.getRoleIds());

        // 分配用户组
        assignUserGroups(userId, userCommand.getUserGroupIds());
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
        User forUpdate = new User();
        forUpdate.setId(user.getId());
        forUpdate.setUsername(user.getUsername());
        forUpdate.setMobile(user.getMobile());
        forUpdate.setStatus(user.getStatus());
        userGateway.updateByUserId(forUpdate);
    }

}
