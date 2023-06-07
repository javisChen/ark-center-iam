package com.ark.center.iam.application.user.executor;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.digest.DigestUtil;
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
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.user.support.IUserPasswordHelper;
import com.ark.center.iam.infra.order.convertor.OrderConvertor;
import com.ark.center.iam.infra.receive.convertor.ReceiveConvertor;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.center.iam.domain.user.entity.IamUser;
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
    private final RoleAssignService roleAssignService;
    private final IUserPasswordHelper userPasswordHelper;

    public Long execute(UserCreateCmd userCreateCmd) {
        log.info("[User]: Begin Create User, User = {}", userCreateCmd);
        IamUser iamUser = beanConverter.convertToUserDO(userCreateCmd);

        // 检查用户手机号
        checkUserPhone(iamUser);

        // 初始化一些用户信息
        initUser(iamUser);

        // 持久化用户
        persistUser(iamUser);

        // 持久化后一些操作
        postPersistUser(iamUser, userCreateCmd);

        return iamUser.getId();
    }

    private void initUser(IamUser iamUser) {
        // 生成用户编码
        iamUser.setCode(generateUserCode());

        // 用户密码=bcrypt(前端md5(md5(password)) + salt)
        iamUser.setPassword(userPasswordHelper.enhancePassword(DigestUtil.md5Hex(iamUser.getPassword())));

    }

    private String generateUserCode() {
        // 生成后先查询一遍，防止生成了重复的code，其实几率微乎其微
        String code = IdUtil.fastUUID();
        if (codeExists(code)) {
            return generateUserCode();
        }
        return code;
    }

    private boolean codeExists(String code) {
        return userGateway.countUserByCode(code) > 0;
    }

    /**
     * 持久化用户后的操作
     *
     * @param iamUser   用户
     * @param createCmd 创建用户请求
     */
    private void postPersistUser(IamUser iamUser, UserCreateCmd createCmd) {

        Long userId = iamUser.getId();

        assignRoles(userId, createCmd.getRoleIds());

        assignUserGroups(userId, createCmd.getUserGroupIds());
    }

    private void persistUser(IamUser iamUser) {
        userGateway.insert(iamUser);
    }

    private void checkUserPhone(IamUser user) {
        long count = userGateway.countUserByPhone(user.getPhone());
        cn.hutool.core.lang.Assert.isTrue(count > 0, () -> ExceptionFactory.userException("手机号码已存在"));
    }

    private void assignUserGroups(Long userId, List<Long> userGroupIds) {
        if (CollectionUtil.isNotEmpty(userGroupIds)) {
            iamUserGroupUserRelMapper.batchSaveRelation(userId, userGroupIds);
        }
    }

    private void assignRoles(Long userId, List<Long> roleIds) {
        if (CollectionUtil.isNotEmpty(roleIds)) {
            roleAssignService.assignUserRoles(userId, roleIds);
        }
    }


    private List<OrderItem> assembleOrderItems(OrderCreateCmd orderCreateCmd) {
        List<OrderCreateItemCmd> orderItems = orderCreateCmd.getOrderItems();
        List<Long> skuIds = CollUtil.map(orderItems, OrderCreateItemCmd::getSkuId, true);
        Map<Long, Sku> skuMap = requestSkuList(skuIds);
        List<OrderItem> orderItemList = Lists.newArrayList();
        for (OrderCreateItemCmd itemCmd : orderItems) {
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
