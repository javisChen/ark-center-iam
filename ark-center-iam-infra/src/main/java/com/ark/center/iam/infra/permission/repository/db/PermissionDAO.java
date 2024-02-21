package com.ark.center.iam.infra.permission.repository.db;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.infra.role.repository.db.RoleDAO;
import com.ark.center.iam.infra.user.repository.db.UserDAO;
import com.ark.center.iam.infra.user.repository.db.UserDO;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDAO;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import java.util.Collections;
import java.util.List;

/**
 * <p>
 * 权限表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
@RequiredArgsConstructor
public class PermissionDAO extends ServiceImpl<PermissionMapper, PermissionDO> {

    private final UserDAO userDAO;
    private final RoleDAO roleDAO;
    private final UserGroupDAO userGroupDAO;
    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    public List<PermissionDO> queryUserPermissions(Long userId, PermissionType permissionType) {
        UserDO user = userDAO.getById(userId);
        String userCode = user.getCode();
        List<PermissionDO> resourcePermissions;
        // 超管直接赋予所有权限
        if (isSuperAdmin(userCode)) {
            resourcePermissions = selectByType(permissionType);
        } else {
            List<Long> roleIds = queryUserRoles(userId);
            resourcePermissions = baseMapper.selectByRoleIdsAndType(roleIds, permissionType.getName());
        }
        return resourcePermissions;
    }

    private List<PermissionDO> selectByType(PermissionType permissionType) {
        return lambdaQuery()
                .eq(PermissionDO::getType, permissionType.getName())
                .list();
    }

    public boolean isSuperAdmin(String userCode) {
        return UserConst.SUPER_ADMIN.equals(userCode);
    }

    /**
     * 获取用户的所有角色
     */
    private List<Long> queryUserRoles(Long userId) {
        // 用户自身拥有的角色
        List<Long> roleIds = roleDAO.selectIdsByUserId(userId);
        // 用户所归属的用户组所拥有的角色
        List<Long> userGroupIds = userGroupDAO.selectUserGroupIdsByUserId(userId, true);
        List<Long> userGroupsRoleIds = roleDAO.selectRoleIdsByUserGroupIds(userGroupIds);
        roleIds.addAll(userGroupsRoleIds);
        return roleIds.stream().distinct().toList();
    }

    public boolean checkHasApiPermission(Long userId, String url, String method) {
        UserDO user = userDAO.getById(userId);
        if (user == null) {
            return false;
        }
        // 超管账号直接通过
        if (isSuperAdmin(user.getCode())) {
            return true;
        }
        List<Long> roleIds = queryUserRoles(userId);
        // 如果账号包含超管角色，直接通过
        if (roleIds.stream().anyMatch(item -> item.equals(1L))) {
            return true;
        }
        List<ApiPermissionVO> apiPermissions = queryPermissionByRoleIds(roleIds);
        return apiPermissions.stream().anyMatch(item -> matchApi(url, method, item));
    }

    public List<ApiPermissionVO> queryPermissionByRoleIds(List<Long> roleIds) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return baseMapper.selectApiPermissionsByRoleIds(roleIds);
    }

    public List<ApiPermissionVO> getUserApiPermissions(Long userId) {
        List<Long> roleIds = queryUserRoles(userId);
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return queryPermissionByRoleIds(roleIds);
    }

    private boolean matchApi(String uri, String method, ApiPermissionVO item) {
        boolean methodEquals = item.getApiMethod().equalsIgnoreCase(method);
        boolean uriEquals = antPathMatcher.match(item.getApiUri(), uri);
        return methodEquals && uriEquals;
    }

    public List<PermissionDO> selectByTypeAndRoleIds(List<Long> roleIds, PermissionType permissionType) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return getBaseMapper().selectByRoleIdsAndType(roleIds, permissionType.getName());
    }
}
