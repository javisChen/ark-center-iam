package com.ark.center.iam.domain.common.hierarchy;

import cn.hutool.core.util.StrUtil;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class Hierarchy {

    private final Integer level;
    private final String path;
    private Parent parent;

    public Hierarchy(Long id, Parent parent) {
        this.parent = parent;
        this.level = (parent != null && parent.getId().equals(0L)) ? parent.getLevel() + 1 : 1;
        if (level == 1) {
            this.path = id + StrUtil.DOT;
        } else {
            this.path = parent.getPath() + id + StrUtil.DOT;
        }
    }

    public Hierarchy(Long id) {
        this.level = 1;
        this.path = id + StrUtil.DOT;
    }

}
