package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.client.usergroup.command.UserGroupCmd;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.gateway.UserGroupGateway;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.usergroup.service.UserGroupCheckService;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserGroupUpdateCmdExe {

    private final UserGroupAssembler userGroupAssembler;
    private final UserGroupGateway userGroupGateway;
    private final UserGroupCheckService userGroupCheckService;
    private final UserGroupAssignService userGroupAssignService;
    public void execute(UserGroupCmd cmd) {
        UserGroup userGroup = userGroupAssembler.convertToDO(cmd);
        userGroupGateway.updateByUserGroupId(userGroup);

        Long userGroupId = userGroup.getId();
        // 清除用户角色和用户组的关联关系
        userGroupAssignService.clearRoleAndUserGroupRelations(userGroupId);
        // 重新绑定用户角色和用户组的关联关系
        userGroupAssignService.assignUserGroupsToRoles(userGroupId, cmd.getRoleIds());
    }
}
