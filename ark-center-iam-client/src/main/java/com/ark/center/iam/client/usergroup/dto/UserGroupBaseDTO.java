package com.ark.center.iam.client.usergroup.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGroupBaseDTO  {

    private Long id;
    private Long pid;
    private String name;
    private Integer status;
    private Integer level;
    private String levelPath;
    private Integer inheritType;
    private Integer type;

}
