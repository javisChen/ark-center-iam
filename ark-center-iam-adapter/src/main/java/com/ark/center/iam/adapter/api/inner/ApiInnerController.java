//package com.ark.center.iam.adapter.api.inner;
//
//import com.ark.center.iam.application.api.ApiCommandHandler;
//import com.ark.center.iam.client.api.ApiQueryApi;
//import com.ark.center.iam.client.api.dto.ApiDetailDTO;
//import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
//import com.ark.center.iam.client.api.query.ApiQuery;
//import com.ark.component.dto.MultiResponse;
//import com.ark.component.dto.SingleResponse;
//import com.ark.component.web.base.BaseController;
//import io.swagger.v3.oas.annotations.tags.Tag;
//import lombok.RequiredArgsConstructor;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@Tag(name = "Api接口（内部调用）", description = "Api接口（内部调用）")
//@RequiredArgsConstructor
//@RestController
//@RequestMapping("/v1/apis")
//public class ApiInnerController extends BaseController implements ApiQueryApi {
//
//    private final ApiCommandHandler apiCommandHandler;
//
//    @Override
//    public MultiResponse<ApiDetailsDTO> queryAll(ApiQuery apiQuery) {
//        return MultiResponse.ok(apiCommandHandler.queryList(apiQuery));
//    }
//
//    @Override
//    public SingleResponse<ApiDetailDTO> getApi(Long id) {
//        return null;
//    }
//}
//
