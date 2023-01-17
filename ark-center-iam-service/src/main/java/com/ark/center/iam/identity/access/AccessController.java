package com.ark.center.iam.identity.access;

import com.ark.center.iam.api.access.AccessApi;
import com.ark.center.iam.api.access.request.ApiAccessRequest;
import com.ark.center.iam.api.access.response.ApiAccessResponse;
import com.ark.component.dto.SingleResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * 访问权限控制器
 */
@RestController
@RequestMapping("/v1/access")
public class AccessController implements AccessApi {

    private final AccessService accessService;

    public AccessController(AccessService accessService) {
        this.accessService = accessService;
    }

    @Override
    public SingleResponse<ApiAccessResponse> getApiAccess(ApiAccessRequest request) {
        return SingleResponse.ok(accessService.getApiAccess(request));
    }

    public static void main(String[] args) {
        List<Byte[]> list = new ArrayList<>();
        int count = 0;
        while (true) {
            //每次增加10M的内存空间
            list.add(new Byte[1024 * 1024]);
            count++;
            System.out.println(count);
        }
    }
}
