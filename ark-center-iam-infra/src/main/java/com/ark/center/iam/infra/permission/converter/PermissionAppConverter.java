package com.ark.center.iam.infra.permission.converter;

import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;


@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface PermissionAppConverter {

    default PermissionDTO toPermissionDTO(PermissionDO permissionDO) {
        return new PermissionDTO(permissionDO.getId(), permissionDO.getCode());
    }

    List<UserApiPermissionDTO> toUserApiPermissionDTO(List<ApiPermissionVO> permissions);

}
