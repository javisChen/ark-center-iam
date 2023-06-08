package com.ark.center.iam.infra.role.gateway.db;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户角色关联表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface UserRoleRelMapper extends BaseMapper<UserRoleRel> {

    /**
     * 批量添加
     */
    void batchInsert(@Param("userId") Long userId,
                     @Param("roleIds") List<Long> roleIds);

    List<Long> selectRoleIdsByUserGroupIds(@Param("userGroupIds") List<Long> userGroupIds);
}
