package com.ark.center.iam.application.role.executor;

import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.role.service.RoleCheckService;
import com.ark.center.iam.infra.role.assembler.RoleAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleUpdateCmdExe {

    private final RoleAssembler roleAssembler;
    private final RoleGateway roleGateway;
    private final RoleCheckService roleCheckService;

    public void execute(RoleCmd cmd) {

        baseCheck(cmd);

        Role role = roleAssembler.toRoleDO(cmd);

        roleGateway.updateByRoleId(role);

    }

    private void baseCheck(RoleCmd cmd) {

        roleCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        roleCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());

    }

}
