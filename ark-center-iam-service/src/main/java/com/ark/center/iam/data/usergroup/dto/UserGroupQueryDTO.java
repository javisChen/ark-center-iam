package com.ark.center.iam.data.usergroup.dto;


import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserGroupQueryDTO extends PagingQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;

}
