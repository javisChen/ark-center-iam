package com.ark.center.iam.data.api.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamApiCategory;
import com.ark.center.iam.data.api.dto.ApiCategoryUpdateDTO;
import com.ark.center.iam.data.api.vo.ApiCategoryBaseVO;

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


    List<ApiCategoryBaseVO> listVos(Long applicationId);

    void saveApiCategory(ApiCategoryUpdateDTO dto);

    void updateApiCategory(ApiCategoryUpdateDTO dto);

    void removeApiCategory(Long id);
}
