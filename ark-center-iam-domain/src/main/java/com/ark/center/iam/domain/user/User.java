package com.ark.center.iam.domain.user;

import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class User extends AggregateRoot {

    /**
     * 用户名称
     */
    private String username;

    /**
     * 手机号码
     */
    private String mobile;

    /**
     * 用户编码
     */
    private String code;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户所属的部门
     */
    private List<Long> userGroupIds;

    /**
     * 用户所拥有的角色
     */
    private List<Long> roleIds;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    private EnableDisableStatus status;


    public User(String username,
                String mobile,
                String code,
                String password,
                List<Long> roleIds,
                List<Long> userGroupIds) {
        this.username = username;
        this.mobile = mobile;
        this.code = code;
        this.password = password;
        this.roleIds = roleIds;
        this.userGroupIds = userGroupIds;
    }

}
