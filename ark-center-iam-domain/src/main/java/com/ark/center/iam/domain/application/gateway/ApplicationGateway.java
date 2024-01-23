package com.ark.center.iam.domain.application.gateway;

import com.ark.center.iam.domain.application.Application;

import java.util.List;

public interface ApplicationGateway {

    void save(Application application);

    void update(Application application);

    Application queryById(Long applicationId);

    Application queryByName(String name);

    Application queryByCode(String code);
}
