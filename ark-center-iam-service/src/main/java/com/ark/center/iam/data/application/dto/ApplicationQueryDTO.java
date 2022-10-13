package com.ark.center.iam.data.application.dto;

import com.ark.component.dto.PagingQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ApplicationQueryDTO extends PagingQuery {

    private String name;

    /**
     * 状态 1-已上线；2-已下线；
     */
    private Integer status;

    /**
     * 应用类型 1-业务系统（前后端）2-纯后台服务
     */
    private Integer type;

}
