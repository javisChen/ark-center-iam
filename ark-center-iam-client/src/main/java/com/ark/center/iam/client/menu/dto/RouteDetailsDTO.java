package com.ark.center.iam.client.menu.dto;

import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RouteDetailsDTO extends MenuDTO {

    private Long applicationId;
    private String applicationName;
    private Long permissionId;
    private String permissionCode;
    private String parentRouteName;
    private List<ElementBaseDTO> elements;
    private List<RouteDetailsDTO> children = new ArrayList<>();
}
