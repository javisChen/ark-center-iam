package com.ark.center.iam.infra.user.repository.db;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends BaseMapper<UserDO> {

    List<UserDO> selectByRoleId(@Param("roleId") Long roleId);
}
