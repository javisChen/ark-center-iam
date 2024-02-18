package com.ark.center.iam.domain.permission.service;

import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionStatusEnums;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionRepository;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PermissionService {

    private final PermissionRepository permissionRepository;

    public void addPermission(Long resourceId, PermissionType permissionType) {
        Permission permission = Permission.of();
        permission.setType(permissionType.getName());
        permission.setCode(generatePermissionCode(permissionType.getTag(), resourceId));
        permission.setResourceId(resourceId);
        permission.setStatus(PermissionStatusEnums.ENABLED.getValue());
        permissionRepository.save(permission);
    }

    /**
     * 生成权限编码
     * 规则：类型首字母+资源id（十位，不足左补0） EXAMPLE：P0000000001
     */
    private String generatePermissionCode(String tag, long id) {
        return tag + StringUtils.leftPad(String.valueOf(id), 9, "0");
    }

}
