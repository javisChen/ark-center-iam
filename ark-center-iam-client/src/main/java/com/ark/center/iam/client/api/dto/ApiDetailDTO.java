package com.ark.center.iam.client.api.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.v3.oas.annotations.media.Schema;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(
    description = "API详细信息",
    example = """
            {
              "applicationId": 1,
              "categoryId": 1
            }
            """
)
public class ApiDetailDTO extends ApiBaseDTO {

}
