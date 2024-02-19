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
        return User.builder()
        		.username(userDO.getUsername())
        		.mobile(userDO.getMobile())
        		.code(userDO.getCode())
        		.password(userDO.getPassword())
        		.userGroupIds(userGroupIds)
        		.roleIds(roleIds)
        		.status(EnableDisableStatus.from(userDO.getStatus()))
        		.build();
    }
}
