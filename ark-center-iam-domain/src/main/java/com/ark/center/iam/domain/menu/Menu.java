package com.ark.center.iam.domain.menu;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.menu.event.MenuCreatedEvent;
import com.ark.center.iam.domain.menu.event.MenuDeletedEvent;
import com.ark.center.iam.domain.menu.support.MenuDomainDTO;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
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
//    private Hierarchy hierarchy;

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

    private List<Element> elements;

    private List<Menu> children;

    public Menu(MenuDomainDTO domainDTO) {
        super(IdUtil.getSnowflakeNextId());
        String name = domainDTO.getName();
        Long applicationId = domainDTO.getApplicationId();
        String code = domainDTO.getCode();
        String component = domainDTO.getComponent();
        MenuType type = domainDTO.getType();
        Boolean hideChildren = domainDTO.getHideChildren();
        Integer sequence = domainDTO.getSequence();
        String path = domainDTO.getPath();
        String icon = domainDTO.getIcon();
        List<Element> elements = domainDTO.getElements();
        Menu parent = domainDTO.getParent();
        setBasicInfo(name, applicationId, code, component, type, hideChildren, sequence, path, icon, parent);
        this.children = List.of();
        this.elements = elements;
        // this.hierarchy = new Hierarchy(getId());
        raiseEvent(new MenuCreatedEvent(this, getId()));
    }

    public void updateBasic(MenuDomainDTO updateDTO) {
        String name = updateDTO.getName();
        Long applicationId = updateDTO.getApplicationId();
        String code = updateDTO.getCode();
        String component = updateDTO.getComponent();
        MenuType type = updateDTO.getType();
        Boolean hideChildren = updateDTO.getHideChildren();
        Integer sequence = updateDTO.getSequence();
        String path = updateDTO.getPath();
        String icon = updateDTO.getIcon();
        Menu parent = updateDTO.getParent();
        EnableDisableStatus status = updateDTO.getStatus();
        setBasicInfo(name, applicationId, code, component, type, hideChildren, sequence, path, icon, parent);
        updateStatus(status);
        // changeHierarchy(parent);
        raiseEvent(new com.ark.center.iam.domain.menu.event.MenuChangedEvent(this, getId()));
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
    }

//    public void setHierarchy(Menu parent) {
//        if (parent == null) {
//            this.hierarchy = new Hierarchy(getId());
//        } else {
//            Hierarchy parentHierarchy = parent.getHierarchy();
//            this.hierarchy = new Hierarchy(getId(), Parent.of(parent.getId(), parentHierarchy.getLevel(), parentHierarchy.getPath()));
//        }
//    }

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
//    public void changeHierarchy(Menu parentMenu) {
//        if (parentMenu == null || parentMenu.getId().equals(this.pid)) {
//            return;
//        }
//        setHierarchy(parentMenu);
//        for (Menu child : this.children) {
//            child.changeHierarchy(this);
//        }
//    }

    /**
     * 改变当前菜单状态同时要把子菜单状态一并修改
     */
    public void updateStatus(EnableDisableStatus status) {
        this.status = status;
        this.updateChildrenStatus(status);
        raiseEvent(new com.ark.center.iam.domain.menu.event.MenuChangedEvent(this, getId()));
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
        List<Long> elements = menu.getElements().stream().map(Element::getId).collect(Collectors.toList());
        if (CollectionUtils.isNotEmpty(elements)) {
            allIds.addAll(elements);
        }
        List<Menu> children = menu.getChildren();
        if (CollectionUtils.isEmpty(children)) {
            return;
        }
        children.forEach(childMenu -> collectElementIds(childMenu, allIds));
    }

    /**
     * 更新菜单元素
     *
     * @param newElementIds    新加入的元素
     * @param reservedElements 仍然需要保留的元素
     */
    public void updateElements(List<Element> newElementIds, List<Element> reservedElements) {
        if (CollectionUtils.isNotEmpty(reservedElements)) {
            List<Long> removedIds = extractDiffElementIds(reservedElements);
            this.elements = this.elements.stream()
                    .filter(element -> !removedIds.contains(element.getId()))
                    .collect(Collectors.toList());
        }

        this.elements.addAll(newElementIds);

    }

    /**
     * 获取元素的差集
     */
    public List<Long> extractDiffElementIds(List<Element> outElements) {
        return this.elements.stream()
                .filter(element -> !outElements.contains(element))
                .map(Element::getId)
                .collect(Collectors.toList());
    }

    public void deleteElements(List<Long> deletedElements) {
        this.elements = this.elements
                .stream()
                .filter(element -> !deletedElements.contains(element.getId()))
                .collect(Collectors.toList());
    }

    public void addElements(List<Element> newElements) {
        this.elements.addAll(newElements);
    }
}
