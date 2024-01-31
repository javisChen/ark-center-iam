package com.ark.center.iam.model.element.dto;


import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ElementDetailsDTO extends ElementBaseDTO {

    private Long permissionId;
    private String permissionCode;

}
