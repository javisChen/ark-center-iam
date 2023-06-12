package com.ark.center.iam.data.api.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamApi;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;

import java.util.List;

/**
 * <p>
 * api表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IApiService extends IService<IamApi> {

    long countByApplicationId(Long applicationId);

    void saveApplication(ApiUpdateCmd dto);

    void updateApi(ApiUpdateCmd dto);

    List<ApiDetailsDTO> listVos(ApiQry dto);

    void removeApi(Long dto);

    List<IamApi> listAll();

    void removeByCategoryId(Long id);

    ApiDetailDTO getApplicationVO(Long id);
}
