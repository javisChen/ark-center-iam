package com.ark.center.iam.model.user.command;


import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import java.util.List;

@Data
@Schema(description = "用户更新命令")
public class UserUpdateCommand implements Command {

    @NotNull(message = "id 不能为空")
    @Schema(description = "用户id")
    private Long id;

    @NotBlank(message = "username 不能为空")
    @Schema(description = "用户名")
    private String username;

    @NotBlank(message = "mobile 不能为空")
    @Size(min = 11, max = 11, message = "手机号不合法")
    @Schema(description = "用户手机号")
    private String mobile;

    @NotNull(message = "status 不能为空")
    @Range(min = 1, max = 2)
    @Schema(description = "用户状态", allowableValues = {"1-启用", "2-禁用"})
    private Integer status;

    @Schema(description = "角色id集合")
    public List<Long> roleIds;

    @Schema(description = "用户组id集合")
    public List<Long> userGroupIds;

}