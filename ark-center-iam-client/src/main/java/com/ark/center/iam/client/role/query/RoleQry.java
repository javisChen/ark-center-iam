package com.ark.center.iam.client.role.query;

import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
public class RoleQry extends PagingQuery  {

    

    private String name;

    private Integer status;

}
