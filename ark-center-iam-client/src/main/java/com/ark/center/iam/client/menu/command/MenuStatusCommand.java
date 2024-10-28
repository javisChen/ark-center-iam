package com.ark.center.iam.client.menu.command;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import java.util.List;

@Data
@Schema(description = "菜单状态命令DTO")
public class MenuStatusCommand {
    
    @Schema(description = "菜单id")
    @NotNull(message = "菜单id 不能为空")
    private Long id;

    @NotNull(message = "status 不能为空")
    @Range(min = 1, max = 2)
    @Schema(description = "状态", allowableValues = {"1-已启用", "2-已禁用"})
    private Integer status;

}
