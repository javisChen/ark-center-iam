package com.ark.center.iam.infra.application.assembler;

import com.ark.center.iam.client.application.command.ApplicationCreateCommand;
import com.ark.center.iam.client.application.query.dto.ApplicationDTO;
import com.ark.center.iam.domain.application.App;
import com.ark.center.iam.infra.application.gateway.db.ApplicationDO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ApplicationAssembler {

    ApplicationDTO toApplicationDTO(ApplicationDO application);

    List<ApplicationDTO> toApplicationDTO(List<ApplicationDO> applications);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    App toDomain(ApplicationCreateCommand applicationCreateCommand);
}
