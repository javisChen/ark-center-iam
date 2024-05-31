package com.ark.center.iam.infra.user.db;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class UserDAO extends ServiceImpl<UserMapper, User> {

    private final UserBeanConverter beanConverter;

    public Page<UserPageDTO> selectUsers(UserPageQuery pageQry) {
        LambdaQueryWrapper<User> qw = new LambdaQueryWrapper<User>()
                .select(BaseEntity::getId,
                        User::getMobile,
                        User::getUsername,
                        User::getStatus,
                        BaseEntity::getCreateTime,
                        BaseEntity::getUpdateTime)
                .like(StrUtil.isNotBlank(pageQry.getMobile()), User::getMobile, pageQry.getMobile())
                .like(StrUtil.isNotBlank(pageQry.getUsername()), User::getUsername, pageQry.getUsername())
                .orderByDesc(BaseEntity::getCreateTime);
        IPage<User> result = this.page(new Page<>(pageQry.getCurrent(), pageQry.getSize()), qw);
        List<User> records = result.getRecords();
        List<UserPageDTO> vos = records.stream().map(beanConverter::toUserPageDTO).collect(Collectors.toList());
        Page<UserPageDTO> pageVo = new Page<>(result.getCurrent(), result.getSize(), result.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }



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

    public User selectByUserCode(String userCode) {
        return lambdaQuery()
                .eq(User::getCode, userCode)
                .one();
    }

    public User selectByMobile(String mobile) {
        return lambdaQuery()
                .eq(User::getMobile, mobile)
                .last("limit 1")
                .one();
    }

    public User selectByUsername(String username) {
        return lambdaQuery()
                .eq(User::getUsername, username)
                .last("limit 1")
                .one();
    }


    public List<User> selectByRoleId(Long roleId) {
        return baseMapper.selectByRoleId(roleId);
    }

}
