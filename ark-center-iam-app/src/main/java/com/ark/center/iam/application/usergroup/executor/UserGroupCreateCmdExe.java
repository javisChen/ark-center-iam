package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.usergroup.service.UserGroupCheckService;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupBizTreeService;
import com.ark.component.tree.dto.HierarchyCommand;
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
    private final UserGroupBizTreeService userGroupHierarchyService;

    public void execute(UserGroupCommand command) {

        userGroupCheckService.ensureNameNotExists(command.getName(), command.getId());

        UserGroup userGroup = userGroupAssembler.convertToDO(command);
        userGroupService.save(userGroup);

        userGroupHierarchyService.addNode(new HierarchyCommand(userGroup.getId(), command.getParentId()));

        assignRolesToUserGroup(userGroup.getId(), command.getRoleIds());
    }

    private void assignRolesToUserGroup(Long userGroupId, List<Long> roleIds) {
        userGroupAssignService.assignRolesToUserGroups(userGroupId, roleIds);
    }

}
