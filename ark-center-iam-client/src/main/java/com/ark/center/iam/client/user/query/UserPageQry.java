package com.ark.center.iam.client.user.query;


import com.ark.component.dto.PagingQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 查询用户列表搜索入参
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "查询用户列表搜索入参")
public class UserPageQry extends PagingQuery {

    @Schema(description = "用户名")
    private String username;

    @Schema(description = "手机号码")
    private String mobile;

    @Schema(description = "用户状态：1-正常；2-锁定")
    private Integer status;
}
