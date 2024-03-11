package com.ark.center.iam.domain.menuhierarchy;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuHierarchyFactory {

    public MenuHierarchy create() {

        return new MenuHierarchy();
    }

}
