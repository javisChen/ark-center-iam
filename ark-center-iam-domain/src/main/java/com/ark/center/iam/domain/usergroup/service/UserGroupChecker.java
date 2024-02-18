package com.ark.center.iam.domain.usergroup.service;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserGroupChecker {

    private final UserGroupRepository userGroupRepository;

    public void ensureNameNotExists(Long id, String name) {
        Assert.isFalse(userGroupRepository.existsByName(id, name),
                ExceptionFactory.userExceptionSupplier("用户组名称已被使用"));
    }

    public void ensureNameNotExists(String name) {
        ensureNameNotExists(null, name);
    }
}
