package com.ark.center.iam.infra.menu.repository.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuElementDAO extends ServiceImpl<MenuElementMapper, MenuElementDO> {

    public List<MenuElementDO> selectByMenuId(Long menuId) {
        return lambdaQuery().eq(MenuElementDO::getMenuId, menuId).list();
    }

    public void deleteByMenuId(Long menuId) {
        lambdaUpdate()
                .eq(MenuElementDO::getMenuId, menuId)
                .remove();
    }
}
