package com.ark.center.iam.model.user.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserApiPermissionChangedDTO {

    private Long userId;

    private List<UserApiPermissionDTO> apiPermissions;

}
