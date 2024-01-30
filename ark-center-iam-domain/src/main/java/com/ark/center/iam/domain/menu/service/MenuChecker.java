package com.ark.center.iam.domain.menu.service;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MenuChecker {

    private final MenuRepository menuRepository;

    public void ensureNameNotExists(String name) {
        Assert.isFalse(menuRepository.existsByName(name),
                ExceptionFactory.userExceptionSupplier("菜单名称已存在"));
    }

    public void ensureCodeNotExists(String code) {
        Assert.isFalse(menuRepository.existsByCode(code),
                ExceptionFactory.userExceptionSupplier("菜单编码已存在"));
    }

    public void ensureNameNotExists(Long menuId, String name) {
        Assert.isFalse(menuRepository.existsByName(menuId, name),
                ExceptionFactory.userExceptionSupplier("菜单名称已存在"));
    }

    public void ensureCodeNotExists(Long menuId, String code) {
        Assert.isFalse(menuRepository.existsByCode(menuId, code),
                ExceptionFactory.userExceptionSupplier("菜单编码已存在"));
    }
}
