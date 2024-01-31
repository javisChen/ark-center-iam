package com.ark.center.iam.model.apicategory.command;

import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Schema(description = "Api分类更新命令")
public class ApiCategoryUpdateCommand implements Command {

    @NotNull(message = "id不能为空")
    @Schema(description = "id")
    private Long id;

    @NotBlank(message = "name不能为空")
    @Size(max = 50)
    @Schema(description = "分类名称")
    private String name;

    @NotNull(message = "applicationId不能为空")
    @Schema(description = "应用id")
    private Long applicationId;

}