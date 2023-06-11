package com.ark.center.iam.infra.common;

import com.ark.component.orm.mybatis.base.BaseGateway;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class EnhanceServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> implements BaseGateway<T> {


}
