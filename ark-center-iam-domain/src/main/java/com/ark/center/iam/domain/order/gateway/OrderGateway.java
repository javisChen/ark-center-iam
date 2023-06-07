package com.ark.center.iam.domain.order.gateway;

import com.ark.center.iam.client.order.dto.OrderDTO;
import com.ark.center.iam.client.order.dto.OrderItemDTO;
import com.ark.center.iam.client.order.query.OrderPageQry;
import com.ark.center.iam.domain.order.model.Order;
import com.ark.center.iam.domain.order.model.OrderItem;

import java.util.List;

public interface OrderGateway {

    void save(Order order);

    PageResponse<OrderDTO> getPageList(OrderPageQry pageQry);

    Order findById(Long orderId);

    List<OrderItemDTO> listOrderItems(Long orderId);

    void updateOrderPayStatus(Order order);

    List<OrderItem> findItemsByOrderId(Long orderId);
}
