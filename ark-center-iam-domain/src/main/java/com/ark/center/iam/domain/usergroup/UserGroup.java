package com.ark.center.iam.domain.usergroup;

import com.ark.center.iam.domain.common.hierarchy.Hierarchy;
import com.ark.center.iam.domain.common.hierarchy.Parent;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.domain.usergroup.vo.UserGroupType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import java.util.List;

@Getter
@EqualsAndHashCode(callSuper = true)
@Builder
public class UserGroup extends AggregateRoot {

    /**
     * 用户组名称
     */
    private String name;

    /**
     * 上级id
     */
    private Long pid;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    private EnableDisableStatus status;

    /**
     * 层级
     */
    private Hierarchy hierarchy;

    /**
     * 继承类型 0-不继承 1-继承上级用户组 2-继承所有用户组
     */
    private InheritType inheritType;

    /**
     * 用户组类型 1-公司 2-部门
     */
    private UserGroupType type;

    private List<Long> roleIds;

    public UserGroup(String name, InheritType inheritType, UserGroupType type, List<Long> roleIds, UserGroup parent) {
        setBasicInfo(name, inheritType, type, roleIds, parent);
    }

    public void update(String name, InheritType inheritType, UserGroupType type, List<Long> roleIds, UserGroup parent) {
        setBasicInfo(name, inheritType, type, roleIds, parent);
    }

    private void setBasicInfo(String name, InheritType inheritType, UserGroupType type, List<Long> roleIds, UserGroup parent) {
        this.name = name;
        this.pid = parent == null ? 0L : parent.getId();
        this.inheritType = inheritType;
        this.type = type;
        this.roleIds = roleIds;
        if (parent == null) {
            this.hierarchy = new Hierarchy(getId());
        } else {
            Hierarchy parentHierarchy = parent.getHierarchy();
            this.hierarchy = new Hierarchy(getId(), new Parent(parent.getId(), parentHierarchy.getLevel(), parentHierarchy.getPath()));
        }
    }

}
