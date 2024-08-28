package com.ark.center.iam.infra.application;

import com.baomidou.mybatisplus.annotation.TableField;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_application")
public class Application extends BaseEntity  {

    /**
     * 应用名称
     */
    @TableField("name")
    private String name;

    /**
     * 应用编码
     */
    @TableField("code")
    private String code;

    /**
     * 状态 1-已上线；2-已下线；
     */
    @TableField("status")
    private Integer status;

    /**
     * 应用类型 1-业务系统（前后端）2-纯后台服务
     */
    @TableField("type")
    private Integer type;

    /**
     * 删除标识 0-表示未删除 大于0-已删除
     */
    @TableField("is_deleted")
    private Long isDeleted;
}