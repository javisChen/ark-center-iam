package com.ark.center.iam.domain.application.gateway;

import com.ark.center.iam.domain.application.Application;
import com.ark.component.ddd.domain.repository.BaseRepository;

public interface ApplicationRepository extends BaseRepository<Application, Long> {

    Application queryByName(String name);

    Application queryByCode(String code);
}
