package com.ark.center.iam.client.auth.command;

import lombok.Data;

@Data
public class AuthLoginCmd {

    private String userName;
    private String password;

}
