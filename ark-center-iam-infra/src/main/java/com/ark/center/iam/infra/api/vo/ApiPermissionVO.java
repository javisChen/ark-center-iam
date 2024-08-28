package com.ark.center.iam.infra.api.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
public class ApiPermissionVO {

    private String permissionType;
    private String permissionCode;
    private String permissionId;
    private String apiId;
    private String apiName;
    private String apiUri;
    private String apiMethod;
    private String apiAuthType;
}
