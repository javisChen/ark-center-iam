package com.ark.center.iam.client.menu.dto;

import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.component.tree.dto.TreeDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class MenuDTO extends TreeDTO<Long> {

    private Long id;
//    private Long pid;
    private Long applicationId;
    private Integer sequence;
    private String code;
    private String name;
    private String icon;
    private String component;
//    private String component2;
    private Integer status;
    private String path;
    //    private String path2;
    private Integer type;
    private Boolean hideChildren;
    private List<ElementBaseDTO> elements;


}
