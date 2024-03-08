package com.ark.center.iam.infra.menuhierarchy.repository.db;

import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_hierarchy")
public class HierarchyDO extends BaseEntity {

    /**
     * 业务类型
     */
    @TableField("biz_type")
    private String bizType;

    /**
     * 业务id
     */
    @TableField("biz_id")
    private Long bizId;

    /**
     * 父级菜单id
     */
    @TableField("pid")
    private Long pid;

    /**
     * 层级路径，例如：0.1.2 代表该菜单是三级菜单，上级菜单的id是1,再上级的菜单id是0
     */
    @TableField("level_path")
    private String levelPath;

    /**
     * 层级
     */
    @TableField("level")
    private Integer level;

    /**
     * 排序序号
     */
    @TableField("sequence")
    private Integer sequence;

}
