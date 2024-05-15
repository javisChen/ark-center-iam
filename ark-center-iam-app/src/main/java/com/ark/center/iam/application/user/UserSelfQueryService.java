package com.ark.center.iam.application.user;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.ark.center.iam.infra.menu.repository.db.MenuDAO;
import com.ark.center.iam.infra.permission.converter.PermissionAppConverter;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.model.menu.dto.MenuDetailsDTO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.user.dto.UserMenuDTO;
import com.ark.component.cache.core.CacheHelper;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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

    public List<UserMenuDTO> queryUserSelfRoutes() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
        return CacheHelper.execute(cacheKey, key -> {
            List<PermissionDO> resourcePermissions = permissionDAO.queryUserPermissions(userId, MENU);
            List<Long> menuIds = resourcePermissions.stream()
                    .filter(Objects::nonNull)
                    .map(PermissionDO::getResourceId)
                    .collect(Collectors.toList());
            return menuDAO.selectByIds(menuIds);
        });
    }

    public List<Tree<Long>> queryUserSelfRoutesV2() {
        LoginUser user = ServiceContext.getCurrentUser();
        Long userId = user.getUserId();
//        String cacheKey = String.format(CACHE_KEY_USER_ROUTES, userId);
//        return CacheHelper.execute(cacheKey, key -> {
//            List<PermissionDO> resourcePermissions = permissionDAO.queryUserPermissions(userId, MENU);
//            List<Long> menuIds = resourcePermissions.stream()
//                    .filter(Objects::nonNull)
//                    .map(PermissionDO::getResourceId)
//                    .collect(Collectors.toList());
//            List<UserMenuDTO> userMenuDTOS = menuDAO.selectByIds(menuIds);
//            return TreeUtil.build(userMenuDTOS, 0L, (object, treeNode) -> {
//                treeNode.setId(object.getId());
//                treeNode.setParentId(object.getParentId());
//                treeNode.setWeight(object.getWeight());
//                treeNode.setName(object.getName());
//                treeNode.putAll(BeanUtil.beanToMap(object));
//            });
//        });

        List<PermissionDO> resourcePermissions = permissionDAO.queryUserPermissions(userId, MENU);
        List<Long> menuIds = resourcePermissions.stream()
                .filter(Objects::nonNull)
                .map(PermissionDO::getResourceId)
                .collect(Collectors.toList());
        List<UserMenuDTO> userMenuDTOS = menuDAO.selectByIds(menuIds);
        return TreeUtil.build(userMenuDTOS, 0L, (object, treeNode) -> {
            treeNode.setId(object.getId());
            treeNode.setParentId(object.getParentId());
            treeNode.setWeight(object.getWeight());
            treeNode.setName(object.getName());
            treeNode.putAll(BeanUtil.beanToMap(object));
        });
    }

    /**
     * 递归组装路由
     * todo 需要重构
     *
     * @param firstLevelRoutes    一级路由
     * @param childrenLevelRoutes 子路由
     */
    private void recursionRoutes(List<MenuDetailsDTO> firstLevelRoutes,
                                 List<MenuDetailsDTO> childrenLevelRoutes) {
        List<MenuDetailsDTO> vos = CollectionUtil.newArrayList();
        for (MenuDetailsDTO item : firstLevelRoutes) {
            item.setChildren(CollectionUtil.newArrayList());
            findChildren(item, childrenLevelRoutes);
            vos.add(item);
        }
    }

    private void findChildren(MenuDetailsDTO parent, List<MenuDetailsDTO> list) {
        for (MenuDetailsDTO route : list) {
            if (parent.getId().equals(route.getPid())) {
                route.setChildren(CollectionUtil.newArrayList());
                parent.getChildren().add(route);
                findChildren(route, list);
            }
        }
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
                    .collect(Collectors.toList());
        });
    }

}
