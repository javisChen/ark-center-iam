package com.ark.center.iam.application.auth;

import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.client.auth.command.AuthKickCmd;
import com.ark.center.iam.client.auth.command.AuthLoginCmd;
import com.ark.center.iam.client.auth.dto.AuthLoginDTO;
import com.ark.center.iam.client.permission.response.LoginUserResponse;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.user.support.SecurityConstants;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.infra.security.core.token.cache.IUserTokenCacheService;
import com.ark.center.iam.infra.security.core.token.cache.UserCacheInfo;
import com.ark.component.dto.SingleResponse;
import com.ark.component.exception.ExceptionFactory;
import com.ark.component.security.core.token.extractor.DefaultTokenExtractor;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class AuthAppService {

    private final IUserTokenCacheService iUserTokenCacheService;
    private final DefaultTokenExtractor tokenExtractor;
    private final UserGateway userGateway;
    private final PasswordEncoder passwordEncoder;

    public void kick(AuthKickCmd cmd) {
        Long userId = cmd.getUserId();
        iUserTokenCacheService.remove(userId);
    }

    public void logout(HttpServletRequest request) {
        String accessToken = tokenExtractor.extract(request);
        if (StringUtils.isNotBlank(accessToken)) {
            iUserTokenCacheService.remove(accessToken);
        }
    }

    /**
     * 用户登录
     * 1. 校验用户登录名和密码
     * 2. 生成Token
     * 3. 存储到缓存
     *
     * @param authLoginCmd dto
     * @return SingleResponse<AuthLoginDTO>
     */
    public SingleResponse<AuthLoginDTO> login(AuthLoginCmd authLoginCmd) {
        User user = userGateway.selectByPhone(authLoginCmd.getUsername());
        doCheck(authLoginCmd, user);
        UserCacheInfo userCacheInfo = cacheAuthentication(user);
        return SingleResponse.ok(new AuthLoginDTO(userCacheInfo.getAccessToken()));
    }

    private UserCacheInfo cacheAuthentication(User user) {
        LoginUserResponse loginUserResponse = buildLoginUserContext(user);
        return iUserTokenCacheService.save(loginUserResponse);
    }

    private LoginUserResponse buildLoginUserContext(User User) {
        LoginUserResponse loginUserResponse = new LoginUserResponse();
        loginUserResponse.setUserId(User.getId());
        loginUserResponse.setUserCode(User.getCode());
        loginUserResponse.setUsername(User.getUsername());
        loginUserResponse.setIsSuperAdmin(UserConst.SUPER_ADMIN.equals(User.getCode()));
        return loginUserResponse;
    }


    private void doCheck(AuthLoginCmd authLoginDTO, User user) {
        String saltPwd = DigestUtil.md5Hex(authLoginDTO.getPassword()) + SecurityConstants.PASSWORD_SALT;
        if (Objects.isNull(user) || !this.passwordEncoder.matches(saltPwd, user.getPassword())) {
            throw ExceptionFactory.userException("用户名或密码错误");
        }
    }
}
