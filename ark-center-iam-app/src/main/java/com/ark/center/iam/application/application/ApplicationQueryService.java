package com.ark.center.iam.application.application;

import com.ark.center.iam.model.application.query.dto.AppDTO;
import com.ark.center.iam.model.application.query.ApplicationQuery;
import com.ark.center.iam.infra.app.converter.AppAppConverter;
import com.ark.center.iam.infra.app.repository.db.AppDO;
import com.ark.center.iam.infra.app.repository.db.AppMapper;
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

    private final AppMapper appMapper;

    private final AppAppConverter appAppConverter;

    public Collection<AppDTO> queryAll(ApplicationQuery dto) {
        LambdaQueryWrapper<AppDO> qw =
                Wrappers.lambdaQuery(AppDO.class)
                        .like(StringUtils.isNotBlank(dto.getName()), AppDO::getName, dto.getName())
                        .eq(AppDO::getIsDeleted, DeletedEnums.NOT.getCode());
        return appMapper.selectList(qw)
                .stream()
                .map(appAppConverter::convert)
                .collect(Collectors.toList());
    }
}
