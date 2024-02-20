package com.ark.center.iam.domain.common.hierarchy;

import lombok.Getter;

@Getter
public class Parent {

    private Long id;

    private Integer level;

    private String path;

    private Parent(Long id, Integer level, String path) {
        this.id = id;
        this.level = level;
        this.path = path;
    }

    public static Parent of(Long id, Integer level, String path) {
        return new Parent(id, level, path);
    }
}
