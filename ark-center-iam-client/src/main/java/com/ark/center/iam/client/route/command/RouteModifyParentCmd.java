package com.ark.center.iam.client.route.command;


import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class RouteModifyParentCmd {


    @NotNull(message = "id 不能为空")
    private Long id;

    /**
     * 父级菜单id
     */
    @NotNull(message = "pid 不能为空")
    private Long pid;

}
