package com.ark.center.iam.application.user.executor;

import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.component.cache.core.CacheHelper;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

import static com.ark.center.iam.domain.permission.enums.PermissionType.MENU;
import static com.ark.center.iam.domain.permission.enums.PermissionType.MENU_ELEMENT;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ELEMS;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ROUTES;

@Component
@RequiredArgsConstructor
public class UserSelfQryExe {

    private final UserPermissionService userPermissionService;

    private final MenuRepository menuRepository;

    private final PermissionDomainConverter permissionDomainConverter;

    public List<PermissionDTO> queryUserSelfElements() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ELEMS, userId);
        return CacheHelper.execute(cacheKey, key -> {
            List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), MENU_ELEMENT);
            return permissions.stream()
                    .filter(Objects::nonNull)
                    .map(permissionDomainConverter::toPermissionDTO)
                    .toList();
        });
    }

    public List<UserRouteDTO> queryUserSelfRoutes() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
        return CacheHelper.execute(cacheKey, key -> {
            List<Permission> permissions = userPermissionService.queryUserPermissions(userId, MENU);
            List<Long> routeIds = permissions.stream()
                    .filter(Objects::nonNull)
                    .map(Permission::getResourceId)
                    .toList();
            return menuRepository.selectByRouteIds(routeIds);
        });
    }
}
