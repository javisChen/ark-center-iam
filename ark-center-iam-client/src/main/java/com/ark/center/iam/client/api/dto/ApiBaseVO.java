package com.ark.center.iam.client.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Data
public class ApiBaseVO implements Serializable {

    private Long id;

    private String name;

    private String url;

    private String method;

    private Integer authType;

    private Integer status;

}
