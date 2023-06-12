package com.ark.center.iam.application.api.support;

public class ApiCommonUtils {

    public static String createKey(String url, String method) {
        return url + ":" + method;
    }
}
