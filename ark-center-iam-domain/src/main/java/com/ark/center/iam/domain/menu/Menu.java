package com.ark.center.iam.domain.menu;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.domain.menu.common.MenuConst;
import com.ark.center.iam.domain.menu.vo.Element;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import java.util.List;

@Getter
@EqualsAndHashCode(callSuper = true)
@TableName("iam_menu")
public class Menu extends AggregateRoot {

    /**
     * 菜单名称
     */
    @TableField("name")
    private String name;

    /**
     * 应用id
     */
    @TableField("application_id")
    private Long applicationId;

    /**
     * 唯一键
     */
    @TableField("code")
    private String code;

    /**
     * 组件名
     */
    @TableField("component")
    private String component;

    /**
     * 路由类型 1：菜单路由 2：页面路由 3:页面隐藏路由
     */
    @TableField("type")
    private MenuType type;

    /**
     * 是否隐藏子路由 0-否 1-是
     */
    @TableField("hide_children")
    private Boolean hideChildren;

    /**
     * 父级菜单id
     */
    @TableField("pid")
    private Long pid;

    /**
     * 菜单层级路径，例如：0.1.2 代表该菜单是三级菜单，上级菜单的id是1,再上级的菜单id是0
     */
    @TableField("level_path")
    private String levelPath;

    /**
     * 菜单层级
     */
    @TableField("level")
    private Integer level;

    /**
     * 排序序号
     */
    @TableField("sequence")
    private Integer sequence;

    /**
     * 路径
     */
    @TableField("path")
    private String path;

    /**
     * 图标
     */
    @TableField("icon")
    private String icon;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private EnableDisableStatus status;

    @TableField(value = "is_deleted")
    private Long isDeleted;

    @TableField(exist = false)
    private List<Element> elements;

    @TableField(exist = false)
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
                List<Element> elements,
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
        this.elements = elements;
        setupLevel(parent);
        raiseEvent(new MenuCreatedEvent(this, getId()));
    }

    private void setupLevel(Menu parent) {
        this.level = isRoot() ? MenuConst.FIRST_LEVEL : parent.getLevel() + 1;
        this.levelPath = level == 1
                ? getId() + StrUtil.DOT
                : parent.getLevelPath() + this.getId() + StrUtil.DOT;

    }

    /**
     * 是否根菜单
     */
    public boolean isRoot() {
        return MenuConst.DEFAULT_PID.equals(this.pid)
               || MenuConst.FIRST_LEVEL.equals(this.level);
    }

    /**
     * 变更父级菜单
     */
    public void changeParent(Menu parent) {
        this.pid = parent.getId();
        updateLevelPath(parent);
    }

    private void updateLevelPath(Menu parent) {
        this.levelPath = isRoot()
                ? getId() + StrUtil.DOT
                : parent.getLevelPath() + this.getId() + StrUtil.DOT;
    }

    public void init(Menu parent) {
        updateLevelPath(parent);
    }

    public void addElements(List<Element> elements) {
        this.elements = elements;
    }
}
