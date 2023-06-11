package com.ark.center.iam.application.route;

import com.ark.center.iam.application.route.executor.RouteCreateCmdExe;
import com.ark.center.iam.application.route.executor.RouteTreeQryExe;
import com.ark.center.iam.client.route.dto.RouteListTreeVO;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RouteAppService {

    private final RouteGateway routeGateway;

    private final RouteTreeQryExe routeTreeQryExe;
    private final RouteCreateCmdExe routeCreateCmdExe;


    public Page<RouteListTreeVO> queryPage(RouteQry dto) {
        return routeTreeQryExe.execute(dto);
    }

    public List<RouteListTreeVO> queryList(RouteQry dto) {
        dto.setSize(99999);
        return queryPage(dto).getRecords();
    }

    public void saveRoute(RouteCmd cmd) {
        routeCreateCmdExe.execute(cmd);
    }
}
