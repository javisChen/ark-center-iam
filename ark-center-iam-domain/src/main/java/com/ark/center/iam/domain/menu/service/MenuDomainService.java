package com.ark.center.iam.domain.menu.service;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.support.MenuDomainDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class MenuDomainService {


    private final MenuChecker menuChecker;

    public void updateBasic(Menu menu, MenuDomainDTO domainDTO) {

        String name = domainDTO.getName();
        String code = domainDTO.getCode();
        Long menuId = menu.getId();

        menuChecker.ensureNameNotExists(menuId, name);

        menuChecker.ensureCodeNotExists(menuId, code);

        menu.updateBasic(domainDTO);

    }


}
