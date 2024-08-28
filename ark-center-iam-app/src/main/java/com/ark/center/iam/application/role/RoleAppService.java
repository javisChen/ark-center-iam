package com.ark.center.iam.application.role;


import com.ark.center.iam.application.role.executor.RoleCreateCmdExe;
import com.ark.center.iam.application.role.executor.RoleDeleteCmdExe;
import com.ark.center.iam.application.role.executor.RoleUpdateCmdExe;
import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.center.iam.infra.role.gateway.RoleGateway;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RoleAppService {

    private final RoleCreateCmdExe roleCreateCmdExe;
    private final RoleUpdateCmdExe roleUpdateCmdExe;
    private final RoleDeleteCmdExe roleDeleteCmdExe;
    private final RoleGateway roleGateway;

    public IPage<RoleBaseDTO> pageQuery(RoleQry dto) {
        return roleGateway.selectPages(dto);
    }

    public List<RoleBaseDTO> queryList() {
        return roleGateway.selectList();
    }

    public void createRole(RoleCmd cmd) {
        roleCreateCmdExe.execute(cmd);
    }

    public void updateRole(RoleCmd cmd) {
        roleUpdateCmdExe.execute(cmd);
    }

    public RoleBaseDTO queryRole(Long id) {
        return roleGateway.selectById(id);
    }

    public void removeRole(Long id) {
        roleDeleteCmdExe.execute(id);
    }

}
