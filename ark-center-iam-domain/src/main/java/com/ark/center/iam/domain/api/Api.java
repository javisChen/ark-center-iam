package com.ark.center.iam.domain.api;

import com.ark.center.iam.domain.api.vo.ApiAuthType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

/**
 * <p>
 * api表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Getter
@EqualsAndHashCode(callSuper = true)
@TableName("iam_api")
public class Api extends AggregateRoot {

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
     * @see com.ark.center.iam.domain.api.vo.ApiAuthType
     */
    @TableField("auth_type")
    private ApiAuthType authType;

    /**
     * url是否包含路径参数，例： /user/{userId}/api/{apiId} 0-不包含 1-包含
     */
    @TableField("has_path_variable")
    private Boolean hasPathVariable;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private EnableDisableStatus status;

    @TableField(value = "is_deleted")
    private Long isDeleted;

    public Api(String name,
               Long applicationId,
               Long categoryId,
               String uri,
               String method,
               ApiAuthType authType) {
        this.name = name;
        this.applicationId = applicationId;
        this.categoryId = categoryId;
        this.uri = uri;
        this.method = method;
        this.authType = authType;
        this.hasPathVariable = StringUtils.contains(uri, "*");
    }
}
