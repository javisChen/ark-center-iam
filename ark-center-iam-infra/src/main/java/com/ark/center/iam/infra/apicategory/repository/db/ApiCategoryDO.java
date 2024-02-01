package com.ark.center.iam.infra.apicategory.repository.db;

import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * api分类表表
 * </p>
 *
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_api_category")
public class ApiCategoryDO extends BaseEntity {

    /**
     * 分类名称
     */
    @TableField("name")
    private String name;

    /**
     * 应用id
     */
    @TableField("application_id")
    private Long applicationId;

}
