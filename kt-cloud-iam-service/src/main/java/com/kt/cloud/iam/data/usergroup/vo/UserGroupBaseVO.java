package com.kt.cloud.iam.data.usergroup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGroupBaseVO implements Serializable {

    private Long id;
    private Long pid;
    private String name;
    private Integer status;
    private Integer level;
    private String levelPath;
    private Integer inheritType;
    private Integer type;

}
