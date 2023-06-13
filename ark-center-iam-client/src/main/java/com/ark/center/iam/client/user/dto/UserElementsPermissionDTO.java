package com.ark.center.iam.client.user.dto;

import com.ark.center.iam.client.permission.vo.PermissionDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserElementsPermissionDTO  {

    List<PermissionDTO> permissions;
}
