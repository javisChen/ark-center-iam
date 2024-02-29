package com.ark.center.iam.domain.element.repository;

import com.ark.center.iam.domain.element.Element;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ElementRepository extends BaseRepository<Element, Long> {

    List<Element> byMenuId(Long menuId);
}
