package com.ark.center.iam.domain.application;

import com.ark.center.iam.domain.application.event.ApplicationCreatedEvent;
import com.ark.ddd.domain.AggregateRoot;
import com.ark.ddd.domain.vo.EnableDisableStatus;
import lombok.EqualsAndHashCode;
import lombok.Getter;

@EqualsAndHashCode(callSuper = true)
@Getter
public class Application extends AggregateRoot {

    /**
     * 应用名称
     */
    private String name;

    /**
     * 应用编码
     */
    private final String code;

    /**
     * 状态 1-已上线；2-已下线；
     */
    private final EnableDisableStatus status;

    /**
     * 应用类型
     *
     * @see ApplicationType
     */
    private final ApplicationType type;

    public Application(String name, String code, ApplicationType type) {
        this.name = name;
        this.code = code;
        this.type = type;
        this.status = EnableDisableStatus.ENABLED;
        raiseEvent(new ApplicationCreatedEvent(this.getId()));
    }

    public void rename(String name) {
        this.name = name;
    }
}