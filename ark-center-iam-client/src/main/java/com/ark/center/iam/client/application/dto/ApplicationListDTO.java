package com.ark.center.iam.client.application.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ApplicationListDTO extends ApplicationDTO {

    private Integer apiCount;
    private Integer routeCount;

}
