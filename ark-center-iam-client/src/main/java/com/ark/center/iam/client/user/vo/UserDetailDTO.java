package com.ark.center.iam.client.user.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserDetailDTO extends UserBaseDTO {

    private List<Long> roleIds;
    private List<Long> userGroupIds;

}
