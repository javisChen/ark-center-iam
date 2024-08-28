package com.ark.center.iam.application.usergroup.executor;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.usergroup.command.UserGroupCmd;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.gateway.UserGroupGateway;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.usergroup.service.UserGroupCheckService;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupCreateCmdExe {

    private final UserGroupAssembler userGroupAssembler;
    private final UserGroupGateway userGroupGateway;
    private final UserGroupCheckService userGroupCheckService;
    private final UserGroupAssignService userGroupAssignService;

    public void execute(UserGroupCmd cmd) {

        userGroupCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        UserGroup userGroup = userGroupAssembler.convertToDO(cmd);

        UserGroup parentRoute = null;
        if (userGroup.isFirstLevel()) {
            userGroup.setLevel(UserGroup.FIRST_LEVEL);
        } else {
            parentRoute = userGroupGateway.selectById(userGroup.getPid());
            if (parentRoute == null) {
                throw ExceptionFactory.userException("父级用户组不存在");
            }
            userGroup.setLevel(parentRoute.getLevel() + 1);
        }
        userGroupGateway.insert(userGroup);

        // 新增完路由记录后再更新层级信息
        updateLevelPath(userGroup, parentRoute);

        assignRoleUserGroup(userGroup.getId(), cmd.getRoleIds());
    }

    private void updateLevelPath(UserGroup userGroup, UserGroup parentRoute) {
        Long userGroupId = userGroup.getId();
        String levelPath = userGroup.isFirstLevel()
                ? userGroupId + StrUtil.DOT
                : parentRoute.getLevelPath() + userGroupId + StrUtil.DOT;
        UserGroup entity = new UserGroup();
        entity.setId(userGroupId);
        entity.setLevelPath(levelPath);
        userGroupGateway.updateByUserGroupId(entity);
    }


    private void assignRoleUserGroup(Long userGroupId, List<Long> roleIds) {
        userGroupAssignService.assignUserGroupsToRoles(userGroupId, roleIds);
    }

}
