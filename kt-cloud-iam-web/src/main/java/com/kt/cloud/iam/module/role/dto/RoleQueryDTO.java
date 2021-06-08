package com.kt.cloud.iam.module.role.dto;


import com.kt.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
public class RoleQueryDTO extends PagingQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;

    private Integer status;

}
