package com.ark.center.iam.infra.api.gateway.db;


import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.center.iam.domain.api.Api;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * api表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface ApiMapper extends BaseMapper<Api> {

    List<ApiDetailsDTO> selectApiList(@Param("qry") ApiQuery apiQuery);
}
