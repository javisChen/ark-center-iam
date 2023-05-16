package com.ark.center.iam.data.user.dto;


import com.ark.component.validator.ValidateGroup;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Data
public class UserUpdateDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(groups = ValidateGroup.Update.class, message = "id 不能为空")
    private Long id;

    @NotBlank(message = "name 不能为空")
    private String name;

    @NotBlank(message = "phone 不能为空", groups = ValidateGroup.Add.class)
    @Size(min = 11, max = 11, message = "手机号不合法")
    private String phone;

    @NotBlank(message = "password 不能为空")
    private String password;

    @NotNull(message = "status 不能为空")
    @Range(min = 1, max = 2)
    private Integer status;

    public List<Long> roleIds;

    public List<Long> userGroupIds;
}
