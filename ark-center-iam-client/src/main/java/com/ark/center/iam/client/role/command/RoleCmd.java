package com.ark.center.iam.client.role.command;


import com.ark.component.validator.ValidateGroup;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class RoleCmd implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "id 不能为空", groups = {ValidateGroup.Update.class})
    private Long id;

    @NotBlank(message = "name 不能为空", groups = {ValidateGroup.Add.class})
    private String name;

    private String code;

    @NotNull(groups = ValidateGroup.Update.class, message = "status 不能为空")
    @Range(min = 0, max = 1)
    private Integer status;

}
