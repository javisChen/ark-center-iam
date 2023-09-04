package com.ark.center.iam.client.user.command;


import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

@Data
@Schema(description = "用户模型")
public class UserCmd {

    @NotNull(groups = ValidateGroup.Update.class, message = "id 不能为空")
    @Schema(description = "用户id")
    private Long id;

    @NotBlank(message = "username 不能为空")
    @Schema(description = "用户名")
    private String username;

    @NotBlank(message = "mobile 不能为空", groups = ValidateGroup.Add.class)
    @Size(min = 11, max = 11, message = "手机号不合法")
    @Schema(description = "用户手机号")
    private String mobile;

    @NotBlank(message = "password 不能为空")
    @Schema(description = "用户密码")
    private String password;

    @NotNull(message = "status 不能为空")
    @Range(min = 1, max = 2)
    @Schema(description = "用户状态", allowableValues = {"1-启用", "2-禁用"})
    private Integer status;

    @Schema(description = "角色id集合")
    public List<Long> roleIds;

    @Schema(description = "用户组id集合")
    public List<Long> userGroupIds;

}
