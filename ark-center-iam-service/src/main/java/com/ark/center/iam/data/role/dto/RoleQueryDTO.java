package com.ark.center.iam.data.role.dto;

import com.ark.component.dto.PagingQuery;
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
