package com.ark.center.iam.data.application.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamApplication;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;

import java.util.List;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IApplicationService extends IService<IamApplication> {

    void updateApplication(ApplicationCmd dto);

    void saveApplication(ApplicationCmd dto);

    List<ApplicationDTO> listVos(ApplicationQry dto);

    String getNameById(Long applicationId);

    IamApplication getApplicationByCode(String code);
}
