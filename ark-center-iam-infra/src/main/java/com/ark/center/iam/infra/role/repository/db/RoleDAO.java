package com.ark.center.iam.infra.role.repository.db;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.infra.role.converter.RoleAppConverter;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import com.ark.center.iam.model.role.query.RoleQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleDAO extends ServiceImpl<RoleMapper, RoleDO> {

    private final RoleAppConverter roleAppConverter;

    public IPage<RoleBaseDTO> queryPages(RoleQuery query) {
        return lambdaQuery()
                .like(StrUtil.isNotBlank(query.getName()), RoleDO::getName, query.getName())
                .page(new Page<>(query.getCurrent(), query.getSize()))
                .convert(roleAppConverter::toRoleBaseDTO);
    }

    public List<RoleBaseDTO> queryAll() {
        return lambdaQuery()
                .list()
                .stream().map(roleAppConverter::toRoleBaseDTO)
                .toList();
    }

    public RoleDO queryById(Long id) {
        return getById(id);
    }
}
