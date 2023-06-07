package com.ark.center.iam.application.cart;

import com.ark.center.iam.application.order.executor.OrderCreateCmdExe;
import com.ark.center.iam.application.order.executor.OrderQryExe;
import com.ark.center.iam.client.cartitem.command.CartItemAddCmd;
import com.ark.center.iam.client.cartitem.command.CartItemCheckCmd;
import com.ark.center.iam.client.cartitem.dto.CartItemDTO;
import com.ark.center.iam.domain.cart.gateway.CartGateway;
import com.ark.center.iam.domain.cart.model.CartItem;
import com.ark.center.iam.domain.order.gateway.OrderGateway;
import com.ark.center.iam.infra.cart.convertor.CartItemConvertor;
import com.ark.component.context.core.ServiceContext;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartAppService {

    private final OrderCreateCmdExe orderCreateCmdExe;

    private final OrderQryExe orderQryExe;

    private final OrderGateway orderGateway;

    private final CartGateway cartGateway;
    private final CartItemConvertor cartItemConvertor;

    @Transactional(rollbackFor = Throwable.class)
    public void addOrUpdateCartItem(CartItemAddCmd cmd) {
        Long currentUserId = ServiceContext.getCurrentUser().getUserId();
        Long skuId = cmd.getSkuId();
        CartItem cartItem = cartGateway.getCartItem(currentUserId, skuId);
        if (cartItem == null) {
            cartItem = cartItemConvertor.toCartItemDomainObject(cmd);
        } else {
            cartItem.increase(1);
        }
        cartGateway.saveCartItem(cartItem);
    }

    public void checkCartItem(CartItemCheckCmd cmd) {
        CartItem cartItem = cartGateway.getCartItem(cmd.getCartItemId());
        cartItem.checked(cmd.getChecked());
        cartGateway.updateChecked(cartItem);
    }

    public List<CartItemDTO> listBuyerCartItems() {
        Long currentUserId = ServiceContext.getCurrentUser().getUserId();
        return cartGateway.listCartItems(currentUserId);
    }
}
