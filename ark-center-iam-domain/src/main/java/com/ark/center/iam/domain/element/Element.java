package com.ark.center.iam.domain.element;

import com.ark.center.iam.domain.element.vo.ElementType;
import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


/**
 * <p>
 * 页面元素表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
public class Element extends AggregateRoot {

    private Long id;

    /**
     * 元素名称
     */
    private String name;

    /**
     * 元素类型 1-按钮；2-层；
     */
    private ElementType type;

    public Element(String name, ElementType type) {
        this.name = name;
        this.type = type;
    }

    public Element(Long id, String name, ElementType type) {
        this.id = id;
        this.name = name;
        this.type = type;
    }

    public static Element of(String name, ElementType type) {
        return new Element(name, type);
    }

}
