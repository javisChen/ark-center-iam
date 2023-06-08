package com.ark.center.iam.infra.permission.gateway.db;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 角色与权限关联表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface PermissionRoleRelMapper extends BaseMapper<PermissionRoleRel> {

    void batchInsert(@Param("roleId") Long roleId,
                     @Param("permissionIds") List<Long> permissionIds);

    List<String> selectRoleNamesByUserId(@Param("userId") Long userId);
    List<Long> selectRoleIdsByUserGroupId(@Param("userGroupId") Long userGroupId);

    List<String> selectRoleNamesByUserGroupId(@Param("userGroupId") Long userGroupId);
}
