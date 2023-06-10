package com.ark.center.iam.application.role;


import com.ark.center.iam.application.role.executor.RoleCreateCmdExe;
import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.center.iam.client.role.dto.RoleListDTO;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RoleAppService {

    private final RoleCreateCmdExe roleCreateCmdExe;
    private final RoleGateway roleGateway;

    public IPage<RoleListDTO> pageQuery(RoleQry dto) {
        return roleGateway.selectPages(dto);
    }

    public List<RoleListDTO> queryList() {
        return roleGateway.selectList();
    }

    public void createRole(RoleCmd cmd) {
        roleCreateCmdExe.execute(cmd);
    }

    private long countRoleByName(String name) {
        LambdaQueryWrapper<IamRole> queryWrapper = new LambdaQueryWrapper<IamRole>()
                .eq(IamRole::getName, name);
        return this.count(queryWrapper);
    }

    private long countRoleByCode(String code) {
        LambdaQueryWrapper<IamRole> queryWrapper = new LambdaQueryWrapper<IamRole>()
                .eq(IamRole::getCode, code);
        return this.count(queryWrapper);
    }
}
