package com.ark.center.iam.infra.role.gateway.db;

import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface RoleMapper extends BaseMapper<Role> {


    List<UserRoleVO> selectRolesByUserIds(@Param("userIds") List<Long> userIds);
}
