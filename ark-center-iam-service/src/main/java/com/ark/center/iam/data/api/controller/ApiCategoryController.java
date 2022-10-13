package com.ark.center.iam.data.api.controller;


import com.ark.center.iam.data.api.dto.ApiCategoryUpdateDTO;
import com.ark.center.iam.data.api.service.IApiCategoryService;
import com.ark.center.iam.data.api.vo.ApiCategoryBaseVO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.groups.Default;

/**
 * <p>
 * api表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@RestController
@RequestMapping("/v1")
public class ApiCategoryController extends BaseController {

    private final IApiCategoryService iApiCategoryService;

    public ApiCategoryController(IApiCategoryService iApiCategoryService) {
        this.iApiCategoryService = iApiCategoryService;
    }

    @GetMapping("/api/categories")
    public MultiResponse<ApiCategoryBaseVO> list(Long applicationId) {
        return MultiResponse.ok(iApiCategoryService.listVos(applicationId));
    }

    @PostMapping("/api/category")
    public ServerResponse save(@Validated({ValidateGroup.Add.class, Default.class})
                               @RequestBody ApiCategoryUpdateDTO dto) {
        iApiCategoryService.saveApiCategory(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/api/category")
    public ServerResponse update(@Validated({ValidateGroup.Update.class, Default.class})
                                 @RequestBody ApiCategoryUpdateDTO dto) {
        iApiCategoryService.updateApiCategory(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/api/category")
    public ServerResponse delete(Long id) {
        iApiCategoryService.removeApiCategory(id);
        return ServerResponse.ok();
    }

}

