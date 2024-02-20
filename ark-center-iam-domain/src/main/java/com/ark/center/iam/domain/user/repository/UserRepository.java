package com.ark.center.iam.domain.user.repository;

import com.ark.center.iam.domain.user.User;
import com.ark.component.ddd.domain.repository.BaseRepository;

public interface UserRepository extends BaseRepository<User, Long> {

    Long countUserByCode(String code);

    boolean existsByMobile(Long id, String mobile);

    boolean existsByMobile(String mobile);

}
