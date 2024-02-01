package com.ark.center.iam.domain.menu.service;

import com.ark.center.iam.domain.menu.Menu;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class MenuDomainService {


    private final MenuChecker menuChecker;

    public void update(Menu menu, Menu willUpdateMenu, Menu parentMenu) {

        check(willUpdateMenu);

        menu.updateInfo(willUpdateMenu);

        if (parentMenu != null && !parentMenu.getId().equals(menu.getPid())) {
            menu.changeHierarchy(parentMenu);
        }

        menu.changeChildrenStatus(willUpdateMenu.getStatus());

    }

    private void check(Menu willUpdateMenu) {
        menuChecker.ensureNameNotExists(willUpdateMenu.getId(), willUpdateMenu.getName());
        menuChecker.ensureCodeNotExists(willUpdateMenu.getId(), willUpdateMenu.getCode());
    }
}
