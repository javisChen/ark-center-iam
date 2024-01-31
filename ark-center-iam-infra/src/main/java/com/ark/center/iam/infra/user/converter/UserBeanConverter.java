package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.model.user.command.UserCmd;
import com.ark.center.iam.model.user.dto.UserDetailsDTO;
import com.ark.center.iam.model.user.dto.UserInnerDTO;
import com.ark.center.iam.model.user.dto.UserPageDTO;
import com.ark.center.iam.domain.user.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserBeanConverter {

    UserPageDTO toUserPageDTO(User user);

    UserDetailsDTO toUserDetailsDTO(User user);

    @Mapping(target = "userCode", source = "code")
    UserInnerDTO toUserInnerDTO(User user);

    User toUserDO(UserCmd dto);

}
