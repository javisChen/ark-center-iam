package com.kt.cloud.iam.data.api.support;

public class ApiCommonUtils {

    public static String createKey(String url, String method) {
        return url + ":" + method;
    }
}
