package com.ark.center.iam.domain.cart.gateway;

import com.ark.center.iam.client.cartitem.dto.CartItemDTO;
import com.ark.center.iam.domain.cart.model.CartItem;

import java.util.List;

public interface CartGateway {

    CartItem getCartItem(Long userId, Long skuId);

    CartItem getCartItem(Long cartItemId);

    void saveCartItem(CartItem cartItem);

    void updateChecked(CartItem cartItem);

    List<CartItemDTO> listCartItems(Long userId);
}
