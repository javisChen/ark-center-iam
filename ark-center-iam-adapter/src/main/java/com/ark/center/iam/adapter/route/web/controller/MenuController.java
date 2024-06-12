
package com.ark.center.iam.adapter.route.web.controller;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.route.MenuCommandHandler;
import com.ark.center.iam.application.route.MenuQueryService;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.RouteModifyParentCmd;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Tag(name = "菜单管理", description = "菜单管理")
@RestController
@RequestMapping("/v1/menus")
@RequiredArgsConstructor
public class MenuController {

    private final MenuCommandHandler menuCommandHandler;
    private final MenuQueryService menuQueryService;

    @GetMapping("")
    @Operation(summary = "获取全量菜单树状结构")
    public MultiResponse<Tree<Long>> queryMenus(MenuQuery query) {
        return MultiResponse.ok(menuQueryService.queryMenus(query));
    }

    @PostMapping("/all")
    @Operation(summary = "菜单全量查询")
    public MultiResponse<Tree<Long>> queryList(@RequestBody MenuQuery query) {
        return MultiResponse.ok(menuQueryService.queryList(query));
    }

    @PostMapping("")
    @Operation(summary = "新建菜单")
    public ServerResponse create(@RequestBody
                                 @Validated({ValidateGroup.Add.class, Default.class}) MenuCommand command) {
        menuCommandHandler.create(command);
        return ServerResponse.ok();
    }

    @PutMapping("")
    @Operation(summary = "修改菜单")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) MenuCommand command) {
        menuCommandHandler.update(command);
        return ServerResponse.ok();
    }

    @PutMapping("/parent")
    @Operation(summary = "移动菜单层级")
    public ServerResponse move(@RequestBody @Validated RouteModifyParentCmd dto) {
        menuCommandHandler.modifyParent(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/details")
    @Operation(
            summary = "查询菜单详情",
            parameters = {
                    @Parameter(name = "id", description = "菜单id", required = true)
            }
    )
    public SingleResponse<MenuDTO> queryDetails(Long id) {
        MenuDTO dto = menuQueryService.queryDetails(id);
        return SingleResponse.ok(dto);
    }

    @PutMapping("/status")
    @Operation(summary = "更新菜单状态")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody MenuCommand dto) {
        menuCommandHandler.updateRouteStatus(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/delete")
    @Operation(
            summary = "删除菜单",
            parameters = {
                    @Parameter(name = "id", description = "菜单id", required = true)
            }
    )
    public ServerResponse deleteRoute(Long id) {
        menuCommandHandler.deleteById(id);
        return ServerResponse.ok();
    }

    @GetMapping("/elements")
    @Operation(
            summary = "获取菜单的页面元素",
            description = "根据菜单id查询页面元素",
            parameters = {
                    @Parameter(name = "id", description = "菜单id", required = true)
            }
    )
    public MultiResponse<ElementBaseDTO> queryRouteElements(Long id) {
        return MultiResponse.ok(menuQueryService.queryRouteElementsById(id));
    }

}

