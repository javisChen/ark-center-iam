package com.ark.center.iam.domain.apicategory;

import cn.hutool.core.util.IdUtil;
import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;

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
@Builder
public class ApiCategory extends AggregateRoot {

    /**
     * 分类名称
     */
    private String name;

    /**
     * 应用id
     */
    private Long applicationId;

    public ApiCategory(String name, Long applicationId) {
        super(IdUtil.getSnowflakeNextId());
        this.name = name;
        this.applicationId = applicationId;
    }

    public void update(Long applicationId, String name) {
        this.applicationId = applicationId;
        this.name = name;
    }
}
