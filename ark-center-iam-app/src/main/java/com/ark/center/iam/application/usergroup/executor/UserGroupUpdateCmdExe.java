package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.usergroup.service.UserGroupCheckService;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupBizTreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserGroupUpdateCmdExe {

    private final UserGroupAssembler userGroupAssembler;
    private final UserGroupService userGroupService;
    private final UserGroupCheckService userGroupCheckService;
    private final UserGroupAssignService userGroupAssignService;
    private final UserGroupBizTreeService userGroupHierarchyService;
    public void execute(UserGroupCommand command) {
        UserGroup userGroup = userGroupAssembler.convertToDO(command);
        userGroupService.updateByUserGroupId(userGroup);

        userGroupHierarchyService.changeLevel(command.getId(), command.getParentId());

        Long userGroupId = userGroup.getId();
        // 清除用户角色和用户组的关联关系
        userGroupAssignService.clearRoleAndUserGroupRelations(userGroupId);
        // 重新绑定用户角色和用户组的关联关系
        userGroupAssignService.assignRolesToUserGroups(userGroupId, command.getRoleIds());
    }
}
