package com.ark.center.iam.application.role.executor;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.role.service.RoleCheckService;
import com.ark.center.iam.infra.role.assembler.RoleAssembler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class RoleCreateCmdExe {

    private final RoleGateway roleGateway;
    private final RoleAssembler roleAssembler;

    private final RoleCheckService roleCheckService;

    public void execute(RoleCmd cmd) {

        baseCheck(cmd);

        initRole(cmd);

        save(cmd);
    }

    private void initRole(RoleCmd cmd) {
        if (StringUtils.isBlank(cmd.getCode())) {
            cmd.setCode(generateRoleCode());
        }
    }

    private String generateRoleCode() {
        String code;
        do {
            code = IdUtil.fastSimpleUUID();
        } while (roleGateway.countByCode(code) > 0);
        return code;
    }

    private void save(RoleCmd cmd) {

        Role role = roleAssembler.toRoleDO(cmd);

        roleGateway.insert(role);

    }

    private void baseCheck(RoleCmd cmd) {

        roleCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        roleCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());

    }
}
