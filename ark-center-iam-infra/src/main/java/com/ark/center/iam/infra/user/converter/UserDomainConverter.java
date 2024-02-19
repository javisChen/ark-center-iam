package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.infra.user.repository.db.UserDO;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.center.iam.model.user.dto.UserDetailsDTO;
import com.ark.center.iam.model.user.dto.UserInnerDTO;
import com.ark.center.iam.model.user.dto.UserPageDTO;
import com.ark.center.iam.domain.user.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserDomainConverter {

    UserPageDTO toUserPageDTO(User user);

    UserDetailsDTO toUserDetailsDTO(User user);

    @Mapping(target = "userCode", source = "code")
    default UserInnerDTO toUserInnerDTO(User user) {
        return null;
    }

    User toUserDO(UserCreateCommand dto);

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
}
