package com.ark.center.iam.infra.application.assembler;

import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.domain.application.Application;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ApplicationAssembler {

    ApplicationDTO toApplicationDTO(Application application);

    List<ApplicationDTO> toApplicationDTO(List<Application> applications);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "gmtModified", ignore = true)
    @Mapping(target = "gmtCreate", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Application toApplicationDO(ApplicationCmd applicationCmd);
}
