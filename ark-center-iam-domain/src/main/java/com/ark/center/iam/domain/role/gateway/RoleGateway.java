package com.ark.center.iam.domain.role.gateway;

import com.ark.center.iam.client.role.dto.RoleListDTO;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

public interface RoleGateway {
    void insertUserRolesRelations(Long userId, List<Long> roleIds);

    void deleteUserRoleRelations(Long userId);

    List<Long> selectRoleIdsByUserId(Long userId);

    List<Long> selectRoleIdsByUserGroupIds(List<Long> userGroupIds);

    List<UserRoleVO> selectRolesByUserIds(List<Long> userIds);

    IPage<RoleListDTO> selectPages(RoleQry dto);

    List<RoleListDTO> selectList();
}
