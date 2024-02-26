package com.ark.center.iam.infra.app.converter;

import com.ark.center.iam.domain.app.App;
import com.ark.center.iam.domain.app.ApplicationType;
import com.ark.center.iam.infra.app.repository.db.AppDO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface AppDomainConverter {

    default App toDomain(AppDO appDO) {
        return App.builder()
                .id(appDO.getId())
        		.name(appDO.getName())
        		.code(appDO.getCode())
        		.status(EnableDisableStatus.from(appDO.getStatus()))
        		.type(ApplicationType.from(appDO.getType()))
        		.build();
    }

    default AppDO fromDomain(App app) {
        AppDO appDO = new AppDO();
        appDO.setName(app.getName());
        appDO.setCode(app.getCode());
        appDO.setStatus(app.getStatus().getValue());
        appDO.setType(app.getType().getValue());
        appDO.setId(app.getId());
        appDO.setCreator(app.getCreator());
        return appDO;
    }

}
