package com.ark.center.iam.adapter.application.web;


import com.ark.center.iam.application.application.ApplicationAppService;
import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Tag(name = "应用管理", description = "应用管理")
@RequiredArgsConstructor
@RestController
@RequestMapping
public class ApplicationController extends BaseController {

    private final ApplicationAppService applicationAppService;

    @PostMapping("/v1/applications")
    @Operation(summary = "查询应用列表")
    public MultiResponse<ApplicationDTO> queryList(ApplicationQry dto) {
        return MultiResponse.ok(applicationAppService.queryList(dto));
    }

    @PostMapping("/v1/application/create")
    @Operation(summary = "创建应用")
    public ServerResponse createApplication(@Validated({ValidateGroup.Add.class, Default.class})
                                          @RequestBody ApplicationCmd dto) {
        applicationAppService.createApplication(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/v1/application/update")
    @Operation(summary = "更新应用")
    public ServerResponse updateApplication(@Validated({ValidateGroup.Update.class, Default.class})
                                            @RequestBody ApplicationCmd dto) {
        applicationAppService.updateApplication(dto);
        return ServerResponse.ok();
    }

}

