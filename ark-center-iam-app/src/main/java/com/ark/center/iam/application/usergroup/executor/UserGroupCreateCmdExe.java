package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.usergroup.service.UserGroupCheckService;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupTreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupCreateCmdExe {

    private final UserGroupAssembler userGroupAssembler;
    private final UserGroupService userGroupService;
    private final UserGroupCheckService userGroupCheckService;
    private final UserGroupAssignService userGroupAssignService;
    private final UserGroupTreeService userGroupTreeService;

    public void execute(UserGroupCommand command) {

        userGroupCheckService.ensureNameNotExists(command.getName(), command.getId());

        UserGroup userGroup = userGroupAssembler.convertToDO(command);
        userGroupService.insert(userGroup);

        userGroupTreeService.addNode(command);

        assignRoleUserGroup(userGroup.getId(), command.getRoleIds());
    }

    private void assignRoleUserGroup(Long userGroupId, List<Long> roleIds) {
        userGroupAssignService.assignUserGroupsToRoles(userGroupId, roleIds);
    }

}
