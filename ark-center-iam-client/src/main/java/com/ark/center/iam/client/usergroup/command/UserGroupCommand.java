package com.ark.center.iam.client.usergroup.command;


import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.List;

@Data
@Schema(description = "用户组命令")
public class UserGroupCommand {

    @NotNull(message = "id 不能为空", groups = ValidateGroup.Update.class)
    private Long id;

    @NotBlank(message = "name 不能为空", groups = ValidateGroup.Add.class)
    private String name;

    @Schema(description = "上级用户组id")
    private Long parentId;

    @Schema(description = "角色集合")
    public List<Long> roleIds;

    @Schema(description = "继承类型 0-不继承 1-继承上级用户组 2-继承所有用户组")
    private Integer inheritType;

    @Schema(description = "用户组类型 1-公司 2-部门")
    private Integer type;

}
