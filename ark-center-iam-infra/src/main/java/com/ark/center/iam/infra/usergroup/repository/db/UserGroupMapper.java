package com.ark.center.iam.infra.usergroup.repository.db;

import com.ark.center.iam.domain.usergroup.vo.UserGroupVO;
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
public interface UserGroupMapper extends BaseMapper<UserGroupDO> {

    List<Long> selectUserGroupIdsByUserId(@Param("userId") Long userId);

    List<UserGroupDO> selectByUserId(@Param("userId") Long userId);

    List<UserGroupVO> selectByUserIds(@Param("userIds") List<Long> userIds);
}