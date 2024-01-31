package com.ark.center.iam.model.element.dto;

import lombok.Data;

@Data
public class ElementBaseDTO {

    private Long id;
    private Long routeId;
    private String name;
    private Integer type;
}
