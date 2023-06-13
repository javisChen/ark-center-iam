package com.ark.center.iam.domain.user;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_user")
public class User extends BaseEntity {

    

    /**
     * 用户名称
     */
    @TableField("user_name")
    private String userName;

    /**
     * 手机号码
     */
    @TableField("phone")
    private String phone;

    /**
     * 用户编码
     */
    @TableField("code")
    private String code;

    /**
     * 用户密码
     */
    @TableField("password")
    private String password;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private Integer status;

    @TableField(value = "is_deleted")
    @TableLogic
    private Long isDeleted;

}
