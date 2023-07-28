package com.ark.center.iam.client.user.dto;

import lombok.Data;

@Data
public class UserBaseDTO {

    private Long id;
    private String phone;
    private String userName;
    private Integer status;

}
