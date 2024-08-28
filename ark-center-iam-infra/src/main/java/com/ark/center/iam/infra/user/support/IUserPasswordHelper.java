package com.ark.center.iam.infra.user.support;

public interface IUserPasswordHelper {

    String enhancePassword(String password);

    boolean checkPassword(String password, String passwordHashed);
}
