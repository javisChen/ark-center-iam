package com.ark.center.iam.model.usergroup.query;


import com.ark.component.dto.PagingQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Tag(name = "用户组查询请求", description = "用户组查询请求")
public class UserGroupQuery extends PagingQuery  {

    @Schema(description = "用户组名称")
    private String name;

    @Schema(description = "上级id")
    private Long pid;

}
