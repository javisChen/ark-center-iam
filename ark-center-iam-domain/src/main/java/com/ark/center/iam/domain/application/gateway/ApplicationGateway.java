package com.ark.center.iam.domain.application.gateway;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.dto.ApplicationListDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;

import java.util.List;

public interface ApplicationGateway {

    List<ApplicationDTO> selectApplications(ApplicationQry dto);
}
