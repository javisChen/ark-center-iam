package com.ark.center.iam.model.user.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserDetailsDTO extends UserBaseDTO {

    private List<Long> roleIds;

    private List<Long> userGroupIds;

}
