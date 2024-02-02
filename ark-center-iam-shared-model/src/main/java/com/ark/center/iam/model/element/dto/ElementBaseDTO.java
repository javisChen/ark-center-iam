package com.ark.center.iam.model.element.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "菜单元素读模型")
public class ElementBaseDTO {

    @Schema(description = "元素id")
    private Long id;

    @Schema(description = "菜单id")
    private Long menuId;

    @Schema(description = "元素名称")
    private String name;

    @Schema(description = "元素类型")
    private Integer type;

}
