package com.ark.center.iam.domain.apicategory;

import com.ark.component.ddd.domain.AggregateRoot;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import static lombok.AccessLevel.PRIVATE;

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
        this.name = name;
        this.applicationId = applicationId;
    }

    public void update(Long applicationId, String name) {
        this.applicationId = applicationId;
        this.name = name;
    }
}
