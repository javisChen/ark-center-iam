package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.domain.user.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserBeanConverter {

    UserPageDTO toUserPageDTO(User user);

    UserDetailsDTO toUserDetailsDTO(User user);

    User toUserDO(UserCmd dto);

}
