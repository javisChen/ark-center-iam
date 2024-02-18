package com.ark.center.iam.domain.role;

import com.ark.center.iam.domain.role.service.RoleChecker;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleDomainService {

    private final RoleChecker roleChecker;

    public void update(Role role, String name, String code) {

        roleChecker.ensureCodeNotExists(code, role.getId());

        role.update(name, code);

    }
}
