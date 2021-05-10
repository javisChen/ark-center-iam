package com.kt.cloud.iam.module.user.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserDetailVO extends UserBaseVO {

    private List<Long> roleIds;
    private List<Long> userGroupIds;
    ;
}
