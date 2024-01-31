package com.ark.center.iam.model.user.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserInnerDTO extends UserBaseDTO {

    private String password;

}
