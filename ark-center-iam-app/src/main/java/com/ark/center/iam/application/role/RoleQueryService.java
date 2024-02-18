package com.ark.center.iam.application.role;


import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.infra.role.converter.RoleAppConverter;
import com.ark.center.iam.infra.role.converter.RoleDomainConverter;
import com.ark.center.iam.infra.role.repository.db.RoleDAO;
import com.ark.center.iam.infra.role.repository.db.RoleDO;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import com.ark.center.iam.model.role.query.RoleQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RoleQueryService {

    private final RoleRepository roleRepository;
    private final RoleDAO roleDAO;
    private final RoleDomainConverter roleDomainConverter;
    private final RoleAppConverter roleAppConverter;

    public IPage<RoleBaseDTO> queryPages(RoleQuery query) {
        return roleDAO.queryPages(query);
    }

    public List<RoleBaseDTO> queryAll() {
        return roleDAO.queryAll();
    }

    public RoleBaseDTO queryDetails(Long id) {
        RoleDO role = roleDAO.queryById(id);
        return roleAppConverter.toRoleBaseDTO(role);
    }

}
