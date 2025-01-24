package com.ark.center.iam.client.user.dto;

import lombok.Data;

@Data
public class UserApiPermissionDTO {

    private String apiId;

    private String apiName;

    private String uri;

    private String method;

}
