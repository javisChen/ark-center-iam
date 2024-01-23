package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.query.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQuery;
import com.ark.center.iam.infra.application.assembler.ApplicationConverter;
import com.ark.center.iam.infra.application.gateway.db.ApplicationDO;
import com.ark.center.iam.infra.application.gateway.db.ApplicationMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ApplicationQueryService {

    private final ApplicationMapper applicationMapper;

    private final ApplicationConverter applicationConverter;

    public Collection<ApplicationDTO> queryList(ApplicationQuery dto) {
        LambdaQueryWrapper<ApplicationDO> qw = Wrappers.lambdaQuery(ApplicationDO.class);
        qw.like(StringUtils.isNotBlank(dto.getName()), ApplicationDO::getName, dto.getName());
        qw.eq(ApplicationDO::getIsDeleted, DeletedEnums.NOT.getCode());
        return applicationMapper.selectList(qw)
                .stream()
                .map(applicationConverter::toDTO)
                .collect(Collectors.toList());
    }
}
