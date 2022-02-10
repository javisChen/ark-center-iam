//
//package com.kt.cloud.iam.security.core.context;
//
//
//import com.kt.cloud.iam.api.user.permission.response.LoginUserContext;
//
//public class LoginUserContextHolder {
//
//    private static final ThreadLocal<LoginUserContext> THREAD_LOCAL = new ThreadLocal<>();
//
//    public static void clearContext() {
//        THREAD_LOCAL.remove();
//    }
//
//    public static LoginUserContext getContext() {
//        LoginUserContext ctx = THREAD_LOCAL.get();
//        if (ctx == null) {
//            ctx = createEmptyContext();
//            THREAD_LOCAL.set(ctx);
//        }
//        return ctx;
//    }
//
//    public static void setContext(LoginUserContext context) {
//        THREAD_LOCAL.set(context);
//    }
//
//    public static LoginUserContext createEmptyContext() {
//        return new LoginUserContext();
//    }
//}
