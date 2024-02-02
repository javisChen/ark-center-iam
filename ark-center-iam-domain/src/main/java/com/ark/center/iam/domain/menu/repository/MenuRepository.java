package com.ark.center.iam.domain.menu.repository;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface MenuRepository extends BaseRepository<Menu, Long> {

    List<UserRouteDTO> selectByRouteIds(List<Long> routeIds);

    boolean existsByName(Long excludeId, String name);

    boolean existsByCode(Long excludeId, String code);

    boolean existsByName(String name);

    boolean existsByCode(String code);
}
