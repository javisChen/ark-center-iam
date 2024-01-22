package com.ark.center.iam.domain.application;

import com.ark.component.ddd.vo.EnableDisableStatus;
import lombok.Data;

@Data
public class Application  {

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
     *
     * @see ApplicationType
     */
    private ApplicationType type;
}