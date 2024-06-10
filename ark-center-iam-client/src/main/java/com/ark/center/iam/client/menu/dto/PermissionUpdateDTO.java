package com.ark.center.iam.client.menu.dto;


import com.ark.component.validator.ValidateGroup;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotNull;

@Data
public class PermissionUpdateDTO  {

    

    @NotNull(message = "id 不能为空")
    private Long id;

    /**
     * 权限名称
     */
    private String name;

    /**
     * 权限类型 MENU-菜单权限；PAGE_ELEMENT-页面元素；FILE-文件；SER_API-内部服务API；OPEN_API-开放API
     */
    private String type;

    @NotNull(groups = ValidateGroup.Update.class, message = "status 不能为空")
    @Range(min = 0, max = 1)
    private Integer status;

}
