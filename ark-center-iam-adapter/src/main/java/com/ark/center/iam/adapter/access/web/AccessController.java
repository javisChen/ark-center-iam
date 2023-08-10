//package com.ark.center.iam.adapter.access.web;
//
//import com.ark.center.iam.client.access.AccessApi;
//import com.ark.center.iam.client.access.request.ApiAccessRequest;
//import com.ark.center.iam.client.access.response.ApiAccessResponse;
//import com.ark.center.iam.application.access.AccessAppService;
//import com.ark.component.dto.SingleResponse;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * 访问权限控制器
// */
//@RestController
//@RequestMapping("/access")
//public class AccessController implements AccessApi {
//
//    private final AccessAppService accessAppService;
//
//    public AccessController(AccessAppService accessAppService) {
//        this.accessAppService = accessAppService;
//    }
//
//    @Override
//    public SingleResponse<ApiAccessResponse> getApiAccess(ApiAccessRequest request) {
//        return SingleResponse.ok(accessAppService.getApiAccess(request));
//    }
//
//}
