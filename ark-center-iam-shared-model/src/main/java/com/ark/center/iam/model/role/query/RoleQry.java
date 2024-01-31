package com.ark.center.iam.model.role.query;

import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class RoleQry extends PagingQuery  {

    

    private String name;

    private Integer status;

}
