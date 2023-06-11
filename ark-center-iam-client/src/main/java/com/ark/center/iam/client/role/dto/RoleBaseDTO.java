package com.ark.center.iam.client.role.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class RoleBaseDTO {

    private Long id;
    private String name;
    private String code;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
