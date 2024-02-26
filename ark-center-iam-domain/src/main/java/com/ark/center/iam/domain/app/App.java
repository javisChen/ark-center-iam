package com.ark.center.iam.domain.app;

import com.ark.center.iam.domain.app.event.ApplicationChangedEvent;
import com.ark.center.iam.domain.app.event.ApplicationCreatedEvent;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.SuperBuilder;

import static lombok.AccessLevel.PRIVATE;

@EqualsAndHashCode(callSuper = true)
@Data
@SuperBuilder
@AllArgsConstructor(access = PRIVATE)
public class App extends AggregateRoot {

    /**
     * 应用名称
     */
    private String name;

    /**
     * 应用编码
     */
    private String code;

    /**
     * 状态 1-已上线；2-已下线；
     */
    private EnableDisableStatus status;

    /**
     * 应用类型
     *
     * @see ApplicationType
     */
    private ApplicationType type;

    public App(String name, String code, ApplicationType type) {
        this.name = name;
        this.code = code;
        this.type = type;
        this.status = EnableDisableStatus.ENABLED;
        raiseEvent(new ApplicationCreatedEvent(this, this.getId()));
    }

    public void rename(String name) {
        this.name = name;
        raiseEvent(new ApplicationChangedEvent(this, this.getId()));
    }
}