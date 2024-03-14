package com.ark.center.iam.application.role.event;

import com.ark.center.iam.domain.permission.vo.PermissionType;
import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;

import java.util.StringJoiner;

/**
 * 角色API权限变更事件
 * @author JC
 */
@Getter
@Setter
public class RolePermissionChangedEvent extends ApplicationEvent {

    private final Long roleId;
    private final PermissionType permissionType;

    public RolePermissionChangedEvent(Object source, Long roleId, PermissionType permissionType) {
        super(source);
        this.roleId = roleId;
        this.permissionType = permissionType;
    }

    @Override
    public Object getSource() {
        return super.getSource();
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", RolePermissionChangedEvent.class.getSimpleName() + "[", "]")
                .add("roleId=" + roleId)
                .add("permissionType=" + permissionType)
                .add("source=" + source)
                .toString();
    }
}
