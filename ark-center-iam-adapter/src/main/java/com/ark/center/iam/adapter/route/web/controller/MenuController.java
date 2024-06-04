
package com.ark.center.iam.adapter.route.web.controller;

import com.ark.center.iam.application.route.RouteAppService;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.command.RouteModifyParentCmd;
import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Tag(name = "路由管理", description = "路由管理")
@RestController
@RequestMapping("/v1/menus")
@RequiredArgsConstructor
public class MenuController extends BaseController {

    private final RouteAppService routeAppService;

    @GetMapping("")
    @Operation(summary = "路由树形分页查询")
    public SingleResponse<PageResponse<RouteDetailsDTO>> queryRoutes(RouteQuery query) {
        Page<RouteDetailsDTO> routeListTreeVOPage = routeAppService.queryRoutes(query);
        return SingleResponse.ok(PageResponse.of(routeListTreeVOPage));
    }

    @PostMapping("/all")
    @Operation(summary = "路由全量查询")
    public MultiResponse<RouteDetailsDTO> queryList(@RequestBody RouteQuery dto) {
        return MultiResponse.ok(routeAppService.queryList(dto));
    }

    @PostMapping("/create")
    @Operation(summary = "创建路由")
    public ServerResponse add(@RequestBody @Validated RouteCmd dto) {
        routeAppService.saveRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/update")
    @Operation(summary = "更新路由")
    public ServerResponse update(@RequestBody @Validated RouteCmd dto) {
        routeAppService.updateRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/parent")
    @Operation(summary = "移动路由层级")
    public ServerResponse move(@RequestBody @Validated RouteModifyParentCmd dto) {
        routeAppService.modifyParent(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/details")
    @Operation(
            summary = "查询路由详情",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public SingleResponse<RouteDetailsDTO> queryDetails(Long id) {
        RouteDetailsDTO dto = routeAppService.queryDetails(id);
        return SingleResponse.ok(dto);
    }

    @PutMapping("/status")
    @Operation(summary = "更新路由状态")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody RouteCmd dto) {
        routeAppService.updateRouteStatus(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/delete")
    @Operation(
            summary = "删除路由",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public ServerResponse deleteRoute(Long id) {
        routeAppService.deleteRouteById(id);
        return ServerResponse.ok();
    }

    @GetMapping("/elements")
    @Operation(
            summary = "获取路由的页面元素",
            description = "根据路由id查询页面元素",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public MultiResponse<ElementBaseDTO> queryRouteElements(Long id) {
        return MultiResponse.ok(routeAppService.queryRouteElementsById(id));
    }

}

