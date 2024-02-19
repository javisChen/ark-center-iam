package com.ark.center.iam.application.user.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.domain.user.UserFactory;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.support.UserPasswordHelper;
import com.ark.center.iam.infra.user.converter.UserDomainConverter;
import com.ark.center.iam.domain.user.User;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class UserCreateCmdExe {

    private final UserDomainConverter beanConverter;

    private final UserRepository userRepository;

    private final RoleAssignService roleAssignService;
    // private final UserGroupAssignService userGroupAssignService;

    private final UserPasswordHelper userPasswordHelper;
    private final UserFactory userFactory;


    public Long execute(UserCreateCommand command) {
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

    private void validityCheck(User user) {

        // 检查用户手机号
        checkUserMobile(user);
    }

    private void initUser(User user) {
        // 生成用户编码
        user.setCode(generateUserCode());

        // 用户密码=bcrypt(前端md5(md5(password)) + salt)
        user.setPassword(userPasswordHelper.enhancePassword(DigestUtil.md5Hex(user.getPassword())));

    }

    private String generateUserCode() {
        // 生成后先查询一遍，防止生成了重复的code，其实几率微乎其微
        String code = IdUtil.fastUUID();
        if (codeExists(code)) {
            return generateUserCode();
        }
        return code;
    }

    private boolean codeExists(String code) {
        return userRepository.countUserByCode(code) > 0;
    }

    /**
     * 持久化用户后的操作
     *
     * @param user   用户
     * @param createCmd 创建用户请求
     */
    private void postPersistUser(User user, UserCreateCommand createCmd) {

        Long userId = user.getId();

        // 分配角色
        assignRoles(userId, createCmd.getRoleIds());

        // 分配用户组
        assignUserGroups(userId, createCmd.getUserGroupIds());
    }

    private void checkUserMobile(User user) {
        long count = userRepository.existsByMobile(user.getMobile());
        Assert.isTrue(count == 0, () -> ExceptionFactory.userException("手机号码已存在"));
    }

    private void assignUserGroups(Long userId, List<Long> userGroupIds) {
        if (CollectionUtil.isNotEmpty(userGroupIds)) {
            userGroupAssignService.assignUserGroupsToUser(userId, userGroupIds);
        }
    }

    private void assignRoles(Long userId, List<Long> roleIds) {
        if (CollectionUtil.isNotEmpty(roleIds)) {
            roleAssignService.assignUserRoles(userId, roleIds);
        }
    }

}
