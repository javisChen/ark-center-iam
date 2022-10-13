package com.ark.center.iam.data.api.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ApiDetailVO extends ApiBaseVO {

    private Long applicationId;
    private Long categoryId;
}
