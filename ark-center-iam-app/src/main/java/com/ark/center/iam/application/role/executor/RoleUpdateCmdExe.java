package com.ark.center.iam.application.role.executor;

import com.ark.center.iam.model.role.command.RoleCreateCommand;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.domain.role.service.RoleChecker;
import com.ark.center.iam.infra.role.converter.RoleDomainConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleUpdateCmdExe {

    private final RoleDomainConverter roleDomainConverter;
    private final RoleRepository roleRepository;
    private final RoleChecker roleChecker;

    public void execute(RoleCreateCommand cmd) {

        baseCheck(cmd);

        Role role = roleDomainConverter.toRoleDO(cmd);

        roleRepository.updateByRoleId(role);

    }

    private void baseCheck(RoleCreateCommand cmd) {

        roleChecker.ensureNameNotExists(cmd.getName(), cmd.getId());

        roleChecker.ensureCodeNotExists(cmd.getCode(), cmd.getId());

    }

}
