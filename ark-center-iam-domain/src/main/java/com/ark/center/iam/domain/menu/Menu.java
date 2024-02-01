package com.ark.center.iam.domain.menu;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.domain.menu.common.MenuConst;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

@Getter
@EqualsAndHashCode(callSuper = true)
@Builder
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
     * 菜单层级路径，例如：0.1.2 代表该菜单是三级菜单，上级菜单的id是1,再上级的菜单id是0
     */
    private String levelPath;

    /**
     * 菜单层级
     */
    private Integer level;

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
                Long pid,
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
        this.pid = pid;
        this.sequence = sequence;
        this.path = path;
        this.icon = icon;
        this.menuElements = menuElements;
        setLevel(parent);
        raiseEvent(new MenuCreatedEvent(this, getId()));
    }

    public Menu(Menu menu, Menu parentMenu) {
        this.name = menu.getName();
        this.applicationId = menu.getApplicationId();
        this.code = menu.getCode();
        this.component = menu.getComponent();
        this.type = menu.getType();
        this.hideChildren = menu.getHideChildren();
        this.pid = menu.getPid();
        this.sequence = menu.getSequence();
        this.path = menu.getPath();
        this.icon = menu.getIcon();
        this.menuElements = menu.getMenuElements();
        setLevel(parentMenu);
        raiseEvent(new MenuCreatedEvent(this, getId()));
    }

    public void updateInfo(Menu menu) {
        this.name = menu.getName();
        this.applicationId = menu.getApplicationId();
        this.code = menu.getCode();
        this.component = menu.getComponent();
        this.type = menu.getType();
        this.hideChildren = menu.getHideChildren();
        this.pid = menu.getPid();
        this.sequence = menu.getSequence();
        this.path = menu.getPath();
        this.icon = menu.getIcon();
        this.menuElements = menu.getMenuElements();
        this.status = menu.getStatus();
        raiseEvent(new MenuChangedEvent(this, getId()));
    }

    private void setLevel(Menu parent) {
        this.level = isRoot() ? MenuConst.FIRST_LEVEL : parent.getLevel() + 1;
        // 假设当前menuId是188：
        // 如果是一级路由：188.
        // 如果是子级路由，parentId是288：288.188.
        String levelPath;
        if (level == 1) {
            levelPath = getId() + StrUtil.DOT;
        } else {
            levelPath = parent.getLevelPath() + this.getId() + StrUtil.DOT;
            String partOfOldParent = StringUtils.substringBefore(levelPath, String.valueOf(menu));
            return StringUtils.replace(oldRouteLevelPath, partOfOldParent, newParentRouteLevelPath);
        }
        this.levelPath = levelPath;

    }

    /**
     * 是否根菜单
     */
    public boolean isRoot() {
        return MenuConst.DEFAULT_PID.equals(this.pid)
               || MenuConst.FIRST_LEVEL.equals(this.level);
    }

    /**
     * 同步更新子菜单的状态
     */
    public void changeChildrenStatus(EnableDisableStatus status) {
        this.children.forEach(child -> {
            child.status = status;
            child.changeChildrenStatus(status);
        });
    }

    /**
     * 改变层级以及所有下级菜单的层级
     *
     * @param parentMenu 父级菜单
     */
    public void changeHierarchy(Menu parentMenu) {
        setLevel(parentMenu);
        for (Menu child : this.children) {
            child.changeHierarchy(this);
        }
    }

    public void changeStatus(EnableDisableStatus status) {
        this.status = status;
        raiseEvent(new MenuChangedEvent(this, getId()));
    }

    public void emptyChildren() {
        this.children = List.of();
    }

    public void onDelete() {
        raiseEvent(new MenuDeletedEvent(this, getId()));
    }
}
