package com.kt.cloud.iam.module.route.dto;


import com.kt.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
public class RouteQueryDTO extends PagingQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;

    private Long pid;

    private String path;

    private Integer status;

    private Long applicationId;


}
