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
        App app = new App();
        app.setName(appDO.getName());
        app.setCode(appDO.getCode());
        app.setStatus(EnableDisableStatus.from(appDO.getStatus()));
        app.setType(ApplicationType.from(appDO.getType()));
        app.setId(appDO.getId());
        app.setCreateTime(appDO.getCreateTime());
        app.setUpdateTime(appDO.getUpdateTime());
        app.setCreator(appDO.getCreator());
        app.setModifier(appDO.getModifier());
        return app;
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
