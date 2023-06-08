package com.ark.center.iam.data.application.converter;

import com.ark.center.iam.dao.entity.IamApplication;
import com.ark.center.iam.data.api.service.IApiService;
import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.dto.ApplicationListDTO;
import com.ark.center.iam.data.route.service.IRouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class ApplicationBeanConverter {

    @Autowired
    private IApiService iApiService;

    @Autowired
    private IRouteService iRouteService;

    public ApplicationDTO convertForApplicationListVO(IamApplication application) {
        ApplicationListDTO vo = new ApplicationListDTO();
        Long applicationId = application.getId();
        vo.setId(applicationId);
        vo.setName(application.getName());
        vo.setCode(application.getCode());
        vo.setStatus(application.getStatus());
        vo.setType(application.getType());
        vo.setApiCount((int) iApiService.countByApplicationId(applicationId));
        vo.setRouteCount((int) iRouteService.countByApplicationId(applicationId));
        return vo;
    }

    public IamApplication convertForInsert(ApplicationCmd dto) {
        return convertForEntity(dto);
    }

    public IamApplication convertForUpdate(ApplicationCmd dto) {
        return convertForEntity(dto);
    }

    private IamApplication convertForEntity(ApplicationCmd dto) {
        IamApplication application = new IamApplication();
        application.setId(dto.getId());
        application.setName(dto.getName());
        application.setCode(dto.getCode());
        application.setStatus(dto.getStatus());
        application.setType(dto.getType());
        return application;
    }
}
