package com.ark.center.iam.client.user.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserPageDTO extends UserBaseDTO {

    @Schema(description = "角色集合")
    private List<String> roles;

    @Schema(description = "用户组集合")
    private List<String> userGroups;

}
