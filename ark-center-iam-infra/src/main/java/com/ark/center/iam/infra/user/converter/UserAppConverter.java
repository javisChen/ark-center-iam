package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.infra.user.repository.db.UserDO;
import com.ark.center.iam.model.user.dto.UserDetailsDTO;
import com.ark.center.iam.model.user.dto.UserInnerDTO;
import com.ark.center.iam.model.user.dto.UserPageDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserAppConverter {

    default UserPageDTO toUserPageDTO(UserDO userDO) {
        UserPageDTO userPageDTO = new UserPageDTO();
        userPageDTO.setId(userDO.getId());
        userPageDTO.setMobile(userDO.getMobile());
        userPageDTO.setUsername(userDO.getUsername());
        userPageDTO.setUserCode(userDO.getCode());
        userPageDTO.setIsSuperAdmin(userDO.getCode().equalsIgnoreCase(UserConst.SUPER_ADMIN));
        userPageDTO.setStatus(userDO.getStatus());
        return userPageDTO;
    }

    default UserDetailsDTO toUserDetailsDTO(UserDO userDO) {
        UserDetailsDTO userDetailsDTO = new UserDetailsDTO();
        userDetailsDTO.setId(userDO.getId());
        userDetailsDTO.setMobile(userDO.getMobile());
        userDetailsDTO.setUsername(userDO.getUsername());
        userDetailsDTO.setUserCode(userDO.getCode());
        userDetailsDTO.setIsSuperAdmin(userDO.getCode().equalsIgnoreCase(UserConst.SUPER_ADMIN));
        userDetailsDTO.setStatus(userDO.getStatus());
        return userDetailsDTO;
    }

    default UserInnerDTO toUserInnerDTO(UserDO user) {
        UserInnerDTO userInnerDTO = new UserInnerDTO();
        userInnerDTO.setPassword(user.getPassword());
        userInnerDTO.setId(user.getId());
        userInnerDTO.setMobile(user.getMobile());
        userInnerDTO.setUsername(user.getUsername());
        userInnerDTO.setUserCode(user.getCode());
        userInnerDTO.setIsSuperAdmin(user.getCode().equalsIgnoreCase(UserConst.SUPER_ADMIN));
        userInnerDTO.setStatus(user.getStatus());
        return userInnerDTO;
    }

}
