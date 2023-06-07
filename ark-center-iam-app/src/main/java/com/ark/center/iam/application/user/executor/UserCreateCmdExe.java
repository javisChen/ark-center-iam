package com.ark.center.iam.application.user.executor;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.order.command.OrderCreateCmd;
import com.ark.center.iam.client.order.command.OrderCreateItemCmd;
import com.ark.center.iam.client.order.command.OrderCreateReceiveCreateCmd;
import com.ark.center.iam.client.user.command.UserCreateCmd;
import com.ark.center.iam.domain.order.model.Order;
import com.ark.center.iam.domain.order.model.OrderItem;
import com.ark.center.iam.domain.order.model.Receive;
import com.ark.center.iam.domain.order.model.Sku;
import com.ark.center.iam.domain.order.model.vo.OrderAmount;
import com.ark.center.iam.domain.order.model.vo.OrderPay;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.infra.order.convertor.OrderConvertor;
import com.ark.center.iam.infra.receive.convertor.ReceiveConvertor;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.center.iam.infra.user.gateway.db.IamUser;
import com.ark.component.common.ParamsChecker;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.exception.ExceptionFactory;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
@Slf4j
public class UserCreateCmdExe {

    private final UserBeanConverter beanConverter;
    private final UserGateway userGateway;

    public Long execute(UserCreateCmd createCmd) {
        log.info("[User]: Begin Create User, User = {}", createCmd);
        IamUser iamUser = beanConverter.convertToUserDO(createCmd);

        // 检查用户手机号
        checkUserPhone(iamUser);

        // 持久化用户
        persistUser(iamUser);

        Long userId = iamUser.getId();

        // 持久化后一些操作
        postPersistUser(iamUser, createCmd);
        return userId;
    }

    /**
     * 持久化用户后的操作
     * @param iamUser 用户
     * @param createCmd 创建用户请求
     */
    private void postPersistUser(IamUser iamUser, UserCreateCmd createCmd) {

        Long userId = iamUser.getId();

        doSaveUserRoleRelation(userId, createCmd.getRoleIds());

        doSaveUserUserGroupRelation(userId, createCmd.getUserGroupIds());
    }

    private void persistUser(IamUser iamUser) {
        userGateway.(iamUser);
    }

    private void checkUserPhone(IamUser user) {
        long count = countUserByPhone(user.getPhone());
        Assert.isTrue(count > 0, BizEnums.USER_ALREADY_EXISTS);
    }

    private void doSaveUserUserGroupRelation(Long userId, List<Long> userGroupIds) {
        if (CollectionUtil.isNotEmpty(userGroupIds)) {
            iamUserGroupUserRelMapper.batchSaveRelation(userId, userGroupIds);
        }
    }

    private void doSaveUserRoleRelation(Long userId, List<Long> roleIds) {
        if (CollectionUtil.isNotEmpty(roleIds)) {
            iamUserRoleRelMapper.batchSaveRelation(userId, roleIds);
        }
    }


    private List<OrderItem> assembleOrderItems(OrderCreateCmd orderCreateCmd) {
        List<OrderCreateItemCmd> orderItems = orderCreateCmd.getOrderItems();
        List<Long> skuIds = CollUtil.map(orderItems, OrderCreateItemCmd::getSkuId, true);
        Map<Long, Sku> skuMap = requestSkuList(skuIds);
        List<OrderItem> orderItemList = Lists.newArrayList();
        for (OrderCreateItemCmd itemCmd :orderItems) {
            Sku sku = skuMap.get(itemCmd.getSkuId());
            OrderItem orderItem = orderConvertor.toOrderItemDomainObject(itemCmd, sku);
            orderItemList.add(orderItem);
        }
        return orderItemList;
    }

    private Map<Long, Sku> requestSkuList(List<Long> skuIds) {
        List<Sku> skuInfoList = skuGateway.getSkuList(skuIds);

        ParamsChecker
                .throwIfIsTrue(CollUtil.isEmpty(skuInfoList) || skuIds.size() != skuInfoList.size(),
                ExceptionFactory.userException("商品库存不足或已下架"));

        return skuInfoList
                .stream()
                .collect(Collectors.toMap(Sku::getId, Function.identity()));
    }

    private Order assembleOrder(OrderCreateCmd orderCreateCmd, String tradeNo) {

        List<OrderItem> orderItemList = assembleOrderItems(orderCreateCmd);

        // 计算总实付金额
        int totalAmount = orderItemList.stream().mapToInt(OrderItem::getActualAmount).sum();

        Order order = new Order();
        // 设置订单基本信息
        order.setTradeNo(tradeNo);
        order.setOrderType(orderCreateCmd.getOrderType());
        order.setOrderChannel(orderCreateCmd.getOrderChannel());
        order.setOrderStatus(Order.OrderStatus.PENDING_PAY);
        order.setBuyerRemark(orderCreateCmd.getBuyerRemark());
        order.setBuyerId(orderCreateCmd.getBuyerId() != null ? orderCreateCmd.getBuyerId() : ServiceContext.getCurrentUser().getUserId());
        order.setSellerId(orderCreateCmd.getSellerId() != null ? orderCreateCmd.getSellerId() : 0L);

        // 订单支付信息
        OrderPay orderPay = new OrderPay();
        orderPay.setPayStatus(OrderPay.PayStatus.PENDING_PAY);
        order.setOrderPay(orderPay);

        // 订单金额信息
        OrderAmount orderAmount = new OrderAmount();
        orderAmount.setExpectAmount(totalAmount);
        orderAmount.setActualAmount(totalAmount);
        orderAmount.setFreightAmount(0);
        order.setOrderAmount(orderAmount);

        // 设置订单项
        order.setOrderItemList(orderItemList);
        return order;
    }

    private Long saveOrder(Order order) {
        orderGateway.save(order);
        return order.getOrderId();
    }

    private void saveReceive(OrderCreateCmd reqDTO, Long orderId) {
        OrderCreateReceiveCreateCmd receiveInfo = reqDTO.getReceiveInfo();
        if (receiveInfo != null) {
            Receive receive = receiveConvertor.convertToReceive(receiveInfo);
            receive.setOrderId(orderId);
            receiveGateway.save(receive);
        }
    }
}
