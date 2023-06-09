package com.ark.center.iam.data.api.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamApiCategory;
import com.ark.center.iam.client.api.command.ApiCategoryCmd;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;

import java.util.List;

/**
 * <p>
 * api表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IApiCategoryService extends IService<IamApiCategory> {


    List<ApiCategoryBaseDTO> listVos(Long applicationId);

    void saveApiCategory(ApiCategoryCmd dto);

    void updateApiCategory(ApiCategoryCmd dto);

    void removeApiCategory(Long id);
}
