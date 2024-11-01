package com.ark.center.iam.application.usergroup;

import com.ark.center.iam.application.usergroup.executor.UserGroupCreateCmdExe;
import com.ark.center.iam.application.usergroup.executor.UserGroupDeleteCmdExe;
import com.ark.center.iam.application.usergroup.executor.UserGroupUpdateCmdExe;
import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserGroupCommandHandler {

    private final UserGroupCreateCmdExe userGroupCreateCmdExe;
    private final UserGroupUpdateCmdExe userGroupUpdateCmdExe;
    private final UserGroupDeleteCmdExe userGroupDeleteCmdExe;

    @Transactional(rollbackFor = Throwable.class)
    public void createUserGroup(UserGroupCommand command) {
        userGroupCreateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateUserGroup(UserGroupCommand command) {
        userGroupUpdateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void removeUserGroup(Long id) {
        userGroupDeleteCmdExe.execute(id);
    }
}
