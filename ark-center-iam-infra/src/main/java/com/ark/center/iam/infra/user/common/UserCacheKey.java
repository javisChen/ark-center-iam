package com.ark.center.iam.infra.user.common;

public interface UserCacheKey {


    /**
     * 用户路由缓存
     */
    String CACHE_KEY_USER_ROUTES = "user:%s:menus";

    /**
     * 用户页面元素缓存
     */
    String CACHE_KEY_USER_ELEMS = "user:%s:elements";

}
