package com.ark.center.iam.application.user;

import com.ark.center.iam.infra.menu.repository.db.MenuDAO;
import com.ark.center.iam.infra.permission.converter.PermissionAppConverter;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.component.cache.core.CacheHelper;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

import static com.ark.center.iam.domain.permission.vo.PermissionType.MENU;
import static com.ark.center.iam.domain.permission.vo.PermissionType.MENU_ELEMENT;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ELEMS;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ROUTES;

@Service
@RequiredArgsConstructor
public class UserSelfQueryService {

    private final PermissionDAO permissionDAO;

    private final MenuDAO menuDAO;

    private final PermissionAppConverter appConverter;

    public LoginUser queryUserSelf() {
        return ServiceContext.getCurrentUser();
    }

    public List<UserRouteDTO> queryUserSelfRoutes() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
        return CacheHelper.execute(cacheKey, key -> {
            List<PermissionDO> resourcePermissions = permissionDAO.queryUserPermissions(userId, MENU);
            List<Long> menuIds = resourcePermissions.stream()
                    .filter(Objects::nonNull)
                    .map(PermissionDO::getResourceId)
                    .toList();
            return menuDAO.selectByIds(menuIds);
        });
    }

    public List<PermissionDTO> queryUserSelfElements() {

        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ELEMS, userId);
        return CacheHelper.execute(cacheKey, key -> {
            List<PermissionDO> resourcePermissions = permissionDAO.queryUserPermissions(user.getUserId(), MENU_ELEMENT);
            return resourcePermissions.stream()
                    .filter(Objects::nonNull)
                    .map(appConverter::toPermissionDTO)
                    .toList();
        });
    }

}
