package com.ark.center.iam.application.user;

import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.UserFactory;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.service.UserDomainService;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.center.iam.model.user.command.UserUpdateCommand;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserCommandHandler implements InitializingBean {


    private final UserRepository userRepository;

    private final UserFactory userFactory;

    private final UserDomainService userDomainService;



    @Transactional(rollbackFor = Throwable.class)
    public void updateUser(UserUpdateCommand command) {

        log.info("[User]: Begin Update User, User = {}", command);

        String username = command.getUsername();
        String mobile = command.getMobile();
        List<Long> roleIds = command.getRoleIds();
        List<Long> userGroupIds = command.getUserGroupIds();

        User user = userRepository.byIdOrThrowError(command.getId(), "用户不存在");

        userDomainService.update(user, username, mobile, roleIds, userGroupIds);

        userRepository.saveAndPublishEvents(user);

    }

    @Transactional(rollbackFor = Throwable.class)
    public Long createUser(UserCreateCommand command) {

        log.info("[User]: Begin Create User, User = {}", command);

        String username = command.getUsername();
        String mobile = command.getMobile();
        String password = command.getPassword();
        List<Long> roleIds = command.getRoleIds();
        List<Long> userGroupIds = command.getUserGroupIds();

        User user = userFactory.create(username, mobile, password, roleIds, userGroupIds);

        userRepository.saveAndPublishEvents(user);

        return user.getId();
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteUser(Long userId) {

        User user = userRepository.byIdOrThrowError(userId, "用户不存在");

        userRepository.deleteAndPublishEvents(user);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
    }
}
