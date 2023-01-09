package com.ark.center.iam.data.auth.service;

import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.api.user.permission.response.LoginUserResponse;
import com.ark.center.iam.common.constants.SecurityConstants;
import com.ark.center.iam.dao.entity.IamUser;
import com.ark.center.iam.data.auth.dto.AuthKickDTO;
import com.ark.center.iam.data.auth.dto.AuthLoginReqDTO;
import com.ark.center.iam.data.auth.dto.AuthLoginRespDTO;
import com.ark.center.iam.data.user.common.UserConst;
import com.ark.center.iam.data.user.service.IUserService;
import com.ark.center.iam.security.core.token.cache.IUserTokenCacheService;
import com.ark.center.iam.security.core.token.cache.UserCacheInfo;
import com.ark.component.context.core.token.AccessTokenExtractor;
import com.ark.component.dto.SingleResponse;
import com.ark.component.exception.ExceptionFactory;
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
        LoginUserResponse loginUserResponse = buildLoginUserContext(user);
        return iUserTokenCacheService.save(loginUserResponse);
    }

    private LoginUserResponse buildLoginUserContext(IamUser iamUser) {
        LoginUserResponse loginUserResponse = new LoginUserResponse();
        loginUserResponse.setUserId(iamUser.getId());
        loginUserResponse.setUserCode(iamUser.getCode());
        loginUserResponse.setUsername(iamUser.getName());
        loginUserResponse.setIsSuperAdmin(UserConst.SUPER_ADMIN.equals(iamUser.getCode()));
        return loginUserResponse;
    }


    private void doCheck(AuthLoginReqDTO authLoginDTO, IamUser user) {
        String saltPwd = DigestUtil.md5Hex(authLoginDTO.getPassword()) + SecurityConstants.USER_SALT;
        if (Objects.isNull(user) || !this.passwordEncoder.matches(saltPwd, user.getPassword())) {
            throw ExceptionFactory.userException("用户名或密码错误");
        }
    }
}
