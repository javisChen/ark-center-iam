package com.ark.center.iam.infra.permission.gateway.db;

import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 权限表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface PermissionMapper extends BaseMapper<Permission> {

    List<Permission> selectByRoleIdsAndType(@Param("roleIds") List<Long> roleIds,
                                            @Param("type") String type);

    List<Permission> selectByRoleIdAndType(@Param("applicationId") Long applicationId,
                                           @Param("roleId") Long roleId,
                                           @Param("type") String type);

    List<ApiPermissionVO> selectApiPermissionByIds(@Param("permissionIds") List<Long> permissionIds);

    /**
     * 根据角色id和应用id查询api权限
     */
    List<ApiPermissionVO> selectApiPermissionsByRoleIds(
                                                                       @Param("roleIds") List<Long> roleIdSet);
}
