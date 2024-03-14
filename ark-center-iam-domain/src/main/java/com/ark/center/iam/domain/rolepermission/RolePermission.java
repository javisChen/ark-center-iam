package com.ark.center.iam.domain.rolepermission;


import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.List;

@Getter
@Setter
public class RolePermission extends AggregateRoot {

    private Long applicationId;

    private List<Long> menuPermissionIds = Collections.emptyList();

    private List<Long> apiPermissionIds = Collections.emptyList();

    public void removeApiPermissionIds(List<Long> permissionIds) {
        this.apiPermissionIds.removeAll(permissionIds);
    }

    public void addApiPermissionIds(List<Long> permissionIds) {
        List<Long> filtered = permissionIds.stream()
                .filter(id -> !this.menuPermissionIds.contains(id))
                .toList();
        this.apiPermissionIds.addAll(filtered);
    }

    public void removeMenuPermissions(List<Long> permissionIds) {
        this.menuPermissionIds.removeAll(permissionIds);
    }

    public void addMenuPermissions(List<Long> permissionIds) {
        // 过滤掉重复的
        List<Long> filtered = permissionIds.stream()
                .filter(id -> !this.menuPermissionIds.contains(id))
                .toList();
        this.menuPermissionIds.addAll(filtered);
    }

}
