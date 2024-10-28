package com.ark.center.iam.infra.menu.db;

import com.ark.center.iam.infra.menu.Menu;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MenuDAO extends ServiceImpl<MenuMapper, Menu> {

    public List<Menu> queryByApplicationId(Long applicationId) {
        if (applicationId == null) {
            return Collections.emptyList();
        }
        return lambdaQuery()
                .eq(Menu::getApplicationId, applicationId)
                .list();
    }
}
