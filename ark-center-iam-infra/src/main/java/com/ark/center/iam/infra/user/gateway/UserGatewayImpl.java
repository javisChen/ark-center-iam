package com.ark.center.iam.infra.user.gateway;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.vo.UserPageDTO;
import com.ark.center.iam.domain.user.entity.IamUser;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.infra.user.gateway.db.IamUserMapper;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.util.bean.BeanConvertor;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
public class UserGatewayImpl extends ServiceImpl<IamUserMapper, IamUser> implements UserGateway {

    @Autowired
    private BeanConvertor beanConverter;

    @Override
    public Page<UserPageDTO> selectUsers(UserPageQry pageQry) {
        LambdaQueryWrapper<IamUser> qw = new LambdaQueryWrapper<IamUser>()
                .like(StrUtil.isNotBlank(pageQry.getPhone()), IamUser::getPhone, pageQry.getPhone())
                .like(StrUtil.isNotBlank(pageQry.getName()), IamUser::getUserName, pageQry.getName())
                .select(BaseEntity::getId, IamUser::getPhone, IamUser::getUserName, IamUser::getStatus);
        IPage<IamUser> result = this.page(new Page<>(pageQry.getCurrent(), pageQry.getSize()), qw);
        List<IamUser> records = result.getRecords();
        List<UserPageDTO> vos = records.stream().map(beanConverter::convertToUserPageListVO).collect(Collectors.toList());
        Page<UserPageDTO> pageVo = new Page<>(result.getCurrent(), result.getSize(), result.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }

    @Override
    public boolean insert(IamUser iamUser) {
        return save(iamUser);
    }

    @Override
    public Long countUserByCode(String code) {
        return lambdaQuery()
                .eq(IamUser::getCode, code)
                .count();
    }

    @Override
    public Long countUserByPhone(String phone) {
        return lambdaQuery()
                .eq(IamUser::getCode, phone)
                .count();
    }

}
