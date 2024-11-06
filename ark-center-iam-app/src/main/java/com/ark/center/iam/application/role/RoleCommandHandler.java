package com.ark.center.iam.application.role;


import com.ark.center.iam.application.role.executor.RoleCreateCmdExe;
import com.ark.center.iam.application.role.executor.RoleDeleteCmdExe;
import com.ark.center.iam.application.role.executor.RoleUpdateCmdExe;
import com.ark.center.iam.client.role.command.RoleCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@RequiredArgsConstructor
public class RoleCommandHandler {

    private final RoleCreateCmdExe roleCreateCmdExe;
    private final RoleUpdateCmdExe roleUpdateCmdExe;
    private final RoleDeleteCmdExe roleDeleteCmdExe;

    @Transactional(rollbackFor = Throwable.class)
    public void save(RoleCommand command) {
        if (command.getId() == null) {
            roleCreateCmdExe.execute(command);
        } else {
            roleUpdateCmdExe.execute(command);
        }
    }
    public void removeRole(Long id) {
        roleDeleteCmdExe.execute(id);
    }

}
