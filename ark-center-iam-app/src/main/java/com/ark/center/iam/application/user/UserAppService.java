package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserQryExe;
import com.ark.center.iam.client.order.command.OrderCreateCmd;
import com.ark.center.iam.client.order.dto.OrderDTO;
import com.ark.center.iam.client.order.dto.info.OrderInfoDTO;
import com.ark.center.iam.client.order.query.OrderPageQry;
import com.ark.center.iam.client.user.command.UserCreateCmd;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.vo.UserPageDTO;
import com.ark.center.iam.domain.order.model.Order;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.pay.api.dto.mq.PayNotifyMessage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class UserAppService {

    private final UserCreateCmdExe userCreateCmdExe;
    private final UserQryExe userQryExe;
    private final UserGateway userGateway;

    @Transactional(rollbackFor = Throwable.class)
    public Long createOrder(OrderCreateCmd orderCreateCmd) {
        return orderCreateCmdExe.execute(orderCreateCmd);
    }

    public Page<UserPageDTO> pageQuery(UserPageQry qry) {
        return userGateway.selectUsers(qry);
    }

    public OrderInfoDTO getOrder(Long id) {
        return orderQryExe.get(id);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateOrderOnPaySuccess(PayNotifyMessage message) {
        Order order = new Order();
        order.setOrderId(message.getOrderId());
        order.paySuccess(message.getPayTradeNo(), LocalDateTime.now());
        orderGateway.updateOrderPayStatus(order);
    }

    public void updateUser(UserCreateCmd userCreateCmd) {

    }

    @Transactional(rollbackFor = Throwable.class)
    public void createUser(UserCreateCmd cmd) {
        userCreateCmdExe.execute(cmd);
    }
}
