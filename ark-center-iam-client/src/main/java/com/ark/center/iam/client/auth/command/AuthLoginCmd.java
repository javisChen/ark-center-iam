package com.ark.center.iam.client.auth.command;

import lombok.Data;

@Data
public class AuthLoginCmd {

    private String username;
    private String password;

}
