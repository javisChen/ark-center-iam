package com.ark.center.iam.domain.application;

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
    private Integer status;

    /**
     * 应用类型 1-业务系统（前后端）2-纯后台服务
     */
    private Integer type;
}