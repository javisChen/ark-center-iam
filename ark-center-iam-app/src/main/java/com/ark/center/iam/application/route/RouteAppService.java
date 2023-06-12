package com.ark.center.iam.application.route;

import com.ark.center.iam.application.route.executor.*;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.command.RouteModifyParentCmd;
import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.route.service.RouteCheckService;
import com.ark.center.iam.domain.route.service.RouteService;
import com.ark.center.iam.infra.resource.assembler.ElementAssembler;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RouteAppService {

    private final RouteTreeQryExe routeTreeQryExe;
    private final RouteDetailsQryExe routeDetailsQryExe;
    private final RouteCreateCmdExe routeCreateCmdExe;
    private final RouteUpdateCmdExe routeUpdateCmdExe;
    private final RouteDeleteCmdExe routeDeleteCmdExe;
    private final RouteCheckService routeCheckService;
    private final RouteGateway routeGateway;
    private final RouteService routeService;
    private final RouteAssembler routeAssembler;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;


    public Page<RouteDetailsDTO> queryPage(RouteQry dto) {
        return routeTreeQryExe.execute(dto);
    }

    public List<RouteDetailsDTO> queryList(RouteQry dto) {
        dto.setSize(99999);
        return queryPage(dto).getRecords();
    }

    @Transactional(rollbackFor = Throwable.class)
    public void saveRoute(RouteCmd cmd) {
        routeCreateCmdExe.execute(cmd);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRoute(RouteCmd dto) {
        routeUpdateCmdExe.execute(dto);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void modifyParent(RouteModifyParentCmd cmd) {

        routeCheckService.ensureRouteNotExists(cmd.getId());

        routeCheckService.ensureRouteNotExists(cmd.getPid(), "父级路由不存在");

        Route route = routeAssembler.toRouteDO(cmd);

        routeGateway.updateByRouteId(route);

    }

    public RouteDetailsDTO queryDetails(Long id) {
        return routeDetailsQryExe.execute(id);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRouteStatus(RouteCmd dto) {
        routeService.updateRouteStatus(dto.getId(), dto.getStatus());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteRouteById(Long id) {
        routeDeleteCmdExe.execute(id);
    }

    public List<ElementBaseDTO> queryRouteElementsById(Long routeId) {
        List<Element> elements = elementGateway.selectElementsByRouteId(routeId);
        return elements.stream().map(elementAssembler::toElementDTO).collect(Collectors.toList());
    }
}
