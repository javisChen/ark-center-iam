package com.ark.center.iam.model.menu.command;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "路由内部元素请求体")
public class ElementCommand {

    @Schema(description = "元素id")
    private Long id;

    @Schema(description = "元素名称")
    private String name;

    @Schema(description = "元素类型")
    private Integer type;

}
