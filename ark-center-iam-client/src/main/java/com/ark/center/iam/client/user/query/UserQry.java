package com.ark.center.iam.client.user.query;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 查询用户列表搜索入参
 */
@Data
@Schema(description = "单个查询用户查询入参")
public class UserQry {

    @Schema(description = "用户名")
    private String username;

    @Schema(description = "手机号码")
    private String phone;

}
