package com.ark.center.iam.domain.menu;

import com.ark.component.ddd.domain.repository.BaseRepository;

public interface MenuRepository extends BaseRepository<Menu, Long> {

    boolean existsByName(Long excludeId, String name);

    boolean existsByCode(Long excludeId, String code);

    boolean existsByName(String name);

    boolean existsByCode(String code);
}
