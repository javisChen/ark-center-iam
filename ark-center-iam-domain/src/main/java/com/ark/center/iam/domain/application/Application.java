package com.ark.center.iam.domain.application;

import com.ark.center.iam.domain.application.event.ApplicationChangedEvent;
import com.ark.center.iam.domain.application.event.ApplicationCreatedEvent;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.EqualsAndHashCode;
import lombok.Getter;

@EqualsAndHashCode(callSuper = true)
@Getter
public class Application extends AggregateRoot {

    /**
     * 应用名称
     */
    @TableField
    private String name;

    /**
     * 应用编码
     */
    @TableField
    private final String code;

    /**
     * 状态 1-已上线；2-已下线；
     */
    @TableField
    private final EnableDisableStatus status;

    /**
     * 应用类型
     *
     * @see ApplicationType
     */
    @TableField
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
        raiseEvent(new ApplicationChangedEvent(this, this.getId()));
    }
}