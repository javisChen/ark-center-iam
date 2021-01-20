package com.kt.upms.security.configuration;

import com.alibaba.fastjson.JSONObject;
import com.kt.component.dto.ResponseEnums;
import com.kt.component.dto.ServerResponse;
import com.kt.upms.security.login.UserLoginAuthenticationFilter;
import com.kt.upms.security.token.UserTokenAuthenticationProcessingFilter;
import com.kt.upms.security.token.extractor.DefaultTokenExtractor;
import com.kt.upms.security.token.manager.LocalCacheTokenManager;
import com.kt.upms.security.token.manager.UserTokenManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.filter.OrderedCharacterEncodingFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.web.filter.CharacterEncodingFilter;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * 安全控制配置
 */
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true) // 启用@PreAuthorize注解
@Slf4j
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private SecurityCoreProperties securityCoreProperties;

    @Autowired
    @Qualifier(value = "userLoginAuthenticationProvider")
    private AuthenticationProvider userLoginAuthenticationProvider;

    @Autowired
    @Qualifier(value = "userTokenAuthenticationProvider")
    private AuthenticationProvider userTokenAuthenticationProvider;

    /**
     * 配置客户端认证的参数
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth
//                .inMemoryAuthentication()
//                .withUser("admin").roles("admin").password("123")
//                .and()
//                .withUser("javis").roles("user").password("123");
    }

    /**
     * 配置请求认证的参数
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                // 是否启用session
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                // 放行资源
                .antMatchers("/**").permitAll()
                // 配置强制禁用的资源，是登录后之后投票器处理才会触发到这个
                .antMatchers("/deny").denyAll()
                .and()
                .authorizeRequests()
                // 配置接口与对应角色权限关系，可用注解配置@PreAuthorize配置
                // 注意，如果接口使用了@PreAuthorize进行了权限配置，当权限不匹配的时候，会先ControllerExceptionAdvice捕获
                // 如果antMatchers和@PreAuthorize都进行了权限配置，则都需要匹配才能访问
//                .antMatchers("/demo/admin/**").hasAnyAuthority("user")
//                .antMatchers("/demo/user/**").hasAnyRole("user")
                // 剩余资源都需要进行认证
                .anyRequest().access("@permissionChecker.check(request, authentication)")
//                .anyRequest().authenticated()
                .and()
                // 登出相关
                .logout()
                // 登出成功处理器
                .logoutSuccessHandler(logoutSuccessHandler())
                .and()
                // 异常状态处理
                .exceptionHandling()
                // 设置未登录返回
                .authenticationEntryPoint(authenticationEntryPoint())
                // 设置权限不足处理器
                .accessDeniedHandler(accessDeniedHandler())
                .and()
                // 关闭csrf
                .csrf().disable();

        setupAuthFilter(http);

        setupProvider(http);
    }

    private void setupAuthFilter(HttpSecurity http) throws Exception {
        http
//                .addFilterBefore(userTokenAuthenticationProcessingFilter(), UsernamePasswordAuthenticationFilter.class)
                .addFilterAfter(userLoginAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
    }

    protected UserTokenAuthenticationProcessingFilter userTokenAuthenticationProcessingFilter()
            throws Exception {
        List<String> pathsToSkip = new ArrayList<>(securityCoreProperties.getAllowList());
        UserTokenAuthenticationProcessingFilter filter = new UserTokenAuthenticationProcessingFilter(
                "/**", new DefaultTokenExtractor(), securityCoreProperties.getAuthentication());
        filter.setAuthenticationManager(authenticationManagerBean());
        return filter;
    }

    public UserLoginAuthenticationFilter userLoginAuthenticationFilter() throws Exception {
        return new UserLoginAuthenticationFilter(authenticationManagerBean());
    }

    private LogoutSuccessHandler logoutSuccessHandler() {
        return (httpServletRequest, resp, authentication) -> {
            resp.setContentType(MediaType.APPLICATION_JSON_VALUE);
            JSONObject.writeJSONString(resp.getOutputStream(), ServerResponse.error(ResponseEnums.USER_NOT_LOGIN));
        };
    }

    private AuthenticationEntryPoint authenticationEntryPoint() {
        return (httpServletRequest, resp, e) -> {
            resp.setStatus(HttpStatus.UNAUTHORIZED.value());
            resp.setContentType(MediaType.APPLICATION_JSON_VALUE);
            JSONObject.writeJSONString(resp.getOutputStream(), ServerResponse.error(ResponseEnums.USER_NOT_LOGIN));
        };
    }

    private AccessDeniedHandler accessDeniedHandler() {
        return (httpServletRequest, resp, e) -> {
            log.error("Authorization failed: access is denied", e);
            resp.setStatus(HttpStatus.FORBIDDEN.value());
            resp.setContentType(MediaType.APPLICATION_JSON_VALUE);
            JSONObject.writeJSONString(resp.getOutputStream(), ServerResponse.error(ResponseEnums.USER_ACCESS_DENIED));
        };
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/swagger-ui/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserTokenManager userTokenManager() {
        return new LocalCacheTokenManager();
    }


    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * 配置权限继承关系
     */
    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl hierarchy = new RoleHierarchyImpl();
        hierarchy.setHierarchy("ROLE_admin > ROLE_user");
        return hierarchy;
    }

    private void setupProvider(HttpSecurity http) {
        http.authenticationProvider(userLoginAuthenticationProvider)
                .authenticationProvider(userTokenAuthenticationProvider);
    }

    @Bean
    public CharacterEncodingFilter characterEncodingFilter() {
        CharacterEncodingFilter filter = new OrderedCharacterEncodingFilter();
        filter.setEncoding(StandardCharsets.UTF_8.displayName());
        filter.setForceRequestEncoding(false);
        filter.setForceResponseEncoding(true);
        return filter;
    }
}