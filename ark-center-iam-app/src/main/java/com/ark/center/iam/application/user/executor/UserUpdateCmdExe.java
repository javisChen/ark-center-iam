//package com.ark.center.iam.application.user.executor;
//
//import cn.hutool.core.collection.CollectionUtil;
//import com.ark.center.iam.model.user.command.UserCreateCommand;
//import com.ark.center.iam.domain.role.service.RoleAssignService;
//import com.ark.center.iam.domain.user.User;
//import com.ark.center.iam.domain.user.repository.UserRepository;
//import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
//import com.ark.center.iam.infra.user.converter.UserDomainConverter;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Component;
//
//import java.util.List;
//
//@RequiredArgsConstructor
//@Component
//@Slf4j
//public class UserUpdateCmdExe {
//
//    private final UserDomainConverter beanConverter;
//
//    private final UserRepository userRepository;
//
//    private final RoleAssignService roleAssignService;
//
//    private final UserGroupAssignService userGroupAssignService;
//
//
//    public void execute(UserCreateCommand userCreateCommand) {
//        log.info("[User]: Begin Modify User, User = {}", userCreateCommand);
//        User user = beanConverter.toUserDO(userCreateCommand);
//
//        // 持久化用户
//        persistUser(user);
//
//        // 持久化后一些操作
//        postPersistUser(user, userCreateCommand);
//
//        // todo 发布事件
//    }
//
//    private void postPersistUser(User user, UserCreateCommand userCreateCommand) {
//        Long userId = user.getId();
//
//        // 分配角色
//        assignRoles(userId, userCreateCommand.getRoleIds());
//
//        // 分配用户组
//        assignUserGroups(userId, userCreateCommand.getUserGroupIds());
//    }
//
//    private void assignUserGroups(Long userId, List<Long> userGroupIds) {
//        userGroupAssignService.clearUserAndUserGroupRelations(userId);
//
//        if (CollectionUtil.isNotEmpty(userGroupIds)) {
//            userGroupAssignService.assignUserGroupsToUser(userId, userGroupIds);
//        }
//    }
//
//    private void assignRoles(Long userId, List<Long> roleIds) {
//        roleAssignService.clearUserRoles(userId);
//
//        if (CollectionUtil.isNotEmpty(roleIds)) {
//            roleAssignService.assignUserRoles(userId, roleIds);
//        }
//    }
//
//    private void persistUser(User user) {
//        User toUpdateUser = new User();
//        toUpdateUser.setId(user.getId());
//        toUpdateUser.setUsername(user.getUsername());
//        toUpdateUser.setStatus(user.getStatus());
//        userRepository.updateByUserId(toUpdateUser);
//    }
//
//}
