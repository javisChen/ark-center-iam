package com.ark.center.iam.domain.permission.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PermissionType {
    FRONT_ROUTE("FR", "FRONT_ROUTE", "前端路由"),
    PAGE_ELEMENT("PE", "PAGE_ELEMENT", "页面元素"),
    FILE("F", "FILE", "文件"),
    SER_API("IA", "SER_API", "内部服务API"),
    OPEN_API("OA", "OPEN_API", "开放API");

    private final String tag;
    private final String type;
    private final String msg;

}
