package com.ark.center.iam.infra.usergroup.gateway.db;


import com.baomidou.mybatisplus.annotation.TableField;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户组与用户关联表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_user_group_user_rel")
public class UserGroupUserRel extends BaseEntity {

    

    /**
     * 用户组名称，关联iam_user_group.id
     */
    @TableField("user_group_id")
    private Long userGroupId;

    /**
     * 用户id，关联iam_user_id
     */
    @TableField("user_id")
    private Long userId;


}
