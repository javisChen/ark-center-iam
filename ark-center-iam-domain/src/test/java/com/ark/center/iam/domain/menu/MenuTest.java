package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.menu.vo.MenuType;
import org.junit.jupiter.api.Test;

class MenuTest {

    @Test
    void changeHierarchy() {
        Menu tradeMenu = new Menu("交易中心",
                1L,
                "trade",
                "",
                MenuType.MENU,
                false,
                0,
                "",
                "",
                null,
                null);

        Menu orderMenu = new Menu("订单管理",
                1L,
                "trade",
                "",
                MenuType.MENU,
                false,
                0,
                "",
                "",
                null,
                tradeMenu);

        System.out.println(tradeMenu);

        System.out.println(orderMenu);
    }
}