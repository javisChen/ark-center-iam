package com.ark.center.iam.application.user;

import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.domain.usergroup.vo.UserGroupVO;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.center.iam.infra.role.repository.db.RoleDAO;
import com.ark.center.iam.infra.user.converter.UserAppConverter;
import com.ark.center.iam.infra.user.repository.db.UserDAO;
import com.ark.center.iam.infra.user.repository.db.UserDO;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDAO;
import com.ark.center.iam.model.user.dto.*;
import com.ark.center.iam.model.user.query.UserPageQuery;
import com.ark.center.iam.model.user.query.UserPermissionQuery;
import com.ark.center.iam.model.user.query.UserQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserQueryService {

    private final UserAppConverter userAppConverter;
    private final UserPermissionService userPermissionService;
    private final PermissionDomainConverter permissionDomainConverter;
    private final UserDAO userDAO;
    private final RoleDAO roleDAO;
    private final UserGroupDAO userGroupDAO;

    public IPage<UserPageDTO> queryPages(UserPageQuery qry) {
        IPage<UserPageDTO> userPageDTOPage = userDAO.selectUsers(qry);
        if (userPageDTOPage.getTotal() == 0) {
            return userPageDTOPage;
        }
        List<UserPageDTO> records = userPageDTOPage.getRecords();
        List<Long> userIds = records.stream().map(UserBaseDTO::getId).toList();
        Map<Long, List<UserRoleVO>> userRolesHolder = collectUserRoles(userIds);
        Map<Long, List<UserGroupVO>> userGroupsHolder = collectUserGroups(userIds);
        for (UserPageDTO record : records) {
            Long userId = record.getId();
            record.setRoles(userRolesHolder.getOrDefault(userId, Collections.emptyList())
                    .stream()
                    .map(UserRoleVO::getRoleName)
                    .toList());
            record.setUserGroups(userGroupsHolder.getOrDefault(userId, Collections.emptyList())
                    .stream()
                    .map(UserGroupVO::getUserGroupName)
                    .toList());
        }
        return userPageDTOPage;
    }

    private Map<Long, List<UserGroupVO>> collectUserGroups(List<Long> userIds) {
        List<UserGroupVO> userGroups = userGroupDAO.getBaseMapper().selectUserGroupsByUserIds(userIds);
        return userGroups.stream()
                .collect(Collectors.groupingBy(UserGroupVO::getUserId));
    }

    private Map<Long, List<UserRoleVO>> collectUserRoles(List<Long> userIds) {
        List<UserRoleVO> userRoles = roleDAO.getBaseMapper().selectRolesByUserIds(userIds);
        return userRoles.stream()
                .collect(Collectors.groupingBy(UserRoleVO::getUserId));
    }

    public UserDetailsDTO queryDetails(Long userId) {
        UserDO user = userDAO.getById(userId);
        UserDetailsDTO userDetailsDTO = userAppConverter.toUserDetailsDTO(user);
        userDetailsDTO.setRoleIds(roleDAO.selectRoleIdsByUserId(userId));
        userDetailsDTO.setUserGroupIds(userGroupDAO.selectUserGroupIdsByUserId(userId));
        return userDetailsDTO;
    }

    public UserInnerDTO queryBasicInfo(UserQuery userQuery) {
        UserDO userDO = userDAO.selectByUnique(userQuery);
        if (userDO == null) {
            return null;
        }
        return userAppConverter.toUserInnerDTO(userDO);
    }

    public Boolean checkApiHasPermission(UserPermissionQuery userPermissionQuery) {
        Long userId = userPermissionQuery.getUserId();
        String requestUri = userPermissionQuery.getRequestUri();
        String method = userPermissionQuery.getMethod();
        return userPermissionService.checkHasApiPermission(userId, requestUri, method);
    }

    public List<UserApiPermissionDTO> queryApiPermissions(Long userId) {
        List<ApiPermissionVO> userApiPermissions = userPermissionService.getUserApiPermissions(userId);
        return permissionDomainConverter.toUserApiPermissionDTO(userApiPermissions);
    }
}
