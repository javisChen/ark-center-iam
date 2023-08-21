package com.ark.center.iam.adapter.permission;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "权限管理", description = "权限管理")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class PermissionController {

}
