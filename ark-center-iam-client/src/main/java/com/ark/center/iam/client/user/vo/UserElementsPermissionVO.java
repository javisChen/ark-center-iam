package com.ark.center.iam.client.user.vo;

import com.ark.center.iam.client.permission.vo.PermissionVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserElementsPermissionVO implements Serializable {

    List<PermissionVO> permissions;
}
