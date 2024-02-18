package com.ark.center.iam.model.usergroup.command;


import com.ark.component.ddd.app.Command;
import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "用户组创建命令")
public class UserGroupCreateCommand implements Command {

    @NotBlank(message = "name 不能为空", groups = ValidateGroup.Add.class)
    @Schema(description = "用户组名称")
    private String name;

    @Schema(description = "上级用户组")
    private Long pid;

    @Schema(description = "用户组角色")
    public List<Long> roleIds;

    @Schema(description = "继承类型", allowableValues = {"1-不继承", "2-继承上级", "3-继承上级所有"})
    private Integer inheritType;

    @Schema(description = "用户组类型", allowableValues = {"1-公司", "2-部门"})
    private Integer type;

}
