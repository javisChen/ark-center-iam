package com.ark.center.iam.client.permission.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PermissionRouteDTO {

    private Long id;
    private Long pid;
    private Long permissionId;
    private String permissionCode;
    private Integer sequence;
    private String code;
    private String name;
    private String icon;
    private String component;
    private String levelPath;
    private Integer status;
    private String path;
    private Integer type;
    private Boolean hideChildren;
    private List<PermissionRouteDTO> children;
    private Boolean group;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
