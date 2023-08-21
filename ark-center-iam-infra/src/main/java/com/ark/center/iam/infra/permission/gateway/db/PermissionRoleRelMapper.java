package com.ark.center.iam.infra.permission.gateway.db;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionRoleRelMapper extends BaseMapper<PermissionRoleRel> {

    void batchInsert(@Param("roleId") Long roleId,
                     @Param("permissionIds") List<Long> permissionIds);

    List<String> selectRoleNamesByUserId(@Param("userId") Long userId);

    List<Long> selectRoleIdsByUserGroupId(@Param("userGroupId") Long userGroupId);

    List<String> selectRoleNamesByUserGroupId(@Param("userGroupId") Long userGroupId);

    List<PermissionRoleRel> selectByRoleIdAndType(@Param("applicationId") Long applicationId,
                                                  @Param("roleId") Long roleId,
                                                  @Param("type") String type);

    /**
     * 根据应用id+角色id+权限id查询关联表数据
     */
    List<PermissionRoleRel> selectByPermissionIdAndRoleId(@Param("applicationId") Long applicationId,
                                                          @Param("roleId") Long roleId,
                                                          @Param("permissionIds") List<Long> toRemoveApiPermissionIds);
}
