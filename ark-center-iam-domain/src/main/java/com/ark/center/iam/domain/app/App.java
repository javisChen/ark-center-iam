package com.ark.center.iam.domain.app;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.domain.app.event.ApplicationChangedEvent;
import com.ark.center.iam.domain.app.event.ApplicationCreatedEvent;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
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
        super(IdUtil.getSnowflakeNextId());
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

    public void changeCode(String code) {
        this.code = code;
        raiseEvent(new ApplicationChangedEvent(this, this.getId()));
    }
}