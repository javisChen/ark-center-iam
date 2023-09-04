package com.ark.center.iam.client.user.dto;

import lombok.Data;

@Data
public class UserBaseDTO {

    private Long id;
    private String mobile;
    private String username;
    private String userCode;
    private Boolean isSuperAdmin;
    private Integer status;

}
