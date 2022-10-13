package com.ark.center.iam.data.api.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamApi;
import com.ark.center.iam.data.api.dto.ApiQueryDTO;
import com.ark.center.iam.data.api.dto.ApiUpdateDTO;
import com.ark.center.iam.data.api.vo.ApiDetailVO;
import com.ark.center.iam.data.api.vo.ApiListVO;

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

    void saveApplication(ApiUpdateDTO dto);

    void updateApi(ApiUpdateDTO dto);

    List<ApiListVO> listVos(ApiQueryDTO dto);

    void removeApi(Long dto);

    List<IamApi> listAll();

    void removeByCategoryId(Long id);

    ApiDetailVO getApplicationVO(Long id);
}
