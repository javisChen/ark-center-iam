package com.ark.center.iam.model.user.dto;

import com.ark.center.iam.model.permission.vo.PermissionDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserElementsPermissionDTO  {

    List<PermissionDTO> permissions;
}
