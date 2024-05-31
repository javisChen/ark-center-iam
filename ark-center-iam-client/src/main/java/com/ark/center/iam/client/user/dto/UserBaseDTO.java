package com.ark.center.iam.client.user.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserBaseDTO {

    private Long id;
    private String mobile;
    private String username;
    private String userCode;
    private Boolean isSuperAdmin;
    private Integer status;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

}
