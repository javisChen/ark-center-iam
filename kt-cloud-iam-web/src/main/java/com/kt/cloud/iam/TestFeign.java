package com.kt.cloud.iam;

import com.kt.component.dto.SingleResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("cop")
public interface TestFeign {

    @GetMapping("/cop/code-project/test")
    SingleResponse<String> test();
}
