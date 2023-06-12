package com.ark.center.iam.client.element.dto;


import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ElementDetailsDTO extends ElementBaseDTO {

    private Long permissionId;
    private String permissionCode;

}
