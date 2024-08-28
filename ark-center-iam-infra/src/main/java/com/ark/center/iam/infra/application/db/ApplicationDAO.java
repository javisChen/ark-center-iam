package com.ark.center.iam.infra.application.db;

import com.ark.center.iam.infra.application.Application;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ApplicationDAO extends ServiceImpl<ApplicationMapper, Application> {

}
