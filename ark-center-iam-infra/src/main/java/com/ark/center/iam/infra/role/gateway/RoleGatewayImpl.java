package com.ark.center.iam.infra.role.gateway;

import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.infra.role.gateway.db.IamRole;
import com.ark.center.iam.infra.role.gateway.db.IamRoleMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

@Repository
public class RoleGatewayImpl extends ServiceImpl<IamRoleMapper, IamRole> implements RoleGateway {

}
