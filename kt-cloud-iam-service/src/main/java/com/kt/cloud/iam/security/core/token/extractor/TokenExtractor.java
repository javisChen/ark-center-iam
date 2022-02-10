package com.kt.cloud.iam.security.core.token.extractor;


import com.kt.cloud.iam.security.config.AccessTokenProperties;

import javax.servlet.http.HttpServletRequest;

/**
 * Token提取，可自行实现提取方法
 * @author jc
 **/
public interface TokenExtractor {

    /**
     * 从request中提取token
     * @param request HttpServletRequest
     * @param properties Token属性
     * @return token
     */
    String extract(HttpServletRequest request, AccessTokenProperties properties);
}
