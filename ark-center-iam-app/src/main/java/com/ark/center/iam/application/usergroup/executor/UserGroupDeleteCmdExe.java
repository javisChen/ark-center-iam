package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.gateway.UserGroupGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupDeleteCmdExe {

    private final UserGroupGateway userGroupGateway;

    public void execute(Long id) {
        UserGroup userGroup = userGroupGateway.selectById(id);
        List<Long> ids = userGroupGateway.selectSubUserGroups(userGroup.getLevelPath()).stream().map(UserGroup::getId).toList();
        userGroupGateway.logicDelete(ids);
    }
}
