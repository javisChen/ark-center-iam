package com.ark.center.iam.client.api.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ApiDetailsDTO extends ApiBaseDTO {

    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Long permissionId;
    private String permissionCode;

}
