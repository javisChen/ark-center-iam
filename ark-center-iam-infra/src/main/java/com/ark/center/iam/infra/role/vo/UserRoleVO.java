package com.ark.center.iam.infra.role.vo;

import lombok.Data;

@Data
public class UserRoleVO {

    private Long userId;
    private Long roleId;
    private String roleName;
}
