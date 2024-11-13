package com.ark.center.iam.application.user.executor;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.infra.menu.service.MenuService;
import com.ark.center.iam.infra.menu.service.MenuBizTreeService;
import com.ark.center.iam.infra.permission.Permission;
import com.ark.center.iam.infra.user.service.UserPermissionService;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.component.cache.core.CacheHelper;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.ark.center.iam.infra.permission.enums.PermissionType.FRONT_ROUTE;
import static com.ark.center.iam.infra.permission.enums.PermissionType.PAGE_ELEMENT;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ELEMS;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ROUTES;

@Component
@RequiredArgsConstructor
public class UserSelfQryExe {

    private final UserPermissionService userPermissionService;

    private final MenuService menuService;
    private final MenuBizTreeService menuBizTreeService;

    private final PermissionAssembler permissionAssembler;
    private final MenuBizTreeService menuHierarchyService;

    public List<PermissionDTO> queryUserSelfElements() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ELEMS, userId);
//        return CacheHelper.execute(cacheKey, key -> {
            List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), PAGE_ELEMENT);
            return permissions.stream()
                    .filter(Objects::nonNull)
                    .map(permissionAssembler::toPermissionDTO)
                    .toList();
//        });
    }

    public List<UserMenuDTO> queryUserSelfRoutes() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
//        return CacheHelper.execute(cacheKey, key -> {
            List<Permission> permissions = userPermissionService.queryUserPermissions(userId, FRONT_ROUTE);
            List<Long> routeIds = permissions.stream()
                    .filter(Objects::nonNull)
                    .map(Permission::getResourceId)
                    .toList();
        List<UserMenuDTO> userMenuDTOS = menuService.byIds(routeIds);
        menuBizTreeService.populateNodeParams(userMenuDTOS);
        return userMenuDTOS;
//        });
    }


    public List<Tree<Long>> queryUserSelfRoutesV2() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
//        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
//        return CacheHelper.execute(cacheKey, key -> {
        List<Permission> permissions = userPermissionService.queryUserPermissions(userId, FRONT_ROUTE);
        List<Long> menuIds = permissions.stream()
                .filter(Objects::nonNull)
                .map(Permission::getResourceId)
                .collect(Collectors.toList());
        List<UserMenuDTO> userMenuDTOS = menuService.byIds(menuIds);
        return menuHierarchyService.transformToTree(userMenuDTOS);

    }
}
