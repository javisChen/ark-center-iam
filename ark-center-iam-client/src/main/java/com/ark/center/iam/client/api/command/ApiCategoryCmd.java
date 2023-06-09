package com.ark.center.iam.client.api.command;

import com.ark.component.validator.ValidateGroup;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class ApiCategoryCmd implements Serializable {

    @NotNull(message = "id不能为空", groups = {ValidateGroup.Update.class})
    private Long id;

    @NotNull(message = "applicationId不能为空", groups = {ValidateGroup.Add.class})
    private Long applicationId;

    @NotBlank(message = "name不能为空", groups = {ValidateGroup.Add.class})
    private String name;

}