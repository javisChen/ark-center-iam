package com.ark.center.iam.application.role;


import com.ark.center.iam.application.role.executor.RoleDeleteCmdExe;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.RoleDomainService;
import com.ark.center.iam.domain.role.RoleFactory;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.model.role.command.RoleCreateCommand;
import com.ark.center.iam.model.role.command.RoleUpdateCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class RoleCommandHandler {

    private final RoleDeleteCmdExe roleDeleteCmdExe;
    private final RoleFactory roleFactory;
    private final RoleRepository roleRepository;
    private final RoleDomainService roleDomainService;

    public void createRole(RoleCreateCommand command) {

        Role role = roleFactory.create(command.getName(), command.getCode());

        roleRepository.saveAndPublishEvents(role);
    }

    public void updateRole(RoleUpdateCommand command) {

        Role role = roleRepository.byIdOrThrowError(command.getId());

        roleDomainService.update(role, command.getName(), command.getCode());

        roleRepository.saveAndPublishEvents(role);

    }

    public void removeRole(Long id) {
        Role role = roleRepository.byIdOrThrowError(id);

        roleRepository.deleteAndPublishEvents(role);
    }

}
