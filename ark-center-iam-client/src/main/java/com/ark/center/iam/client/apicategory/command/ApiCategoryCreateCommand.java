package com.ark.center.iam.client.apicategory.command;

import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Data
@Schema(description = "Api分类创建命令")
public class ApiCategoryCreateCommand implements Command {

    @NotBlank(message = "name不能为空")
    @Schema(description = "分类名称")
    private String name;

    @NotNull(message = "applicationId不能为空")
    @Schema(description = "应用id")
    private Long applicationId;

}