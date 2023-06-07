package com.ark.center.iam.domain.user.support;

public interface IUserPasswordHelper {

    String enhancePassword(String password);

    boolean checkPassword(String password, String passwordHashed);
}
