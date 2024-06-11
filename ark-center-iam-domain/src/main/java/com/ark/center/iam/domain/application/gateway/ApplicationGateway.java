package com.ark.center.iam.domain.application.gateway;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQuery;
import com.ark.center.iam.domain.application.Application;

import java.util.List;

public interface ApplicationGateway {

    List<ApplicationDTO> selectApplications(ApplicationQuery dto);

    void insert(Application application);

    void update(Application application);

    Application selectByCode(String code);

    Application selectByName(String name);

    Application queryById(Long applicationId);
}
