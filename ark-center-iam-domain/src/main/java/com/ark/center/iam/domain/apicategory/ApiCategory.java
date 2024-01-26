package com.ark.center.iam.domain.apicategory;

import com.ark.component.ddd.domain.AggregateRoot;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

/**
 * <p>
 * api分类表表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Getter
@EqualsAndHashCode(callSuper = true)
@TableName("iam_api_category")
public class ApiCategory extends AggregateRoot {

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

    public ApiCategory(String name, Long applicationId) {
        this.name = name;
        this.applicationId = applicationId;
    }

    @TableField(value = "is_deleted")
    private Long isDeleted;


    public void update(Long applicationId, String name) {
        this.applicationId = applicationId;
        this.name = name;
    }
}
