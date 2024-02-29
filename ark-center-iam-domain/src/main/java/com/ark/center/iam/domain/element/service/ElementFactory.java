package com.ark.center.iam.domain.element.service;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.vo.ElementType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ElementFactory {

    public Element create(String name, ElementType type) {
        return new Element(name , type);
    }
}
