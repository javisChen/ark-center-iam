
package com.ark.center.iam.data.route.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ark.center.iam.data.user.vo.UserPermissionRouteNavVO;
import com.ark.center.iam.data.route.dto.RouteModifyParentDTO;
import com.ark.center.iam.data.route.dto.RouteQueryDTO;
import com.ark.center.iam.data.route.dto.RouteUpdateDTO;
import com.ark.center.iam.data.route.service.IRouteService;
import com.ark.center.iam.data.route.vo.RouteDetailVO;
import com.ark.center.iam.data.route.vo.RouteElementVO;
import com.ark.center.iam.data.route.vo.RouteListTreeVO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
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
@RestController
@RequestMapping("/v1")
public class RouteController extends BaseController {

    private final IRouteService iRouteService;

    public RouteController(IRouteService iRouteService) {
        this.iRouteService = iRouteService;
    }

    @PostMapping("/routes")
    public SingleResponse<PageResponse<RouteListTreeVO>> listPage(@RequestBody RouteQueryDTO dto) {
        Page<RouteListTreeVO> routeListTreeVOPage = iRouteService.pageList(dto);
        return SingleResponse.ok(PageResponse.of(routeListTreeVOPage));
    }

    @PostMapping("/routes/all")
    public MultiResponse<RouteListTreeVO> list(@RequestBody RouteQueryDTO dto) {
        return MultiResponse.ok(iRouteService.listAllVOs(dto));
    }

    @PostMapping("/route")
    public ServerResponse add(@RequestBody @Validated RouteUpdateDTO dto) {
        iRouteService.saveRoute(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/route")
    public ServerResponse update(@RequestBody @Validated RouteUpdateDTO dto) {
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
                                       @RequestBody RouteUpdateDTO dto) {
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
    public ServerResponse init(@RequestBody UserPermissionRouteNavVO userMenusDTO) {
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

