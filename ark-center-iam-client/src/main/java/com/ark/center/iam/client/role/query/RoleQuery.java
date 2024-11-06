package com.ark.center.iam.client.role.query;

import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class RoleQuery extends PagingQuery  {

    

    private String name;

    private Integer status;

}
