package com.ark.center.iam.infra.user.service;

import com.ark.center.iam.infra.user.User;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.center.iam.infra.user.db.UserMapper;
import com.ark.center.iam.infra.user.service.UserService;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserService extends ServiceImpl<UserMapper, User> {

    private final UserBeanConverter beanConverter;
    
    public Long countUserByCode(String code) {
        return lambdaQuery()
                .eq(User::getCode, code)
                .count();
    }
    
    public Long countUserByMobile(String mobile) {
        return lambdaQuery()
                .eq(User::getCode, mobile)
                .count();
    }
    
    public boolean updateByUserId(User user) {
        return updateById(user);
    }
    
    public User selectByUserId(Long userId) {
        return getById(userId);
    }
    
    public void logicDeleteByUserId(Long userId) {
        LambdaUpdateWrapper<User> qw = new LambdaUpdateWrapper<>();
        qw.eq(User::getId, userId);
        qw.eq(User::getIsDeleted, DeletedEnums.NOT.getCode());
        qw.set(User::getIsDeleted, userId);
        this.update(qw);
    }
    
    public List<User> selectByRoleId(Long roleId) {
        return baseMapper.selectByRoleId(roleId);
    }

}
