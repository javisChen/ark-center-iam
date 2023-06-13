package com.ark.center.iam.domain.element;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ark.component.orm.mybatis.base.BaseEntity;
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
public class Element extends BaseEntity {

    

    /**
     * 所属菜单id，关联iam_route.id
     */
    @TableField("route_id")
    private Long routeId;

    /**
     * 元素名称
     */
    @TableField("name")
    private String name;

    /**
     * 元素类型 1-按钮；2-层；
     */
    @TableField("type")
    private Integer type;

    @TableField(value = "is_deleted")
    @TableLogic
    private Long isDeleted;

}
