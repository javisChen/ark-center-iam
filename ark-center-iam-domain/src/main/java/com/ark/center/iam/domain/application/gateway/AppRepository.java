package com.ark.center.iam.domain.application.gateway;

import com.ark.center.iam.domain.application.App;
import com.ark.component.ddd.domain.repository.BaseRepository;

public interface AppRepository extends BaseRepository<App, Long> {

    boolean existsByName(String name);

    boolean existsByName(Long excludeId, String name);

    boolean existsByCode(String code);

    boolean existsByCode(Long excludeId, String code);
}
