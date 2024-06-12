package com.ark.center.iam.infra.application.db;

import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.infra.route.db.MenuMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ApplicationDAO extends ServiceImpl<ApplicationMapper, Application> {

}
