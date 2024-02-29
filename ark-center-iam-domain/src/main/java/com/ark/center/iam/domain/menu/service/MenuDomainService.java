package com.ark.center.iam.domain.menu.service;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.vo.ElementType;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@Slf4j
public class MenuDomainService {


    private final MenuChecker menuChecker;

    public void update(Menu menu, String name,
                       Long applicationId,
                       String code,
                       String component,
                       MenuType type,
                       Boolean hideChildren,
                       Integer sequence,
                       String path,
                       EnableDisableStatus status,
                       String icon,
                       List<Element> menuElements, Menu parentMenu) {

        Long menuId = menu.getId();

        menuChecker.ensureNameNotExists(menuId, name);

        menuChecker.ensureCodeNotExists(menuId, code);

        menu.update(name, applicationId, code, component, type, hideChildren, sequence, path, icon, status,
                menuElements, parentMenu);

        List<Element> newElements = menuElements.stream()
                .filter(e -> e.getId() == null)
                .map(e -> new Element(e.getName(), e.getType()))
                .toList();

        List<Long> existedElements = menuElements.stream()
                .map(Element::getId)
                .filter(Objects::nonNull)
                .toList();

        menu.addElements(newElements.stream().map(Element::getId).toList());

        menu.removeElements(existedElements);

    }


}
