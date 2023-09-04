package com.ark.center.iam.infra.user.gateway;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.center.iam.infra.user.gateway.db.UserMapper;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class UserGatewayImpl extends ServiceImpl<UserMapper, User> implements UserGateway {

    private final UserBeanConverter beanConverter;

    @Override
    public Page<UserPageDTO> selectUsers(UserPageQry pageQry) {
        LambdaQueryWrapper<User> qw = new LambdaQueryWrapper<User>()
                .like(StrUtil.isNotBlank(pageQry.getMobile()), User::getMobile, pageQry.getMobile())
                .like(StrUtil.isNotBlank(pageQry.getUsername()), User::getUsername, pageQry.getUsername())
                .select(BaseEntity::getId, User::getMobile, User::getUsername, User::getStatus);
        IPage<User> result = this.page(new Page<>(pageQry.getCurrent(), pageQry.getSize()), qw);
        List<User> records = result.getRecords();
        List<UserPageDTO> vos = records.stream().map(beanConverter::toUserPageDTO).collect(Collectors.toList());
        Page<UserPageDTO> pageVo = new Page<>(result.getCurrent(), result.getSize(), result.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }

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
    public User selectByUserCode(String userCode) {
        return lambdaQuery()
                .eq(User::getCode, userCode)
                .one();
    }

    @Override
    public User selectByMobile(String mobile) {
        return lambdaQuery()
                .eq(User::getMobile, mobile)
                .last("limit 1")
                .one();
    }

    @Override
    public User selectByUsername(String username) {
        return lambdaQuery()
                .eq(User::getUsername, username)
                .last("limit 1")
                .one();
    }

    @Override
    public List<User> selectByRoleId(Long roleId) {
        return baseMapper.selectByRoleId(roleId);
    }

}
