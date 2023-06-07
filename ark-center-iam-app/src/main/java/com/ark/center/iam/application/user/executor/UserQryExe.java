package com.ark.center.iam.application.user.executor;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.application.user.assembler.OrderAssembler;
import com.ark.center.iam.client.order.dto.OrderDTO;
import com.ark.center.iam.client.order.dto.ReceiveDTO;
import com.ark.center.iam.client.order.dto.info.OrderInfoDTO;
import com.ark.center.iam.client.order.query.OrderPageQry;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.vo.UserPageDTO;
import com.ark.center.iam.infra.user.gateway.db.IamUser;
import com.ark.center.iam.domain.order.gateway.ReceiveGateway;
import com.ark.center.iam.domain.order.model.Order;
import com.ark.center.iam.domain.order.model.OrderItem;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class UserQryExe {

    private final UserGateway userGateway;
    private final ReceiveGateway receiveGateway;
    private final OrderAssembler orderAssembler;

    public OrderInfoDTO get(Long orderId) {
        Order order = orderGateway.findById(orderId);
        List<OrderItem> orderItems = orderGateway.findItemsByOrderId(orderId);
        ReceiveDTO receiveDTO = receiveGateway.findByOrderId(orderId);
        return orderAssembler.assemble(order, orderItems, receiveDTO);
    }

    public Page<UserPageDTO> pageQuery(UserPageQry qry) {

        userGateway.selectUsers(qry);
        LambdaQueryWrapper<IamUser> qw = new LambdaQueryWrapper<IamUser>()
                .like(StrUtil.isNotBlank(qry.getPhone()), IamUser::getPhone, qry.getPhone())
                .like(StrUtil.isNotBlank(qry.getName()), IamUser::getUserName, qry.getName())
                .select(BaseEntity::getId, IamUser::getPhone, IamUser::getUserName, IamUser::getStatus);
        IPage<IamUser> result = this.page(new Page<>(qry.getCurrent(), qry.getSize()), qw);
        List<IamUser> records = result.getRecords();
        List<UserPageDTO> vos = records.stream().map(beanConverter::convertToUserPageListVO).collect(Collectors.toList());
        Page<UserPageDTO> pageVo = new Page<>(result.getCurrent(), result.getSize(), result.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }
}
