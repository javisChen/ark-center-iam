package com.ark.center.iam.client.usergroup.dto;

import com.ark.component.tree.dto.HierarchyDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGroupBaseDTO extends HierarchyDTO<Long> {

    private String name;
    private Integer status;
    private Integer inheritType;
    private Integer type;

}
