package com.ark.center.iam.infra.relation.db.bo;


import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Data
public class PermissionRoleRelBO {

    private Long applicationId;

    private Long id;

    private Long permissionId;

    private String permissionType;


}
