package com.ark.center.iam.infra.api;

import com.baomidou.mybatisplus.annotation.TableField;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * api表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_api")
public class Api extends BaseEntity {

    

    /**
     * API名称
     */
    @TableField("name")
    private String name;

    /**
     * 应用id
     */
    @TableField("application_id")
    private Long applicationId;

    /**
     * 接口分类id
     */
    @TableField("category_id")
    private Long categoryId;

    /**
     * 接口地址
     */
    @TableField("uri")
    private String uri;

    /**
     * http方法
     */
    @TableField("method")
    private String method;

    /**
     * 认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权
     */
    @TableField("auth_type")
    private String authType;

    /**
     * uri是否动态路径，例： /user/{userId}/api/{apiId} 0-不包含 1-包含
     */
    @TableField("is_dynamic_path")
    private Boolean isDynamicPath;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private Integer status;

}
