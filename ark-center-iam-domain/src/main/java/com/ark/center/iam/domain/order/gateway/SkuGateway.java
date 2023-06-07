package com.ark.center.iam.domain.order.gateway;

import com.ark.center.iam.domain.order.model.Sku;

import java.util.List;

public interface SkuGateway {

    /**
     * 获取SKU集合
     */
    List<Sku> getSkuList(List<Long> skuIds);

}
