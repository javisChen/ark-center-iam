package com.ark.center.iam.application.user;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.user.executor.UserSelfQryExe;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserSelfAppService {

    private final UserSelfQryExe userSelfQryExe;

    public LoginUser queryUserSelf() {
        return ServiceContext.getCurrentUser();
    }

    public List<UserMenuDTO> queryUserSelfRoutes() {
        return userSelfQryExe.queryUserSelfRoutes();
    }

    public List<PermissionDTO> queryUserSelfElements() {
        return userSelfQryExe.queryUserSelfElements();
    }

    public List<Tree<Long>> queryUserSelfRoutesV2() {
        return userSelfQryExe.queryUserSelfRoutesV2();
    }
}
