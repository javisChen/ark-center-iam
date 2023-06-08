package com.ark.center.iam.domain.resource.gateway;

import com.ark.center.iam.client.user.dto.UserRouteDTO;

import java.util.List;

public interface ResourceRouteGateway {

    List<UserRouteDTO> selectByRouteIds(List<Long> routeIds);

}
