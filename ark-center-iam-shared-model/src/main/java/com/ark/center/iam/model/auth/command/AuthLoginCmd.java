package com.ark.center.iam.model.auth.command;

import lombok.Data;

@Data
public class AuthLoginCmd {

    private String username;
    private String password;

}
