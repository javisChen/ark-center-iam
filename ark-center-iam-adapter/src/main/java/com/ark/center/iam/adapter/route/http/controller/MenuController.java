
package com.ark.center.iam.adapter.route.http.controller;

import com.ark.center.iam.application.menu.MenuCommandHandler;
import com.ark.center.iam.application.menu.MenuQueryService;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuHierarchyChangeCommand;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.center.iam.model.menu.dto.MenuDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Tag(name = "菜单管理", description = "菜单管理")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class MenuController extends BaseController {

    private final MenuCommandHandler menuCommandHandler;
    private final MenuQueryService menuQueryService;

    @GetMapping("/menus")
    @Operation(summary = "路由树形分页查询")
    public SingleResponse<PageResponse<MenuDetailsDTO>> page(MenuQuery dto) {
        Page<MenuDetailsDTO> routeListTreeVOPage = menuQueryService.queryPage(dto);
        return SingleResponse.ok(PageResponse.of(routeListTreeVOPage));
    }

    @PostMapping("/menus/all")
    @Operation(summary = "路由全量查询")
    public MultiResponse<MenuDetailsDTO> queryAll(@RequestBody MenuQuery dto) {
        return MultiResponse.ok(menuQueryService.queryAll(dto));
    }

    @PostMapping("/menus")
    @Operation(summary = "创建路由")
    public ServerResponse create(@RequestBody @Validated MenuCreateCommand command) {
        menuCommandHandler.create(command);
        return ServerResponse.ok();
    }

    @PutMapping("/menus")
    @Operation(summary = "更新路由")
    public ServerResponse update(@RequestBody @Validated MenuUpdateCommand command) {
        menuCommandHandler.update(command);
        return ServerResponse.ok();
    }

    @PutMapping("/menus/hierarchy")
    @Operation(summary = "修改菜单的层级")
    public ServerResponse changeHierarchy(@RequestBody @Validated MenuHierarchyChangeCommand dto) {
        menuCommandHandler.changeHierarchy(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/menus/details")
    @Operation(
            summary = "查询路由详情",
            parameters = {
                    @Parameter(name = "id", description = "路由id", required = true)
            }
    )
    public SingleResponse<MenuDetailsDTO> queryDetails(Long id) {
        MenuDetailsDTO dto = menuQueryService.queryDetails(id);
        return SingleResponse.ok(dto);
    }

    @PutMapping("/menus/status")
    @Operation(summary = "更新路由状态")
    public ServerResponse changeStatus(@RequestBody MenuUpdateCommand command) {
        menuCommandHandler.changeStatus(command);
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
        menuCommandHandler.delete(id);
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
        return MultiResponse.ok(menuQueryService.queryMenuElements(id));
    }

}

