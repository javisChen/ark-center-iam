package com.ark.center.iam.domain.order.gateway;

import com.ark.center.iam.client.order.dto.ReceiveDTO;
import com.ark.center.iam.domain.order.model.Receive;

public interface ReceiveGateway {

    void save(Receive receive);

    ReceiveDTO findByOrderId(Long orderId);
}
