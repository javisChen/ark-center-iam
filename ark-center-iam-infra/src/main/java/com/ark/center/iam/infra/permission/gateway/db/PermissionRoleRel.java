package com.ark.center.iam.infra.permission.gateway.db;


import com.baomidou.mybatisplus.annotation.TableField;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 角色与权限关联表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_permission_role_rel")
public class PermissionRoleRel extends BaseEntity {

    

    /**
     * 权限id，关联iam_permission.id
     */
    @TableField("permission_id")
    private Long permissionId;

    /**
     * 角色id，关联iam_role.id
     */
    @TableField("role_id")
    private Long roleId;


}
