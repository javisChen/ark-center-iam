package com.ark.center.iam.domain.role.service;

import com.ark.center.iam.domain.role.Role;
import com.ark.component.orm.mybatis.service.CheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class RoleCheckService extends CheckService<Role> {

    public void ensureNameNotExists(String name, Long roleId) {
        ensureRecordNotExists(Role::getName, name, roleId, "角色名称已存在");
    }

    public void ensureCodeNotExists(String code, Long roleId) {
        ensureRecordNotExists(Role::getCode, code, roleId, "角色编码已存在");
    }

}
