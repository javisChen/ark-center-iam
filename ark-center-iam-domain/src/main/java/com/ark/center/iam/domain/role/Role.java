package com.ark.center.iam.domain.role;


import cn.hutool.core.util.IdUtil;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import static lombok.AccessLevel.PRIVATE;

@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@AllArgsConstructor(access = PRIVATE)
public class Role extends AggregateRoot {

    /**
     * 用户名称
     */
    private String name;

    /**
     * 角色编码
     */
    private String code;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    private EnableDisableStatus status;

    public Role(String name, String code) {
        super(IdUtil.getSnowflakeNextId());
        this.name = name;
        this.code = code;
        this.status = EnableDisableStatus.ENABLED;
    }

    public void update(String name, String code) {
        this.name = name;
        this.code = code;
    }
}
