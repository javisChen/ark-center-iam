package com.ark.center.iam.infra.usergroup.gateway.db;


import com.baomidou.mybatisplus.annotation.TableField;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户组与角色关联表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserGroupRoleRel extends BaseEntity {

    

    /**
     * 用户组id，关联iam_user_group.id
     */
    @TableField("user_group_id")
    private Long userGroupId;

    /**
     * 角色id，关联iam_role.id
     */
    @TableField("role_id")
    private Long roleId;


}
