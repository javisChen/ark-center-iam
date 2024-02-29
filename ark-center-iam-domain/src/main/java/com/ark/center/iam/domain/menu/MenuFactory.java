package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.menu.service.MenuChecker;
import com.ark.center.iam.domain.menu.vo.MenuType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuFactory {

    private final MenuChecker menuChecker;

    public Menu create(String name,
                       Long applicationId,
                       String code,
                       String component,
                       MenuType type,
                       Boolean hideChildren,
                       Integer sequence,
                       String path,
                       String icon,
                       List<Long> elementIds,
                       Menu parentMenu) {

        menuChecker.ensureNameNotExists(name);

        menuChecker.ensureCodeNotExists(code);

        return new Menu(name, applicationId, code, component, type, hideChildren, sequence, path, icon, elementIds,
                parentMenu);
    }

}
