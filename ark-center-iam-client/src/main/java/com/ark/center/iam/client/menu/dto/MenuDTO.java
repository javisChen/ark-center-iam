package com.ark.center.iam.client.menu.dto;

import com.ark.component.tree.TreeDTO;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class MenuDTO implements TreeDTO<Long> {

    private Long id;
    private Long pid;
    private Long applicationId;
    private Integer sequence;
    private String code;
    private String name;
    private String icon;
    private String component;
    private String component2;
    private Integer status;
    private String path;
    private String path2;
    private Integer type;
    private Boolean hideChildren;

}
