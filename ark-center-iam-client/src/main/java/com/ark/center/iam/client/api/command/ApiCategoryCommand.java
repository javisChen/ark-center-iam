package com.ark.center.iam.client.api.command;

import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
@Schema(
    description = "API分类信息",
    title = "API分类命令",
    example = """
            {
              "id": 1,
              "name": "用户管理接口",
              "applicationId": 1
            }
            """
)
public class ApiCategoryCommand {

    @Schema(
        description = "分类ID",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "1",
        title = "分类ID"
    )
    @NotNull(message = "id不能为空", groups = {ValidateGroup.Update.class})
    @Min(value = 1L, message = "非法的ID")
    private Long id;

    @Schema(
        description = "所属应用ID",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "1",
        title = "应用ID"
    )
    @NotNull(message = "应用ID不能为空", groups = {ValidateGroup.Add.class})
    private Long applicationId;

    @Schema(
        description = "分类名称",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "用户管理接口",
        maxLength = 50,
        title = "分类名称"
    )
    @NotBlank(message = "分类名称不能为空", groups = {ValidateGroup.Add.class})
    @Length(max = 50, message = "分类名称长度不能超过50")
    private String name;
}