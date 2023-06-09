package com.ark.center.iam.adapter.api.web.controller;


import com.ark.center.iam.application.api.executor.ApiAppService;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.data.api.cache.ApiCacheHolder;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.data.api.service.IApiService;
import com.ark.center.iam.client.api.dto.ApiDetailVO;
import com.ark.center.iam.client.api.dto.ApiListDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import jakarta.validation.groups.Default;
import java.util.Map;
import java.util.Set;

/**
 * <p>
 * api表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Schema(name = "API管理", description = "API管理")
@RestController
@RequestMapping("/v1")
public class ApiController extends BaseController {

    @Autowired
    private ApiCacheHolder apiCacheManager;
    @Autowired
    private IApiService iApiService;
    @Autowired
    private ApiAppService apiAppService;
    @Autowired
    private RequestMappingHandlerMapping requestMappingHandlerMapping;

    @Operation(summary = "接口列表")
    @PostMapping("/apis")
    public MultiResponse<ApiListDTO> queryList(@RequestBody ApiQry dto) {
        return MultiResponse.ok(apiAppService.queryList(dto));
    }

    @Operation(summary = "新增接口")
    @PostMapping("/api")
    public ServerResponse saveApi(@Validated({ValidateGroup.Add.class, Default.class})
                                  @RequestBody ApiUpdateCmd dto) {
        iApiService.saveApplication(dto);
        apiAppService.createApplication(dto);
        return ServerResponse.ok();
    }


    @Operation(summary = "获取单个接口")
    @GetMapping("/api")
    public SingleResponse<ApiDetailVO> getApi(Long id) {
        ApiDetailVO vo = iApiService.getApplicationVO(id);
        return SingleResponse.ok(vo);
    }

    @Operation(summary = "更新接口")
    @PutMapping("/api")
    public ServerResponse updateApi(@Validated({ValidateGroup.Update.class, Default.class})
                                    @RequestBody ApiUpdateCmd dto) {
        iApiService.updateApi(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "删除单个接口")
    @DeleteMapping("/api/{id}")
    public ServerResponse deleteApi(@PathVariable Long id) {
        iApiService.removeApi(id);
        return ServerResponse.ok();
    }

    @Operation(summary = "更新接口缓存")
    @PutMapping("/api/cache")
    public ServerResponse updateApiCache() {
        apiCacheManager.update();
        return ServerResponse.ok();
    }

    @GetMapping("/api/init")
    @Transactional(rollbackFor = Exception.class, timeout = 20000)
    public ServerResponse init() {
        for (Map.Entry<RequestMappingInfo, HandlerMethod> entry : requestMappingHandlerMapping.getHandlerMethods().entrySet()) {
            RequestMappingInfo requestMappingInfo = entry.getKey();
            ApiUpdateCmd dto = new ApiUpdateCmd();
            dto.setId(1L);
            dto.setApplicationId(1L);
            Set<String> patterns = requestMappingInfo.getPatternsCondition().getPatterns();
            String url = patterns.iterator().next();
            dto.setName(url);
            Set<RequestMethod> methods = requestMappingInfo.getMethodsCondition().getMethods();
            dto.setUrl(url);
            RequestMethod next = null;
            if (!methods.iterator().hasNext()) {
                continue;
            }
            next = methods.iterator().next();
            dto.setMethod(next.name());
            dto.setAuthType(1);
            dto.setStatus(1);
            iApiService.saveApplication(dto);
        }
        return ServerResponse.ok();
    }
}

