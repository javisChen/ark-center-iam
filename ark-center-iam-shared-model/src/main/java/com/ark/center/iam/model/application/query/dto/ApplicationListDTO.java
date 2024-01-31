package com.ark.center.iam.model.application.query.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ApplicationListDTO extends ApplicationDTO {

    private Integer apiCount;
    private Integer routeCount;

}
