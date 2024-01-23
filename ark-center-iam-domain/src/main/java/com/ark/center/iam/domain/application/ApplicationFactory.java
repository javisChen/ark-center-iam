package com.ark.center.iam.domain.application;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ApplicationFactory {

    private final ApplicationChecker applicationChecker;

    public Application create(String name, String code, Integer type) {

        applicationChecker.ensureNameNotExists(name);

        applicationChecker.ensureCodeNotExists(code);

        return new Application(name, code, ApplicationType.from(type));
    }

}
