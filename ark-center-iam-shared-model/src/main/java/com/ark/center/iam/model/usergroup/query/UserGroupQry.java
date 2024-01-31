package com.ark.center.iam.model.usergroup.query;


import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserGroupQry extends PagingQuery  {

    private String name;
    private Long pid;

}
