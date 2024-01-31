package com.ark.center.iam.domain.menu.vo;

import com.ark.component.ddd.domain.AggregateRoot;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * <p>
 * 页面元素表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_element")
public class Element extends AggregateRoot {

    /**
     * 所属菜单id，关联iam_menu.id
     */
    @TableField("menu_id")
    private Long menuId;

    /**
     * 元素名称
     */
    @TableField("name")
    private String name;

    /**
     * 元素类型 1-按钮；2-层；
     */
    @TableField("type")
    private ElementType type;

    @TableField(value = "is_deleted")
    private Long isDeleted;

    private Element(String name, ElementType type) {
        this.name = name;
        this.type = type;
    }

    public static Element of(String name, ElementType type) {
        return new Element(name, type);
    }
}
