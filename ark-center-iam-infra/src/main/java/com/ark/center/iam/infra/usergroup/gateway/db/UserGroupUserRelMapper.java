package com.ark.center.iam.infra.usergroup.gateway.db;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户组与用户关联表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface UserGroupUserRelMapper extends BaseMapper<UserGroupUserRel> {

    int insertBatch(@Param("list") List<UserGroupUserRel> list);

    int deleteByUserIdsAndUserGroupId(@Param("userGroupId") Long userGroupId, @Param("userIds") List<Long> userIds);


    void batchSaveRelation(@Param("userId") Long userId, @Param("userGroupIds") List<Long> userGroupIds);
}
