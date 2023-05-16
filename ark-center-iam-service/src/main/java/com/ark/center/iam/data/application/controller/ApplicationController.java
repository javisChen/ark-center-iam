package com.ark.center.iam.data.application.controller;


import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.data.application.dto.ApplicationQueryDTO;
import com.ark.center.iam.data.application.dto.ApplicationUpdateDTO;
import com.ark.center.iam.data.application.service.IApplicationService;
import com.ark.center.iam.data.application.vo.ApplicationBaseVO;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
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
@Api(tags = "应用")
@RestController
@RequestMapping
public class ApplicationController extends BaseController {

    @Autowired
    private IApplicationService iApplicationService;

    @PostMapping("/v1/applications")
    public MultiResponse<ApplicationBaseVO> list(@RequestBody ApplicationQueryDTO dto) {
        return MultiResponse.ok(iApplicationService.listVos(dto));
    }

    @PostMapping("/v1/application")
    public ServerResponse saveApplication(@Validated({ValidateGroup.Add.class, Default.class})
                                          @RequestBody ApplicationUpdateDTO dto) {
        iApplicationService.saveApplication(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/v1/application")
    public ServerResponse updateApplication(@Validated({ValidateGroup.Update.class, Default.class})
                                            @RequestBody ApplicationUpdateDTO dto) {
        iApplicationService.updateApplication(dto);
        return ServerResponse.ok();
    }

}

