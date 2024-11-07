package com.ark.center.iam.application.role;


import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQuery;
import com.ark.center.iam.infra.role.service.RoleService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RoleQueryService {

    private final RoleService roleService;

    public IPage<RoleBaseDTO> pageQuery(RoleQuery dto) {
        return roleService.selectPages(dto);
    }

    public List<RoleBaseDTO> queryList() {
        return roleService.selectList();
    }

    public RoleBaseDTO byId(Long id) {
        return roleService.selectById(id);
    }


}
