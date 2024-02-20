package com.ark.center.iam.domain.api;

import com.ark.center.iam.domain.api.event.ApiChangedEvent;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.api.event.ApiDeletedEvent;
import com.ark.center.iam.domain.api.vo.ApiAuthType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import static lombok.AccessLevel.PRIVATE;

@Getter
@EqualsAndHashCode(callSuper = true)
@Builder
@AllArgsConstructor(access = PRIVATE)
public class Api extends AggregateRoot {

    /**
     * API名称
     */
    private String name;

    /**
     * 应用id
     */
    private Long applicationId;

    /**
     * 接口分类id
     */
    private Long categoryId;

    /**
     * 接口地址
     */
    private String uri;

    /**
     * http方法
     */
    private String method;

    /**
     * 认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权
     * @see com.ark.center.iam.domain.api.vo.ApiAuthType
     */
    private ApiAuthType authType;

    /**
     * url是否包含路径参数，例： /user/{userId}/api/{apiId} 0-不包含 1-包含
     */
    private Boolean hasPathVariable;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    private EnableDisableStatus status;

    public Api(String name,
               Long applicationId,
               Long categoryId,
               String uri,
               String method,
               ApiAuthType authType) {
        this.name = name;
        this.applicationId = applicationId;
        this.categoryId = categoryId;
        this.uri = uri;
        this.method = method;
        this.authType = authType;
        this.hasPathVariable = StringUtils.contains(uri, "*");
        this.status = EnableDisableStatus.ENABLED;

        raiseEvent(new ApiCreatedEvent(this, this.getId()));

    }

    public void update(String name,
                       Long appId,
                       Long categoryId,
                       String uri,
                       String method,
                       ApiAuthType authType) {
        this.name = name;
        this.applicationId = appId;
        this.categoryId = categoryId;
        this.uri = uri;
        this.method = method;
        this.authType = authType;
        this.hasPathVariable = StringUtils.contains(uri, "*");
        raiseEvent(new ApiChangedEvent(this, this.getId()));
    }

    public void update(String name, Long categoryId) {
        this.name = name;
        this.categoryId = categoryId;
    }

    public void changeStatus(EnableDisableStatus status) {
        this.status = status;
        raiseEvent(new ApiChangedEvent(this, this.getId()));
    }

    public void changeName(String name) {
        this.name = name;
    }

    public void changeCategory(Long categoryId) {
        this.categoryId = categoryId;
    }

    public void onDelete() {
        new ApiDeletedEvent(this, this.getId());
    }

    public void onCreate() {
        raiseEvent(new ApiCreatedEvent(this, getId()));
    }

}
