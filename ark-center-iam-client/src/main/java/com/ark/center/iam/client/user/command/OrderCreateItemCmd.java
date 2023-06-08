package com.ark.center.iam.client.user.command;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 订单表
 * </p>
 *
 * @author EOP
 * @since 2022-08-09
 */
@Data
@ApiModel(value = "OrderCreateItemCmd", description = "订单明细")
public class OrderCreateItemCmd implements Serializable {

    @Schema(name = "SkuId", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long skuId;

    @Schema(name = "购买数量", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer quantity;

}
