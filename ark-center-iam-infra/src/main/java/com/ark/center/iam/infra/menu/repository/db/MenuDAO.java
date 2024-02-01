package com.ark.center.iam.infra.menu.repository.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuDAO extends ServiceImpl<MenuMapper, MenuDO> {

    public List<MenuDO> selectChildMenus(Long id) {
        return lambdaQuery()
                .likeRight(MenuDO::getLevelPath, id)
                .list();
    }
}
