package com.ark.center.iam.infra.user.repository.db;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.infra.user.converter.UserAppConverter;
import com.ark.center.iam.model.user.dto.UserPageDTO;
import com.ark.center.iam.model.user.query.UserPageQuery;
import com.ark.center.iam.model.user.query.UserQuery;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserDAO extends ServiceImpl<UserMapper, UserDO> {

    private final UserAppConverter appConverter;

    public IPage<UserPageDTO> selectUsers(UserPageQuery query) {
        return lambdaQuery()
                .select(BaseEntity::getId,
                        UserDO::getMobile,
                        UserDO::getUsername,
                        UserDO::getStatus,
                        UserDO::getCode)
                .like(StrUtil.isNotBlank(query.getMobile()), UserDO::getMobile, query.getMobile())
                .like(StrUtil.isNotBlank(query.getUsername()), UserDO::getUsername, query.getUsername())
                .page(Page.of(query.getCurrent(), query.getSize()))
                .convert(appConverter::toUserPageDTO);
    }

    public UserDO selectByUnique(UserQuery userQuery) {
        String mobile = userQuery.getMobile();
        String username = userQuery.getUsername();
        LambdaQueryChainWrapper<UserDO> lambdaQuery = lambdaQuery();
        if (StringUtils.isNotBlank(mobile)) {
            lambdaQuery.eq(UserDO::getMobile, mobile);
        } else if (StringUtils.isNotBlank(username)) {
            lambdaQuery.eq(UserDO::getUsername, username);
        }
        return lambdaQuery
                .last("limit 1")
                .one();
    }

    public List<UserDO> selectByRoleId(Long roleId) {
        return baseMapper.selectByRoleId(roleId);
    }

}
