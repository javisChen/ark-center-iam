package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.infra.user.repository.db.UserDO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserDomainConverter {

    default UserDO fromDomain(User user) {
        UserDO userDO = new UserDO();
        userDO.setId(user.getId());
        userDO.setUsername(user.getUsername());
        userDO.setMobile(user.getMobile());
        userDO.setCode(user.getCode());
        userDO.setPassword(user.getPassword());
        userDO.setStatus(user.getStatus().getValue());
        return userDO;
    }

    default User toDomain(UserDO userDO, List<Long> roleIds, List<Long> userGroupIds) {
        User user = new User();
        user.setUsername(userDO.getUsername());
        user.setMobile(userDO.getMobile());
        user.setCode(userDO.getCode());
        user.setPassword(userDO.getPassword());
        user.setUserGroupIds(userGroupIds);
        user.setRoleIds(roleIds);
        user.setStatus(EnableDisableStatus.from(userDO.getStatus()));
        user.setId(userDO.getId());
        user.setCreateTime(userDO.getCreateTime());
        user.setUpdateTime(userDO.getUpdateTime());
        user.setCreator(userDO.getCreator());
        user.setModifier(userDO.getModifier());
        return user;
    }
}
