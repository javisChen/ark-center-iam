//package com.ark.center.iam.infra.permission.service;
//
//import com.ark.center.iam.infra.permission.Permission;
//import com.ark.center.iam.infra.permission.enums.PermissionStatusEnums;
//import com.ark.center.iam.infra.permission.enums.PermissionType;
//import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
//import lombok.RequiredArgsConstructor;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.stereotype.Service;
//
//@Service
//@RequiredArgsConstructor
//public class PermissionService {
//
//    private final PermissionService permissionGateway;
//
//    public void addPermission(Long resourceId, PermissionType permissionType) {
//        Permission permission = new Permission();
//        permission.setType(permissionType.getName());
//        permission.setCode(generatePermissionCode(permissionType.getTag(), resourceId));
//        permission.setResourceId(resourceId);
//        permission.setStatus(PermissionStatusEnums.ENABLED.getValue());
//        permissionGateway.insert(permission);
//    }
//
//    /**
//     * 生成权限编码
//     * 规则：类型首字母+资源id（十位，不足左补0） EXAMPLE：P0000000001
//     */
//    private String generatePermissionCode(String tag, long id) {
//        return tag + StringUtils.leftPad(String.valueOf(id), 9, "0");
//    }
//
//}
