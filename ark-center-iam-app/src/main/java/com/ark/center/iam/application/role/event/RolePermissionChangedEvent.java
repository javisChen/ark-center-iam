package com.ark.center.iam.application.role.event;

import com.ark.center.iam.domain.permission.enums.PermissionType;
import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;

import java.util.List;
import java.util.StringJoiner;

/**
 * 角色API权限变更事件
 * @author JC
 */
@Getter
@Setter
public class RolePermissionChangedEvent extends ApplicationEvent implements ApplicationListener<RolePermissionChangedEvent> {

    private final Long roleId;
    private final String roleName;
    private final List<Long> permissionIds;
    private final PermissionType permissionType;

    public RolePermissionChangedEvent(Object source, Long roleId, String  roleName, List<Long> permissionIds, PermissionType permissionType) {
        super(source);
        this.roleId = roleId;
        this.roleName = roleName;
        this.permissionIds = permissionIds;
        this.permissionType = permissionType;
    }

    @Override
    public RolePermissionChangedEvent getSource() {
        return (RolePermissionChangedEvent) super.getSource();
    }

    @Override
    public void onApplicationEvent(@NotNull RolePermissionChangedEvent event) {

    }

    @Override
    public String toString() {
        return new StringJoiner(", ", RolePermissionChangedEvent.class.getSimpleName() + "[", "]")
                .add("roleId=" + roleId)
                .add("roleName='" + roleName + "'")
                .add("permissionType=" + permissionType)
                .add("source=" + source)
                .toString();
    }
}
