package com.ark.center.iam.domain.role.service;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class RoleChecker {

    private final RoleRepository roleRepository;

    public void ensureCodeNotExists(String code, Long roleId) {
        Assert.isFalse(roleRepository.existsByCode(roleId, code),
                ExceptionFactory.userExceptionSupplier("角色编码已存在"));
    }
    public void ensureCodeNotExists(String code) {
        ensureCodeNotExists(code, null);
    }

}
