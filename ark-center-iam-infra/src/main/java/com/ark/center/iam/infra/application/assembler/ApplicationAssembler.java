package com.ark.center.iam.infra.application.assembler;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.dto.ApplicationListDTO;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.resource.ResourceRoute;
import com.ark.center.iam.infra.application.gateway.db.Application;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ApplicationAssembler {

    ApplicationDTO toApplicationDTO(Application application);

    List<ApplicationDTO> toApplicationDTO(List<Application> applications);
}
