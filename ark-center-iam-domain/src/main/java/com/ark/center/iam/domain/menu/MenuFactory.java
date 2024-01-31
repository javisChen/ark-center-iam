package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.menu.service.MenuChecker;
import com.ark.center.iam.domain.menu.vo.Element;
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
                       Long pid,
                       Integer sequence,
                       String path,
                       String icon,
                       List<Element> elements,
                       Menu parentMenu) {

        baseCheck(name, code);

        return new Menu(name,
                applicationId,
                code,
                component,
                type,
                hideChildren,
                pid,
                sequence,
                path,
                icon,
                elements,
                parentMenu);

    }

    private void baseCheck(String name, String code) {
        menuChecker.ensureNameNotExists(name);
        menuChecker.ensureCodeNotExists(code);
    }

}
