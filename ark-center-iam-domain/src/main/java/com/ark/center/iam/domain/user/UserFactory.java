package com.ark.center.iam.domain.user;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.support.UserPasswordHelper;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

import static net.sf.jsqlparser.util.validation.metadata.NamedObject.user;

@Component
@RequiredArgsConstructor
@Slf4j
public class UserFactory {

    private final UserRepository userRepository;

    private final UserPasswordHelper userPasswordHelper;

    public User create(String username, String mobile, String password, List<Long> roleIds, List<Long> userGroupIds) {
        validityCheck(mobile);

        // 初始化一些用户信息
        String code = generateUserCode();

        // 用户密码=bcrypt(前端md5(md5(password)) + salt)
        password = userPasswordHelper.enhancePassword(DigestUtil.md5Hex(password));

//         持久化后一些操作
//        postPersistUser(user, userCreateCommand);

        return new User(username, mobile, code, password, roleIds, userGroupIds);
    }


    private void validityCheck(String mobile) {

        // 检查用户手机号
        checkUserMobile(mobile);
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

    private void checkUserMobile(String mobile) {
        long count = userRepository.countUserByMobile(mobile);
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
