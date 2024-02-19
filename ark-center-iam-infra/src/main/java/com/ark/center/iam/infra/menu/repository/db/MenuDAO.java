package com.ark.center.iam.infra.menu.repository.db;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.infra.menu.converter.MenuAppConverter;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuDAO extends ServiceImpl<MenuMapper, MenuDO> {

    private final MenuAppConverter appConverter;

    public List<MenuDO> selectChildMenus(Long id) {
        return lambdaQuery()
                .likeRight(MenuDO::getLevelPath, id)
                .list();
    }

    public List<UserRouteDTO> selectByIds(List<Long> routeIds) {
        if (CollectionUtil.isEmpty(routeIds)) {
            return Collections.emptyList();
        }
        List<MenuDO> menus = lambdaQuery()
                .in(MenuDO::getId, routeIds)
                .orderByAsc(Lists.newArrayList(MenuDO::getLevel, MenuDO::getSequence))
                .list();
        return appConverter.convert(menus);
    }
}
