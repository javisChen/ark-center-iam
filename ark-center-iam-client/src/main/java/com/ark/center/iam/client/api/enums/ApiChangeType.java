package com.ark.center.iam.client.api.enums;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
@Schema(
    enumAsRef = true,
    description = """
        API变更类型:
         * `CREATED` - 新建API
         * `UPDATED` - 更新API
         * `DELETED` - 删除API
         * `STATUS_CHANGED` - 状态变更
        """
)
public enum ApiChangeType {
    
    CREATED("API新建"),
    UPDATED("API更新"),
    DELETED("API删除"),
    STATUS_CHANGED("状态变更");
    
    private final String desc;
} 