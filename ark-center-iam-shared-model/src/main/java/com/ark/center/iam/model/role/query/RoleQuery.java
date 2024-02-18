package com.ark.center.iam.model.role.query;

import com.ark.component.dto.PagingQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "角色查询")
public class RoleQuery extends PagingQuery  {

    @Schema(description = "角色名称")
    private String name;

}
