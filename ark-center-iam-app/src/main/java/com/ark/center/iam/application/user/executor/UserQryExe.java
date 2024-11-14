package com.ark.center.iam.application.user.executor;

import com.ark.center.iam.client.user.dto.UserBaseDTO;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.client.user.query.UserQuery;

import com.ark.center.iam.infra.role.service.RoleService;
import com.ark.center.iam.infra.role.vo.UserRoleVO;
import com.ark.center.iam.infra.user.User;

import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.vo.UserGroupVO;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.center.iam.infra.user.db.UserDAO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class UserQryExe {

    private final UserDAO userDAO;
    private final RoleService roleGateway;
    private final UserGroupService userGroupService;
    private final UserBeanConverter userBeanConverter;

    public Page<UserPageDTO> pageQuery(UserPageQuery qry) {
        Page<UserPageDTO> userPageDTOPage = userDAO.selectUsers(qry);
        List<UserPageDTO> records = userPageDTOPage.getRecords();
        if (CollectionUtils.isEmpty(records)) {
            return userPageDTOPage;
        }
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
        List<UserGroupVO> userGroups = userGroupService.selectUserGroupsByUserIds(userIds);
        return userGroups.stream()
                .collect(Collectors.groupingBy(UserGroupVO::getUserId));
    }

    private Map<Long, List<UserRoleVO>> collectUserRoles(List<Long> userIds) {
        List<UserRoleVO> userRoles = roleGateway.selectRolesByUserIds(userIds);
        return userRoles.stream()
                .collect(Collectors.groupingBy(UserRoleVO::getUserId));
    }

    public UserDetailsDTO queryUserDetails(Long userId) {
        User user = userDAO.selectByUserId(userId);
        UserDetailsDTO userDetailsDTO = userBeanConverter.toUserDetailsDTO(user);
        userDetailsDTO.setRoleIds(roleGateway.queryRoleIdsByUserId(userId));
        userDetailsDTO.setUserGroupIds(userGroupService.selectUserGroupIdsByUserId(userId));
        return userDetailsDTO;
    }

    public User queryUserByUnique(UserQuery userQuery) {
        String mobile = userQuery.getMobile();
        String username = userQuery.getUsername();
        User user = null;
        if (StringUtils.isNotBlank(mobile)) {
            user = userDAO.selectByMobile(mobile);
        } else if (StringUtils.isNotBlank(username)) {
            user = userDAO.selectByUsername(username);
        }
        return user;
    }
}
