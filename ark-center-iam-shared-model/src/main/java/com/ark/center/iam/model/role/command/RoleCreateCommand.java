package com.ark.center.iam.model.role.command;


import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

@Data
@Schema
public class RoleCreateCommand implements Command {

    @Schema(description = "角色名称", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "name 不能为空")
    private String name;

    @Schema(description = "角色编码", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "code 不能为空")
    private String code;

    @NotNull(message = "status 不能为空")
    @Range(min = 0, max = 1)
    @Schema(description = "角色状态", allowableValues = {"1-已启用", "2-已禁用"}, requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer status;

}