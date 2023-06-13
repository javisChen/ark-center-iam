package com.ark.center.iam.client.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Data
public class ApiBaseDTO  {

    private Long id;

    private String name;

    private String url;

    private String method;

    private Integer authType;

    private Integer status;

    /**
     * url是否包含路径参数，例： /user/{userId}/api/{apiId} 0-不包含 1-包含
     */
    private Boolean hasPathVariable;
}
