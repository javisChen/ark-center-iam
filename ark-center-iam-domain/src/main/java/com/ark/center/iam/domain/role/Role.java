package com.ark.center.iam.domain.role;


import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_role")
public class Role extends AggregateRoot {

    /**
     * 用户名称
     */
    @TableField("name")
    private String name;

    /**
     * 角色编码
     */
    @TableField("code")
    private String code;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private EnableDisableStatus status;

    @TableField(value = "is_deleted")
    @TableLogic
    private Long isDeleted;

}
