package com.ark.center.iam.client.route.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class RouteBaseDTO {

    private Long id;
    private Long pid;
    private Integer sequence;
    private Integer level;
    private String code;
    private String name;
    private String icon;
    private String component;
    private String levelPath;
    private Integer status;
    private String path;
    private Integer type;
    private Boolean hideChildren;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

}
