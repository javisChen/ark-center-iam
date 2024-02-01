package com.ark.center.iam.domain.menu.vo;

import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;


/**
 * <p>
 * 页面元素表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Getter
@Builder
@EqualsAndHashCode(callSuper = true)
public class MenuElement extends AggregateRoot {

    /**
     * 所属菜单id，关联iam_menu.id
     */
    private Long menuId;

    /**
     * 元素名称
     */
    private String name;

    /**
     * 元素类型 1-按钮；2-层；
     */
    private ElementType type;

    private MenuElement(String name, ElementType type) {
        this.name = name;
        this.type = type;
    }

    public static MenuElement of(String name, ElementType type) {
        return new MenuElement(name, type);
    }
}
