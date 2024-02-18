package com.ark.center.iam.domain.role;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.domain.role.service.RoleChecker;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleFactory {

    private final RoleRepository roleRepository;
    private final RoleChecker roleChecker;

    public Role create(String name, String code) {
        roleChecker.ensureCodeNotExists(code);

        if (StringUtils.isBlank(code)) {
            code = generateRoleCode();
        }

        return new Role(name, code);

    }

    private String generateRoleCode() {
        String code  = IdUtil.fastSimpleUUID();
        if (roleRepository.countByCode(code) > 0) {
            code = generateRoleCode();
        }
        return code;
    }

}
