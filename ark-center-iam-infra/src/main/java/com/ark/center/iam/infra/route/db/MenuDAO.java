package com.ark.center.iam.infra.route.db;

import com.ark.center.iam.domain.menu.Menu;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MenuDAO extends ServiceImpl<MenuMapper, Menu> {

}
