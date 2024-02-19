package com.ark.center.iam.domain.user.service;

public interface UserPasswordHelper {

    String enhancePassword(String password);

    boolean checkPassword(String password, String passwordHashed);
    
}
