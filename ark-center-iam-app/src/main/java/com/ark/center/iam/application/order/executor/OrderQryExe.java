package com.ark.center.iam.application.order.executor;

import com.ark.center.iam.application.order.assembler.OrderAssembler;
import com.ark.center.iam.client.order.dto.OrderDTO;
import com.ark.center.iam.client.order.dto.ReceiveDTO;
import com.ark.center.iam.client.order.dto.info.OrderInfoDTO;
import com.ark.center.iam.client.order.query.OrderPageQry;
import com.ark.center.iam.domain.order.gateway.OrderGateway;
import com.ark.center.iam.domain.order.gateway.ReceiveGateway;
import com.ark.center.iam.domain.order.model.Order;
import com.ark.center.iam.domain.order.model.OrderItem;
import com.ark.component.dto.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class OrderQryExe {

    private final OrderGateway orderGateway;
    private final ReceiveGateway receiveGateway;
    private final OrderAssembler orderAssembler;

    public PageResponse<OrderDTO> getPageList(OrderPageQry pageQry) {
        return orderGateway.getPageList(pageQry);
    }

    public OrderInfoDTO get(Long orderId) {
        Order order = orderGateway.findById(orderId);
        List<OrderItem> orderItems = orderGateway.findItemsByOrderId(orderId);
        ReceiveDTO receiveDTO = receiveGateway.findByOrderId(orderId);
        return orderAssembler.assemble(order, orderItems, receiveDTO);
    }

}
