package com.ark.center.iam.client.route.query;


import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class RouteQry extends PagingQuery {

    private String name;

    private Long pid;

    private String path;

    private Integer status;

    private Long applicationId;


}
