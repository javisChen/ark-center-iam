package com.ark.center.iam.infra.user.db;

import com.ark.center.iam.domain.user.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface UserMapper extends BaseMapper<User> {

    List<User> selectByRoleId(@Param("roleId") Long roleId);
}
