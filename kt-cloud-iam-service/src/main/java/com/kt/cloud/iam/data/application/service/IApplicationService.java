package com.kt.cloud.iam.data.application.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kt.cloud.iam.dao.entity.IamApplication;
import com.kt.cloud.iam.data.application.dto.ApplicationQueryDTO;
import com.kt.cloud.iam.data.application.dto.ApplicationUpdateDTO;
import com.kt.cloud.iam.data.application.vo.ApplicationBaseVO;

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

    void updateApplication(ApplicationUpdateDTO dto);

    void saveApplication(ApplicationUpdateDTO dto);

    List<ApplicationBaseVO> listVos(ApplicationQueryDTO dto);

    String getNameById(Long applicationId);

    IamApplication getApplicationByCode(String code);
}
