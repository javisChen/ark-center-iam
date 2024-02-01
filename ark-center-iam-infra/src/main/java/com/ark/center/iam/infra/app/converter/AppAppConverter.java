package com.ark.center.iam.infra.app.converter;

import com.ark.center.iam.infra.app.repository.db.AppDO;
import com.ark.center.iam.model.application.query.dto.AppDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface AppAppConverter {

    AppDTO convert(AppDO appDO);

    List<AppDTO> convert(List<AppDO> apps);

}
