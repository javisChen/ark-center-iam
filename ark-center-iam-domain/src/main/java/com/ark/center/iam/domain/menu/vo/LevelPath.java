package com.ark.center.iam.domain.menu.vo;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.domain.menu.Menu;
import lombok.Getter;

@Getter
public class LevelPath {

    private final String path;

    public LevelPath(Menu menu, Menu parentMenu) {
        Long menuId = menu.getId();
        this.path = menu.isRoot()
                ? menuId + StrUtil.DOT
                : parentMenu.getLevelPath().getPath() + menuId + StrUtil.DOT;
    }
}
