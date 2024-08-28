package com.ark.center.iam.infra.application.assembler;

import com.ark.center.iam.client.application.command.ApplicationCommand;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.infra.application.Application;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApplicationAssembler {

    ApplicationDTO toApplicationDTO(Application application);

    List<ApplicationDTO> toApplicationDTO(List<Application> applications);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Application toDomain(ApplicationCommand applicationCommand);
}
