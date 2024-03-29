package com.ark.center.iam.client.usergroup.command;


import com.ark.component.validator.ValidateGroup;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.List;

@Data
public class UserGroupCmd {

    

    @NotNull(message = "id 不能为空", groups = ValidateGroup.Update.class)
    private Long id;

    @NotBlank(message = "name 不能为空", groups = ValidateGroup.Add.class)
    private String name;

    private Long pid;

    public List<Long> roleIds;

    private Integer inheritType;
    private Integer type;


}
