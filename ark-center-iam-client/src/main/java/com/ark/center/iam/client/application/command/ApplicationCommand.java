package com.ark.center.iam.client.application.command;

import com.ark.component.validator.ValidateGroup;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;

@Data
public class ApplicationCommand {

    private Long id;

    @NotBlank(message = "name不能为空", groups = {ValidateGroup.Add.class})
    private String name;

    @NotBlank(message = "code不能为空", groups = {ValidateGroup.Add.class})
    private String code;

    /**
     * 状态 1-已上线；2-已下线；
     */
    private Integer status;

    /**
     * 应用类型 1-业务系统（前后端）2-纯后台服务
     */
    private Integer type;

}