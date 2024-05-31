package com.ark.center.iam.infra.user.gateway;

import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.center.iam.infra.user.db.UserMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserGatewayImpl extends ServiceImpl<UserMapper, User> implements UserGateway {

    private final UserBeanConverter beanConverter;

    @Override
    public boolean insert(User user) {
        return save(user);
    }

    @Override
    public Long countUserByCode(String code) {
        return lambdaQuery()
                .eq(User::getCode, code)
                .count();
    }

    @Override
    public Long countUserByMobile(String mobile) {
        return lambdaQuery()
                .eq(User::getCode, mobile)
                .count();
    }

    @Override
    public boolean updateByUserId(User user) {
        return updateById(user);
    }

    @Override
    public User selectByUserId(Long userId) {
        return getById(userId);
    }

    @Override
    public void logicDeleteByUserId(Long userId) {
        LambdaUpdateWrapper<User> qw = new LambdaUpdateWrapper<>();
        qw.eq(User::getId, userId);
        qw.eq(User::getIsDeleted, DeletedEnums.NOT.getCode());
        qw.set(User::getIsDeleted, userId);
        this.update(qw);
    }

    @Override
    public List<User> selectByRoleId(Long roleId) {
        return baseMapper.selectByRoleId(roleId);
    }

}
