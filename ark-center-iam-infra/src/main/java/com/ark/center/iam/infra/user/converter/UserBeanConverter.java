package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.client.user.command.UserCommand;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.infra.user.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserBeanConverter {

    UserPageDTO toUserPageDTO(User user);

    UserDetailsDTO toUserDetailsDTO(User user);

    @Mapping(target = "userCode", source = "code")
    UserInnerDTO toUserInnerDTO(User user);

    User toUserDO(UserCommand dto);

}
