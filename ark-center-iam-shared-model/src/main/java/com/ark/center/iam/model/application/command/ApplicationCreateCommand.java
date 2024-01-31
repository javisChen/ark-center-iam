package com.ark.center.iam.model.application.command;

import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;

@Data
@Schema(description = "创建应用命令")
public class ApplicationCreateCommand implements Command {

    private Long id;

    @NotBlank(message = "name不能为空")
    @Schema(description = "应用名称")
    private String name;

    @NotBlank(message = "code不能为空")
    @Schema(description = "应用编码")
    private String code;

    @Schema(description = "状态 1-已上线；2-已下线")
    private Integer status;

    @Schema(description = "应用类型 1-业务系统（前后端）2-纯后台服务")
    private Integer type;

}