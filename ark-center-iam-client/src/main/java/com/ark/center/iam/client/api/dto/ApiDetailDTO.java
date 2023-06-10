package com.ark.center.iam.client.api.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ApiDetailDTO extends ApiBaseVO {

    private Long applicationId;
    private Long categoryId;
}
