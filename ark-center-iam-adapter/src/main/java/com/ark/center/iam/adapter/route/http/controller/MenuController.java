
package com.ark.center.iam.adapter.route.http.controller;

import com.ark.center.iam.application.route.MenuCommandService;
import com.ark.center.iam.application.route.MenuQueryService;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.MenuModifyParentCommand;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
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

@Tag(name = "菜单管理", description = "菜单管理")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class MenuController extends BaseController {

    private final MenuCommandService menuCommandService;
    private final MenuQueryService menuQueryService;

    @PostMapping("/menus")
    @Operation(summary = "路由树形分页查询")
    public SingleResponse<PageResponse<RouteDetailsDTO>> page(@RequestBody MenuQuery dto) {
        Page<RouteDetailsDTO> routeListTreeVOPage = menuQueryService.queryPage(dto);
        return SingleResponse.ok(PageResponse.of(routeListTreeVOPage));
    }

    @PostMapping("/menus/all")
    @Operation(summary = "路由全量查询")
    public MultiResponse<RouteDetailsDTO> queryAll(@RequestBody MenuQuery dto) {
        return MultiResponse.ok(menuQueryService.queryAll(dto));
    }

    @PostMapping("/menus")
    @Operation(summary = "创建路由")
    public ServerResponse create(@RequestBody @Validated MenuCommand dto) {
        menuCommandService.saveRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/menus")
    @Operation(summary = "更新路由")
    public ServerResponse update(@RequestBody @Validated MenuCommand dto) {
        menuCommandService.updateRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/menus/parent")
    @Operation(summary = "移动路由层级")
    public ServerResponse move(@RequestBody @Validated MenuModifyParentCommand dto) {
        menuCommandService.modifyParent(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/menus/details")
    @Operation(
            summary = "查询路由详情",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public SingleResponse<RouteDetailsDTO> queryDetails(Long id) {
        RouteDetailsDTO dto = menuQueryService.queryDetails(id);
        return SingleResponse.ok(dto);
    }

    @PutMapping("/menus/status")
    @Operation(summary = "更新路由状态")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody MenuCommand dto) {
        menuCommandService.updateRouteStatus(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/menus")
    @Operation(
            summary = "删除路由",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public ServerResponse deleteMenu(Long id) {
        menuCommandService.deleteRouteById(id);
        return ServerResponse.ok();
    }

    @GetMapping("/menus/elements")
    @Operation(
            summary = "获取路由的页面元素",
            description = "根据路由id查询页面元素",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public MultiResponse<ElementBaseDTO> queryMenuElements(Long id) {
        return MultiResponse.ok(menuQueryService.queryRouteElementsById(id));
    }

}

