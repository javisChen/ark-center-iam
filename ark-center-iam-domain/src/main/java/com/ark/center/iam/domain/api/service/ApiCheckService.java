package com.ark.center.iam.domain.api.service;

import com.ark.center.iam.domain.api.Api;
import com.ark.component.orm.mybatis.service.CheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * API校验服务
 */
@Service
@RequiredArgsConstructor
public class ApiCheckService extends CheckService<Api> {


}
