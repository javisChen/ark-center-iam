package com.kt.cloud.iam.module.api.dto;

import com.kt.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ApiQueryDTO extends PagingQuery {

    private Long applicationId;

    private Long categoryId;

    private String name;

    /**
     * 状态 1-已上线；2-已下线；
     */
    private Integer status;

    /**
     * 应用类型 1-业务系统（前后端）2-纯后台服务
     */
    private Integer type;

    /**
     * 认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权
     */
    private Integer authType;

}
