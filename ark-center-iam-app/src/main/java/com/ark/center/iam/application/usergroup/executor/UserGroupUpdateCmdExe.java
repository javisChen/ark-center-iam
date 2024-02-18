//package com.ark.center.iam.application.usergroup.executor;
//
//import com.ark.center.iam.model.usergroup.command.UserGroupCmd;
//import com.ark.center.iam.domain.usergroup.UserGroup;
//import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
//import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
//import com.ark.center.iam.domain.usergroup.service.UserGroupCheckService;
//import com.ark.center.iam.infra.usergroup.converter.UserGroupDomainConverter;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Component;
//
//public class UserGroupUpdateCmdExe {
//
//    private final UserGroupDomainConverter userGroupDomainConverter;
//    private final UserGroupRepository userGroupRepository;
//    private final UserGroupCheckService userGroupCheckService;
//    private final UserGroupAssignService userGroupAssignService;
//    public void execute(UserGroupCmd cmd) {
//        UserGroup userGroup = userGroupDomainConverter.convertToDO(cmd);
//        userGroupRepository.updateByUserGroupId(userGroup);
//
//        Long userGroupId = userGroup.getId();
//        // 清除用户角色和用户组的关联关系
//        userGroupAssignService.clearRoleAndUserGroupRelations(userGroupId);
//        // 重新绑定用户角色和用户组的关联关系
//        userGroupAssignService.assignUserGroupsToRoles(userGroupId, cmd.getRoleIds());
//    }
//}
