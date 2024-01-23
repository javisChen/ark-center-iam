package com.ark.center.iam.domain.application;

import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import lombok.Data;
import org.springframework.stereotype.Service;

@Data
@Service
public class ApplicationDomainService {

    private final ApplicationGateway applicationGateway;
    private final ApplicationChecker applicationChecker;

    public void update(Application application, String name) {
        applicationChecker.ensureNameNotExists(application.getId(), name);
        application.rename(name);
    }
}