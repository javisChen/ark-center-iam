package com.ark.center.iam.domain.app;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ApplicationFactory {

    private final AppChecker appChecker;

    public App create(String name, String code, Integer type) {

        appChecker.ensureNameNotExists(name);

        appChecker.ensureCodeNotExists(code);

        return new App(name, code, ApplicationType.from(type));

    }

}
