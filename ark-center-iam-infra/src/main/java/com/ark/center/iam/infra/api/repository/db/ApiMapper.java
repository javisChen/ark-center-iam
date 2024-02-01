package com.ark.center.iam.infra.api.repository.db;


import com.ark.center.iam.model.api.dto.ApiDetailsDTO;
import com.ark.center.iam.model.api.query.ApiQuery;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApiMapper extends BaseMapper<ApiDO> {

    List<ApiDetailsDTO> selectApiList(@Param("qry") ApiQuery apiQuery);
}
