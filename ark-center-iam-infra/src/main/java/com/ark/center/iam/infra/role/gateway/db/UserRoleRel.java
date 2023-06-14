package com.ark.center.iam.infra.role.gateway.db;


import com.baomidou.mybatisplus.annotation.TableField;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户角色关联表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_user_role_rel")
public class UserRoleRel extends BaseEntity {

    

    /**
     * 用户id，关联iam_role.id
     */
    @TableField("user_id")
    private Long userId;

    /**
     * 角色id，关联iam_role.id
     */
    @TableField("role_id")
    private Long roleId;


}
