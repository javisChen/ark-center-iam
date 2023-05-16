package com.ark.center.iam.data.route.dto;

import com.ark.component.validator.ValidateGroup;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Data
public class PageElementUpdateDTO {

    @NotNull(message = "routeId 不能为空", groups = ValidateGroup.Update.class)
    private Long id;

    @NotNull(message = "routeId 不能为空", groups = {ValidateGroup.Add.class})
    private Long routeId;

    @NotBlank(message = "name 不能为空", groups = {ValidateGroup.Add.class})
    private String name;

    @NotNull(message = "type 不能为空", groups = {ValidateGroup.Add.class})
    private Integer type;
}
