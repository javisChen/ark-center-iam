package com.ark.center.iam.dao.mapper;

import com.ark.center.iam.dao.entity.IamUserGroup;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户组表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IamUserGroupMapper extends BaseMapper<IamUserGroup> {

    List<Long> selectUserGroupIdsByUserId(@Param("userId") Long userId);

    List<String> selectUserGroupNamesByUserId(@Param("userId") Long userId);
}
