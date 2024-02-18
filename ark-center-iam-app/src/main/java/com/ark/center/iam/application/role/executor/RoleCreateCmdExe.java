package com.ark.center.iam.application.role.executor;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.model.role.command.RoleCreateCommand;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.domain.role.service.RoleChecker;
import com.ark.center.iam.infra.role.converter.RoleDomainConverter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class RoleCreateCmdExe {

    private final RoleRepository roleRepository;

    private final RoleDomainConverter roleDomainConverter;

    private final RoleChecker roleChecker;

    public void execute(RoleCreateCommand cmd) {

        baseCheck(cmd);

        initRole(cmd);

        save(cmd);
    }

    private void initRole(RoleCreateCommand cmd) {
        if (StringUtils.isBlank(cmd.getCode())) {
            cmd.setCode(generateRoleCode());
        }
    }

    private String generateRoleCode() {
        String code;
        do {
            code = IdUtil.fastSimpleUUID();
        } while (roleRepository.countByCode(code) > 0);
        return code;
    }

    private void save(RoleCreateCommand cmd) {

        Role role = roleDomainConverter.toRoleDO(cmd);

        roleRepository.insert(role);

    }

    private void baseCheck(RoleCreateCommand cmd) {

        roleChecker.ensureNameNotExists(cmd.getName(), cmd.getId());

        roleChecker.ensureCodeNotExists(cmd.getCode(), cmd.getId());

    }
}
