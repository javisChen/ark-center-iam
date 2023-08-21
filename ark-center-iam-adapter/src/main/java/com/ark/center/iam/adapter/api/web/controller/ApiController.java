package com.ark.center.iam.adapter.api.web.controller;

import com.ark.center.iam.application.api.executor.ApiAppService;
import com.ark.center.iam.client.api.command.ApiEnableCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.util.Map;
import java.util.Set;

@Tag(name = "API管理", description = "API管理")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class ApiController extends BaseController {

//    private final ApiCacheHolder apiCacheManager;
    private final ApiAppService apiAppService;
    private final RequestMappingHandlerMapping requestMappingHandlerMapping;

    @Operation(summary = "API管理 - API列表（全量）")
    @GetMapping("/apis")
    public MultiResponse<ApiDetailsDTO> queryList(ApiQry dto) {
        return MultiResponse.ok(apiAppService.queryList(dto));
    }

    @Operation(summary = "API管理 - 创建API")
    @PostMapping("/api")
    public ServerResponse saveApi(@Validated({ValidateGroup.Add.class, Default.class})
                                  @RequestBody ApiUpdateCmd dto) {
        apiAppService.createApplication(dto);
        return ServerResponse.ok();
    }


    @Operation(summary = "API管理 - 查询API详情")
    @GetMapping("/api")
    public SingleResponse<ApiDetailDTO> getApi(Long id) {
        ApiDetailDTO vo = apiAppService.getApi(id);
        return SingleResponse.ok(vo);
    }

    @Operation(summary = "API管理 - 更新API")
    @PutMapping("/api")
    public ServerResponse updateApi(@Validated({ValidateGroup.Update.class, Default.class})
                                    @RequestBody ApiUpdateCmd dto) {
        apiAppService.updateApi(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "API管理 - 启用/禁用")
    @PostMapping("/api/enable")
    public ServerResponse enable(@RequestBody ApiEnableCmd dto) {
        apiAppService.enableOrDisable(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "删除单个接口")
    @DeleteMapping("/api/{id}")
    public ServerResponse deleteApi(@PathVariable Long id) {
        apiAppService.deleteApi(id);
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
            dto.setUri(url);
            RequestMethod next = null;
            if (!methods.iterator().hasNext()) {
                continue;
            }
            next = methods.iterator().next();
            dto.setMethod(next.name());
            dto.setAuthType(1);
            dto.setStatus(1);
            apiAppService.createApplication(dto);
        }
        return ServerResponse.ok();
    }
}

