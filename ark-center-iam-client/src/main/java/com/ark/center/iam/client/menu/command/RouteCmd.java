package com.ark.center.iam.client.menu.command;

import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import java.util.List;

@Data
@Schema(description = "路由命令请求体")
public class RouteCmd {

    @NotNull(message = "id 不能为空", groups = ValidateGroup.Update.class)
    @Schema(description = "路由名称")
    private Long id;

    @NotBlank(message = "name 不能为空")
    @Schema(description = "路由名称")
    private String name;

    @NotNull(message = "pid 不能为空")
    @Schema(description = "父级路由id")
    private Long pid;

    @NotNull(message = "applicationId 不能为空")
    @Schema(description = "应用id")
    private Long applicationId;

    @NotBlank(message = "code 不能为空")
    @Schema(description = "路由编码")
    private String code;

    @NotNull(message = "status 不能为空")
    @Range(min = 1, max = 2)
    @Schema(description = "状态", allowableValues = {"1-已启用", "2-已禁用"})
    private Integer status;

    @Schema(description = "路由组件名称")
    private String component;

    @Schema(description = "是否隐藏子路由页面")
    private Boolean hideChildren;

    @Schema(description = "路径")
    private String path;

    @Schema(description = "路由类型", allowableValues = {"1-菜单路由", "2-页面路由", "3-页面隐藏路由"})
    private Integer type;

    @Schema(description = "菜单图标")
    private String icon;

    @Schema(description = "排序")
    private Integer sequence;

    @Schema(description = "路由内部元素")
    private List<Element> elements;

    @Data
    @Schema(description = "路由内部元素请求体")
    public static class Element {

        @Schema(description = "元素名称")
        private String name;

        @Schema(description = "元素类型")
        private Integer type;

    }

}
