package com.ark.center.iam.adapter.application.web;


import com.ark.center.iam.application.application.ApplicationAppService;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.data.application.service.IApplicationService;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.groups.Default;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Schema(name = "应用管理", description = "应用管理")
@RequiredArgsConstructor
@RestController
@RequestMapping
public class ApplicationController extends BaseController {

    private final IApplicationService iApplicationService;

    private final ApplicationAppService applicationAppService;


    @PostMapping("/v1/applications")
    public MultiResponse<ApplicationDTO> queryList(@RequestBody ApplicationQry dto) {
        return MultiResponse.ok(applicationAppService.queryList(dto));
    }

    @PostMapping("/v1/application/create")
    public ServerResponse createApplication(@Validated({ValidateGroup.Add.class, Default.class})
                                          @RequestBody ApplicationCmd dto) {
        applicationAppService.createApplication(dto);
        iApplicationService.saveApplication(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/v1/application/update")
    public ServerResponse updateApplication(@Validated({ValidateGroup.Update.class, Default.class})
                                            @RequestBody ApplicationCmd dto) {
        applicationAppService.updateApplication(dto);
        iApplicationService.updateApplication(dto);
        return ServerResponse.ok();
    }

}

