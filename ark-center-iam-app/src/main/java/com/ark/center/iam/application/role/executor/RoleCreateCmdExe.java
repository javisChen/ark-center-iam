package com.ark.center.iam.application.role.executor;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.client.role.command.RoleCommand;
import com.ark.center.iam.infra.role.Role;
import com.ark.center.iam.infra.role.service.RoleCheckService;
import com.ark.center.iam.infra.role.assembler.RoleAssembler;
import com.ark.center.iam.infra.role.service.RoleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class RoleCreateCmdExe {

    private final RoleService roleService;

    private final RoleAssembler roleAssembler;

    private final RoleCheckService roleCheckService;

    public void execute(RoleCommand cmd) {

        baseCheck(cmd);

        initRole(cmd);

        save(cmd);
    }

    private void initRole(RoleCommand cmd) {
        if (StringUtils.isBlank(cmd.getCode())) {
            cmd.setCode(generateRoleCode());
        }
    }

    private String generateRoleCode() {
        String code;
        do {
            code = IdUtil.fastSimpleUUID();
        } while (roleService.countByCode(code) > 0);
        return code;
    }

    private void save(RoleCommand cmd) {

        Role role = roleAssembler.toRoleDO(cmd);

        roleService.save(role);

    }

    private void baseCheck(RoleCommand cmd) {

        roleCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        roleCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());

    }
}
