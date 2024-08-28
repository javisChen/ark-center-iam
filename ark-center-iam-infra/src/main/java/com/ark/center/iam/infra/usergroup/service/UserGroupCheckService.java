package com.ark.center.iam.infra.usergroup.service;

import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.component.orm.mybatis.service.CheckService;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

@Service
public class UserGroupCheckService extends CheckService<UserGroup> {

    public UserGroupCheckService(IService<UserGroup> service) {
        super(service);
    }

    public void ensureNameNotExists(String name, Long id) {
        ensureRecordNotExists(UserGroup::getName, name, id, "用户组名称已存在");
    }
}
