package com.ark.center.iam.application.user.executor;

import com.alibaba.fastjson.JSON;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.component.cache.CacheService;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

import static com.ark.center.iam.domain.permission.enums.PermissionType.FRONT_ROUTE;
import static com.ark.center.iam.domain.permission.enums.PermissionType.PAGE_ELEMENT;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ROUTES;

@Component
@RequiredArgsConstructor
public class UserSelfQryExe {

    private final UserPermissionService userPermissionService;

    private final RouteGateway routeGateway;

    private final PermissionAssembler permissionAssembler;

    private final CacheService cacheService;

    public List<PermissionDTO> queryUserSelfElements() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
        Object cache = cacheService.get(cacheKey);
        if (cache != null) {
            return JSON.parseArray((String) cache, PermissionDTO.class);
        }
        List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), PAGE_ELEMENT);
        List<PermissionDTO> result = permissions.stream()
                .filter(Objects::nonNull)
                .map(permissionAssembler::toPermissionDTO)
                .toList();
        cacheService.set(cacheKey, JSON.toJSONString(result));
        return result;
    }

    public List<UserRouteDTO> queryUserSelfRoutes() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
        Object cache = cacheService.get(cacheKey);
        if (cache != null) {
            return JSON.parseArray((String) cache, UserRouteDTO.class);
        }
        List<Permission> permissions = userPermissionService.queryUserPermissions(userId, FRONT_ROUTE);
        List<Long> routeIds = permissions.stream()
                .filter(Objects::nonNull)
                .map(Permission::getResourceId)
                .toList();
        List<UserRouteDTO> result = routeGateway.selectByRouteIds(routeIds);
        cacheService.set(cacheKey, JSON.toJSONString(result));
        return result;
    }
}
