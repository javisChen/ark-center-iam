
package com.ark.center.iam.adapter.route.web.controller;

import com.ark.center.iam.application.route.RouteAppService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.client.route.dto.RouteModifyParentDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.data.route.service.IRouteService;
import com.ark.center.iam.client.route.dto.RouteDetailVO;
import com.ark.center.iam.client.route.dto.RouteElementVO;
import com.ark.center.iam.client.route.dto.RouteListTreeVO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.groups.Default;


/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Schema(name = "路由管理", description = "路由/菜单管理")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class RouteController extends BaseController {

    private final IRouteService iRouteService;
    private final RouteAppService routeAppService;
    @PostMapping("/routes")
    public SingleResponse<PageResponse<RouteListTreeVO>> listPage(@RequestBody RouteQry dto) {
        Page<RouteListTreeVO> routeListTreeVOPage = routeAppService.queryPage(dto);
        return SingleResponse.ok(PageResponse.of(routeListTreeVOPage));
    }

    @PostMapping("/routes/all")
    public MultiResponse<RouteListTreeVO> queryList(@RequestBody RouteQry dto) {
        return MultiResponse.ok(routeAppService.queryList(dto));
    }

    @PostMapping("/route")
    public ServerResponse add(@RequestBody @Validated RouteCmd dto) {
        iRouteService.saveRoute(dto);
        routeAppService.saveRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/route")
    public ServerResponse update(@RequestBody @Validated RouteCmd dto) {
        iRouteService.updateRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/route/parent")
    public ServerResponse move(@RequestBody @Validated RouteModifyParentDTO dto) {
        iRouteService.modifyParent(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/route")
    public SingleResponse<RouteDetailVO> get(Long id) {
        RouteDetailVO vo = iRouteService.getRoute(id);
        return SingleResponse.ok(vo);
    }

    @PutMapping("/route/status")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody RouteCmd dto) {
        iRouteService.updateRouteStatus(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/route/{id}")
    public ServerResponse deleteRoute(@PathVariable String id) {
        iRouteService.deleteRouteById(Long.valueOf(id));
        return ServerResponse.ok();
    }

    @GetMapping("/route/{routeId}/elements")
    public MultiResponse<RouteElementVO> getRouteElements(@PathVariable Long routeId) {
        return MultiResponse.ok(iRouteService.listRouteElementsById(routeId));
    }

    @PostMapping("/routes/init")
    public ServerResponse init(@RequestBody UserRouteDTO userMenusDTO) {
//        for (UserRouteVO menu : userMenusDTO.getRoutes()) {
//            RouteUpdateDTO dto = new RouteUpdateDTO();
//            dto.setName(menu.getMeta().getTitle());
//            dto.setPid(Long.valueOf(menu.getParentId()));
//            dto.setCode(menu.getName());
//            dto.setComponent(menu.getComponent());
//            dto.setPath(menu.getPath());
//            dto.setIcon(menu.getMeta().getIcon());
//            iRouteService.saveRoute(dto);
//        }
        return ServerResponse.ok();
    }
}

