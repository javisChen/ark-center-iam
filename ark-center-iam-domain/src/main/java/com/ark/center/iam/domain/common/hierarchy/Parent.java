package com.ark.center.iam.domain.common.hierarchy;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Parent {

    private Long id;

    private Integer level;

    private String path;

}
