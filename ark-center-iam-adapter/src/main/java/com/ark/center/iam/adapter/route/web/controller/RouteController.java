
package com.ark.center.iam.adapter.route.web.controller;

import com.ark.center.iam.application.route.RouteAppService;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.command.RouteModifyParentCmd;
import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


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

    private final RouteAppService routeAppService;
    @PostMapping("/routes")
    public SingleResponse<PageResponse<RouteDetailsDTO>> listPage(@RequestBody RouteQry dto) {
        Page<RouteDetailsDTO> routeListTreeVOPage = routeAppService.queryPage(dto);
        return SingleResponse.ok(PageResponse.of(routeListTreeVOPage));
    }

    @PostMapping("/routes/all")
    public MultiResponse<RouteDetailsDTO> queryList(@RequestBody RouteQry dto) {
        return MultiResponse.ok(routeAppService.queryList(dto));
    }

    @PostMapping("/route")
    public ServerResponse add(@RequestBody @Validated RouteCmd dto) {
        routeAppService.saveRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/route")
    public ServerResponse update(@RequestBody @Validated RouteCmd dto) {
        routeAppService.updateRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/route/parent")
    public ServerResponse move(@RequestBody @Validated RouteModifyParentCmd dto) {
        routeAppService.modifyParent(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/route")
    public SingleResponse<RouteDetailsDTO> queryDetails(Long id) {
        RouteDetailsDTO dto = routeAppService.queryDetails(id);
        return SingleResponse.ok(dto);
    }

    @PutMapping("/route/status")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody RouteCmd dto) {
        routeAppService.updateRouteStatus(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/route/{id}")
    public ServerResponse deleteRoute(@PathVariable Long id) {
        routeAppService.deleteRouteById(id);
        return ServerResponse.ok();
    }

    @GetMapping("/route/{routeId}/elements")
    public MultiResponse<ElementBaseDTO> queryRouteElements(@PathVariable Long routeId) {
        return MultiResponse.ok(routeAppService.queryRouteElementsById(routeId));
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

