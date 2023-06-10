package com.ark.center.iam.application.role.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.user.support.IUserPasswordHelper;
import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.component.exception.ExceptionFactory;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class RoleCreateCmdExe {
    
    private final RoleGateway roleGateway;

    public void execute(RoleCmd cmd) {

        baseCheck(cmd);

        Role role = beanConverter.convertToDO(dto);
        this.save(role);
    }

    private void baseCheck(RoleCmd cmd) {
        long count = countRoleByName(cmd.getName());
        Assert.isTrue(count > 0, BizEnums.ROLE_NAME_ALREADY_EXISTS);
        if (StringUtils.isNotBlank(dto.getCode())) {
            count = countRoleByCode(dto.getCode());
            Assert.isTrue(count > 0, BizEnums.ROLE_CODE_ALREADY_EXISTS);
        } else {
            dto.setCode(generateRoleCode());
        }
    }

    private long countRoleByName(String name) {
        LambdaQueryWrapper<Role> queryWrapper = new LambdaQueryWrapper<Role>()
                .eq(Role::getName, name);
        return this.count(queryWrapper);
    }

    private long countRoleByCode(String code) {
        LambdaQueryWrapper<Role> queryWrapper = new LambdaQueryWrapper<Role>()
                .eq(Role::getCode, code);
        return this.count(queryWrapper);
    }
}
