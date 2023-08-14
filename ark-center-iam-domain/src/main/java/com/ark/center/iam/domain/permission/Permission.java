package com.ark.center.iam.domain.permission;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 权限表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_permission")
public class Permission extends BaseEntity {


    @TableField("application_id")
    private Long applicationId;

    /**
     * 权限类型 FRONT_ROUTE-前端路由；PAGE_ELEMENT-页面元素；FILE-文件；INTERNAL_API-内部服务API；OPEN_API-开放API
     */
    @TableField("type")
    private String type;

    /**
     * 权限编码
     */
    @TableField("code")
    private String code;

    /**
     * 权限编码
     */
    @TableField("resource_id")
    private Long resourceId;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private Integer status;

    @TableField(value = "is_deleted")
    @TableLogic
    private Long isDeleted;
}
