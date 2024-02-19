package com.ark.center.iam.domain.user;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.support.UserPasswordHelper;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

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

    private void checkUserMobile(String mobile) {
        Assert.isTrue(userRepository.existsByMobile(mobile), () -> ExceptionFactory.userException("手机号码已存在"));
    }

}
