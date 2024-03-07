package com.ark.center.iam.domain.menu.support;

import com.ark.center.iam.domain.common.hierarchy.Hierarchy;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class MenuDomainDTO {

    private Long id;

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

    private Menu parent;

    private List<Element> elements;

    private List<MenuDomainDTO> children;

}
