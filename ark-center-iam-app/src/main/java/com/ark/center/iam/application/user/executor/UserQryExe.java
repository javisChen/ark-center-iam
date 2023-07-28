package com.ark.center.iam.application.user.executor;

import com.ark.center.iam.client.user.dto.UserBaseDTO;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.query.UserQry;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.usergroup.gateway.UserGroupGateway;
import com.ark.center.iam.domain.usergroup.vo.UserGroupVO;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.component.exception.ExceptionFactory;
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

    private final UserGateway userGateway;
    private final RoleGateway roleGateway;
    private final UserGroupGateway userGroupGateway;
    private final UserBeanConverter userBeanConverter;

    public Page<UserPageDTO> pageQuery(UserPageQry qry) {
        Page<UserPageDTO> userPageDTOPage = userGateway.selectUsers(qry);
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
        List<UserGroupVO> userGroups = userGroupGateway.selectUserGroupsByUserIds(userIds);
        return userGroups.stream()
                .collect(Collectors.groupingBy(UserGroupVO::getUserId));
    }

    private Map<Long, List<UserRoleVO>> collectUserRoles(List<Long> userIds) {
        List<UserRoleVO> userRoles = roleGateway.selectRolesByUserIds(userIds);
        return userRoles.stream()
                .collect(Collectors.groupingBy(UserRoleVO::getUserId));
    }

    public UserDetailsDTO queryUserDetails(Long userId) {
        User user = userGateway.selectByUserId(userId);
        UserDetailsDTO userDetailsDTO = userBeanConverter.toUserDetailsDTO(user);
        userDetailsDTO.setRoleIds(roleGateway.selectRoleIdsByUserId(userId));
        userDetailsDTO.setUserGroupIds(userGroupGateway.selectUserGroupIdsByUserId(userId));
        return userDetailsDTO;
    }

    public User queryUserByUnique(UserQry userQry) {
        String phone = userQry.getPhone();
        String userName = userQry.getUserName();
        User user = null;
        if (StringUtils.isNotBlank(phone)) {
            user = userGateway.selectByPhone(phone);
        } else if (StringUtils.isNotBlank(userName)) {
            user = userGateway.selectByUserName(userName);
        }
        if (user == null) {
            throw ExceptionFactory.userException("用户不存在");
        }
        return user;
    }
}
