package com.ark.center.iam.data.auth.dto;

import lombok.Data;

@Data
public class AuthLoginReqDTO {

    private String userName;
    private String password;

}
