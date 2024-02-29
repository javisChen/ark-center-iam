package com.ark.center.iam.domain.user.service;

import com.ark.center.iam.domain.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserDomainService {

    public void update(User user, String username, String mobile, List<Long> roleIds, List<Long> userGroupIds) {

        user.update(username, mobile, roleIds, userGroupIds);


    }
}
