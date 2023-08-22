package com.ark.center.iam.client.role.command;


import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

@Data
@Schema
public class RoleCmd  {

    @NotNull(message = "id 不能为空", groups = {ValidateGroup.Update.class})
    @Schema(description = "角色id")
    private Long id;

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
