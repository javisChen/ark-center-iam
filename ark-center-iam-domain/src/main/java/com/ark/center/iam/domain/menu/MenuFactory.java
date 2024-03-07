package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.menu.service.MenuChecker;
import com.ark.center.iam.domain.menu.support.MenuDomainDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuFactory {

    private final MenuChecker menuChecker;

    public Menu create(MenuDomainDTO domainDTO) {

        String name = domainDTO.getName();
        String code = domainDTO.getCode();

        menuChecker.ensureNameNotExists(name);

        menuChecker.ensureCodeNotExists(code);

        return new Menu(domainDTO);
    }

}
