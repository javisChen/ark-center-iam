package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.menu.service.MenuChecker;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuFactory {

    private final MenuChecker menuChecker;

    public Menu create(Menu menu, Menu parentMenu) {

        String name = menu.getName();
        String code = menu.getCode();

        baseCheck(name, code);

        return new Menu(menu, parentMenu);

    }

    private void baseCheck(String name, String code) {
        menuChecker.ensureNameNotExists(name);
        menuChecker.ensureCodeNotExists(code);
    }

}
