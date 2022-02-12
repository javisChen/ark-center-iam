package com.kt.cloud.iam.module.auth.service;

import cn.hutool.crypto.digest.DigestUtil;
import com.kt.cloud.iam.common.constants.IamConsts;
import com.kt.cloud.iam.dao.entity.IamUser;
import com.kt.cloud.iam.module.auth.dto.AuthKickDTO;
import com.kt.cloud.iam.module.auth.dto.AuthLoginReqDTO;
import com.kt.cloud.iam.module.auth.dto.AuthLoginRespDTO;
import com.kt.cloud.iam.module.user.common.UserConst;
import com.kt.cloud.iam.module.user.service.IUserService;
import com.kt.cloud.iam.security.configuration.SecurityCoreProperties;
import com.kt.cloud.iam.security.core.token.cache.IUserTokenCacheService;
import com.kt.cloud.iam.security.core.token.cache.UserCacheInfo;
import com.kt.component.context.LoginUserContext;
import com.kt.component.context.token.AccessTokenExtractor;
import com.kt.component.dto.SingleResponse;
import com.kt.component.exception.ExceptionFactory;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Service
public class AuthServiceImpl implements IAuthService {

    @Autowired
    private IUserTokenCacheService iUserTokenCacheService;
    @Autowired
    private AccessTokenExtractor tokenExtractor;
    @Autowired
    private SecurityCoreProperties coreProperties;
    @Autowired
    private IUserService iUserService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void kick(AuthKickDTO dto) {
        Long userId = dto.getUserId();
        iUserTokenCacheService.remove(userId);
    }

    @Override
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
     * @param authLoginDTO dto
     * @return SingleResponse<AuthLoginRespDTO>
     */
    @Override
    public SingleResponse<AuthLoginRespDTO> login(AuthLoginReqDTO authLoginDTO) {
        IamUser user = iUserService.getUserByPhone(authLoginDTO.getUsername());
        doCheck(authLoginDTO, user);
        UserCacheInfo userCacheInfo = cacheAuthentication(user);
        return SingleResponse.ok(new AuthLoginRespDTO(userCacheInfo.getAccessToken()));
    }

    private UserCacheInfo cacheAuthentication(IamUser user) {
        com.kt.component.context.LoginUserContext loginUserContext = buildLoginUserContext(user);
        return iUserTokenCacheService.save(loginUserContext);
    }

    private com.kt.component.context.LoginUserContext buildLoginUserContext(IamUser iamUser) {
        LoginUserContext loginUserContext = new LoginUserContext();
        loginUserContext.setUserId(iamUser.getId());
        loginUserContext.setUserCode(iamUser.getCode());
        loginUserContext.setUsername(iamUser.getName());
        loginUserContext.setIsSuperAdmin(UserConst.SUPER_ADMIN.equals(iamUser.getCode()));
        return loginUserContext;
    }


    private void doCheck(AuthLoginReqDTO authLoginDTO, IamUser user) {
        String saltPwd = DigestUtil.md5Hex(authLoginDTO.getPassword()) + IamConsts.USER_SALT;
        if (Objects.isNull(user) || !this.passwordEncoder.matches(saltPwd, user.getPassword())) {
            throw ExceptionFactory.bizException("用户名或密码错误");
        }
    }
}
