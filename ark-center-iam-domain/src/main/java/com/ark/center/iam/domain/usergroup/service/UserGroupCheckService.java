package com.ark.center.iam.domain.usergroup.service;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.component.orm.mybatis.service.CheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserGroupCheckService extends CheckService<UserGroup> {

    public void ensureNameNotExists(String name, Long id) {
        ensureRecordNotExists(UserGroup::getName, name, id, "用户组名称已存在");
    }
}
