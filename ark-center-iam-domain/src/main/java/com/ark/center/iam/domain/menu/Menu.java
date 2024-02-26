package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.common.hierarchy.Hierarchy;
import com.ark.center.iam.domain.common.hierarchy.Parent;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

import static lombok.AccessLevel.PRIVATE;

@Getter
@EqualsAndHashCode(callSuper = true)
@SuperBuilder
@AllArgsConstructor(access = PRIVATE)
public class Menu extends AggregateRoot {

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 应用id
     */
    private Long applicationId;

    /**
     * 唯一键
     */
    private String code;

    /**
     * 组件名
     */
    private String component;

    /**
     * 路由类型 1：菜单路由 2：页面路由 3:页面隐藏路由
     */
    private MenuType type;

    /**
     * 是否隐藏子路由 0-否 1-是
     */
    private Boolean hideChildren;

    /**
     * 父级菜单id
     */
    private Long pid;

    /**
     * 层级
     */
    private Hierarchy hierarchy;

    /**
     * 排序序号
     */
    private Integer sequence;

    /**
     * 路径
     */
    private String path;

    /**
     * 图标
     */
    private String icon;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    private EnableDisableStatus status;

    private List<MenuElement> menuElements;

    private List<Menu> children;

    public Menu(String name,
                Long applicationId,
                String code,
                String component,
                MenuType type,
                Boolean hideChildren,
                Integer sequence,
                String path,
                String icon,
                List<MenuElement> menuElements,
                Menu parent) {
        setBasicInfo(name, applicationId, code, component, type, hideChildren, sequence, path, icon, menuElements, parent);
        this.children = List.of();
        setHierarchy(parent);
        raiseEvent(new MenuCreatedEvent(this, getId()));
    }

    public void update(String name,
                       Long applicationId,
                       String code,
                       String component,
                       MenuType type,
                       Boolean hideChildren,
                       Integer sequence,
                       String path,
                       String icon,
                       EnableDisableStatus status,
                       List<MenuElement> menuElements,
                       Menu parent) {
        setBasicInfo(name, applicationId, code, component, type, hideChildren, sequence, path, icon, menuElements, parent);
        updateStatus(status);
        changeHierarchy(parent);
        raiseEvent(new MenuChangedEvent(this, getId()));
    }

    private void setBasicInfo(String name,
                              Long applicationId,
                              String code,
                              String component,
                              MenuType type,
                              Boolean hideChildren,
                              Integer sequence,
                              String path,
                              String icon,
                              List<MenuElement> menuElements,
                              Menu parent) {
        this.name = name;
        this.applicationId = applicationId;
        this.code = code;
        this.component = component;
        this.type = type;
        this.hideChildren = hideChildren;
        this.pid = parent == null ? 0L : parent.getId();
        this.sequence = sequence;
        this.path = path;
        this.icon = icon;
        this.menuElements = menuElements;
    }

    private void setHierarchy(Menu parent) {
        if (parent == null) {
            this.hierarchy = new Hierarchy(getId());
        } else {
            Hierarchy parentHierarchy = parent.getHierarchy();
            this.hierarchy = new Hierarchy(getId(), Parent.of(parent.getId(), parentHierarchy.getLevel(), parentHierarchy.getPath()));
        }
    }

    /**
     * 递归更新子菜单的状态
     */
    public void updateChildrenStatus(EnableDisableStatus status) {
        this.children.forEach(child -> {
            child.updateStatus(status);
            child.updateChildrenStatus(status);
        });
    }

    /**
     * 改变层级以及所有下级菜单的层级
     *
     * @param parentMenu 父级菜单
     */
    public void changeHierarchy(Menu parentMenu) {
        if (parentMenu == null || parentMenu.getId().equals(this.pid)) {
            return;
        }
        setHierarchy(parentMenu);
        for (Menu child : this.children) {
            child.changeHierarchy(this);
        }
    }

    /**
     * 改变当前菜单状态同时要把子菜单状态一并修改
     */
    public void updateStatus(EnableDisableStatus status) {
        this.status = status;
        this.updateChildrenStatus(status);
        raiseEvent(new MenuChangedEvent(this, getId()));
    }

    /**
     * 清除所有子菜单
     */
    public void emptyChildren() {
        this.children = List.of();
    }

    public void onDelete() {
        raiseEvent(new MenuDeletedEvent(this, getAllIds(), getAllElementIds()));
    }

    public List<Long> getAllIds() {
        List<Long> allIds = new ArrayList<>();
        collectIds(this, allIds);
        return allIds;
    }

    public void collectIds(Menu menu, List<Long> allIds) {
        allIds.add(menu.getId());
        List<Menu> children = menu.getChildren();
        if (CollectionUtils.isEmpty(children)) {
            return;
        }
        children.forEach(childMenu -> collectIds(childMenu, allIds));
    }

    public List<Long> getAllElementIds() {
        List<Long> allIds = new ArrayList<>();
        collectElementIds(this, allIds);
        return allIds;
    }

    public void collectElementIds(Menu menu, List<Long> allIds) {
        List<MenuElement> elements = menu.getMenuElements();
        if (CollectionUtils.isNotEmpty(elements)) {
            allIds.addAll(elements.stream().map(MenuElement::getId).toList());
        }
        List<Menu> children = menu.getChildren();
        if (CollectionUtils.isEmpty(children)) {
            return;
        }
        children.forEach(childMenu -> collectElementIds(childMenu, allIds));
    }

}
