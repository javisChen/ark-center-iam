package com.ark.center.iam.domain.menuhierarchy;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuHierarchyFactory {

    public MenuHierarchy create(Long applicationId) {
        return new MenuHierarchy(applicationId);
    }

}
