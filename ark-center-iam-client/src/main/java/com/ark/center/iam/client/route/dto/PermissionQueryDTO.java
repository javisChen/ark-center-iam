package com.ark.center.iam.client.route.dto;


import lombok.Data;

@Data
public class PermissionQueryDTO  {

    

    /**
     * 权限名称
     */
    private String name;

    /**
     * 权限类型 MENU-菜单权限；PAGE_ELEMENT-页面元素；FILE-文件；SER_API-内部服务API；OPEN_API-开放API
     */
    private String type;

    /**
     * 权限编码
     */
    private String code;

}
