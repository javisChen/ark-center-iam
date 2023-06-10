package com.ark.center.iam.application.role;


import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.center.iam.client.role.dto.RoleListDTO;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class RoleAppService {

    private final RoleGateway roleGateway;


    public Page<RoleListDTO> pageQuery(RoleQry dto) {
        return roleGateway.selectPages(dto);
    }
}
