package com.ark.center.iam.application.role.executor;

import com.ark.center.iam.client.role.command.RoleCommand;
import com.ark.center.iam.infra.role.Role;
import com.ark.center.iam.infra.role.service.RoleCheckService;
import com.ark.center.iam.infra.role.assembler.RoleAssembler;
import com.ark.center.iam.infra.role.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleUpdateCmdExe {

    private final RoleAssembler roleAssembler;
    private final RoleService roleService;
    private final RoleCheckService roleCheckService;

    public void execute(RoleCommand cmd) {

        baseCheck(cmd);

        Role role = roleAssembler.toRoleDO(cmd);

        roleService.updateById(role);

    }

    private void baseCheck(RoleCommand cmd) {

        roleCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        roleCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());

    }

}
