create schema if not exists trade collate utf8mb4_general_ci;

drop table if exists trade.od_cart_item;

drop table if exists trade.od_order;

drop table if exists trade.od_order_item;

drop table if exists trade.od_receive;

drop table if exists trade.stm_history;

drop table if exists trade.stm_state;

create table if not exists trade.od_cart_item
(
    id            bigint unsigned                           not null
        primary key,
    buyer_id      bigint                                    not null comment '买家ID',
    sku_id        bigint                                    not null comment 'SKU ID',
    product_name  varchar(64)     default ''                not null comment '商品名称',
    price         int             default 0                 not null comment 'SKU单价',
    quantity      int             default 0                 not null comment '购买数量',
    expect_amount int             default 0                 not null comment '应付金额',
    actual_amount int             default 0                 not null comment '实付金额',
    pic_url       varchar(255)    default ''                not null comment '图片地址',
    spec_data     varchar(512)    default ''                not null comment 'SKU销售参数JSON',
    checked       tinyint(1)      default 1                 not null comment '是否选中 enums[YES,是,1;NO,否,0]',
    gmt_modified  datetime        default CURRENT_TIMESTAMP not null,
    gmt_create    datetime        default CURRENT_TIMESTAMP not null,
    creator       bigint unsigned default 0                 not null comment '创建人',
    modifier      bigint unsigned default 0                 not null comment '更新人',
    is_deleted    bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '购物车表' charset = utf8;

create index idx_buyer_id
    on trade.od_cart_item (buyer_id);

create table if not exists trade.od_order
(
    id                bigint unsigned                           not null
        primary key,
    trade_no          varchar(64)     default ''                not null comment '订单号',
    order_type        int             default 1                 not null comment '订单类型 enums[SHOP,商城订单,1]',
    order_channel     int             default 0                 not null comment '下单渠道 enums[PC,PC,1;APP,APP,2;MINI,小程序,3]',
    order_status      int             default 1                 not null comment '订单状态 enums[PENDING_PAY,待支付,1;PENDING_DELIVER,待发货,2;PENDING_RECEIVE,待收货,3;SUCCESS,交易成功,4]',
    pay_status        int             default 1                 not null comment '支付状态 enums[PENDING_PAY,待支付,1;PAYING,支付中,2;PAY_SUCCESS,支付成功,3;PAY_FAIL,支付失败,4]',
    pay_type_code     varchar(32)                               null comment '支付类型编码',
    expect_amount     int             default 0                 not null comment '应付金额',
    actual_amount     int             default 0                 not null comment '实付金额',
    freight_amount    int             default 0                 not null comment '运费金额',
    pay_trade_no      varchar(128)    default ''                not null comment '支付交易单号',
    pay_time          datetime                                  null comment '支付时间',
    deliver_time      datetime                                  null comment '发货时间',
    confirm_time      datetime                                  null comment '确认收货时间',
    buyer_remark      varchar(500)    default ''                not null comment '买家备注',
    buyer_id          bigint                                    not null comment '买家ID',
    buyer_name        varchar(64)     default ''                not null comment '买家名称（冗余）',
    seller_id         bigint                                    not null comment '卖家ID',
    logistics_company varchar(32)     default ''                not null comment '物流公司',
    logistics_code    varchar(32)     default ''                not null comment '物流单号',
    gmt_modified      datetime        default CURRENT_TIMESTAMP not null,
    gmt_create        datetime        default CURRENT_TIMESTAMP not null,
    creator           bigint unsigned default 0                 not null comment '创建人',
    modifier          bigint unsigned default 0                 not null comment '更新人',
    is_deleted        bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除',
    constraint udx_trade_no
        unique (trade_no)
)
    comment '订单表' charset = utf8;

create table if not exists trade.od_order_item
(
    id            bigint unsigned                           not null
        primary key,
    order_id      bigint                                    not null comment '订单ID',
    trade_no      varchar(64)     default ''                not null comment '交易订单号',
    product_name  varchar(64)     default ''                not null comment '商品名称（冗余）',
    sku_id        bigint                                    not null comment 'SKU ID',
    price         int             default 0                 not null comment 'SKU单价',
    quantity      int             default 0                 not null comment '购买数量',
    expect_amount int             default 0                 not null comment '应付金额',
    actual_amount int             default 0                 not null comment '实付金额',
    pic_url       varchar(255)    default ''                not null comment '图片地址',
    spec_data     varchar(512)    default ''                not null comment 'SKU销售参数JSON',
    gmt_modified  datetime        default CURRENT_TIMESTAMP not null,
    gmt_create    datetime        default CURRENT_TIMESTAMP not null,
    creator       bigint unsigned default 0                 not null comment '创建人',
    modifier      bigint unsigned default 0                 not null comment '更新人',
    is_deleted    bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '订单明细表' charset = utf8;

create index idx_order_id
    on trade.od_order_item (order_id);

create index idx_trade_no
    on trade.od_order_item (trade_no);

create table if not exists trade.od_receive
(
    id           bigint unsigned                           not null
        primary key,
    order_id     bigint                                    not null comment '订单ID',
    name         varchar(64)     default ''                null comment '收货人名称',
    mobile       varchar(64)     default ''                null comment '收货人电话',
    province     varchar(64)     default ''                null comment '省份',
    city         varchar(64)     default ''                null comment '城市',
    district     varchar(64)     default ''                null comment '区',
    street       varchar(128)    default ''                not null comment '街道',
    address      varchar(256)    default ''                null comment '详细地址',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '订单收货信息' charset = utf8;

create index idx_order_id
    on trade.od_receive (order_id);

create table if not exists trade.stm_history
(
    id            bigint unsigned auto_increment
        primary key,
    machine_id    varchar(64)     default ''                not null comment '状态机id',
    biz_id        varchar(64)                               not null comment '业务id',
    event         varchar(64)     default ''                not null comment '驱动的事件',
    pre_state     varchar(64)     default ''                not null comment '转换前状态',
    current_state varchar(64)     default ''                not null comment '当前状态',
    extras        varchar(2048)                             null comment '状态流转的参数',
    remark        varchar(2048)   default ''                not null comment '保留信息',
    gmt_create    datetime        default CURRENT_TIMESTAMP not null,
    creator       bigint unsigned default 0                 not null comment '创建人'
)
    comment '状态机历史表';

create index idx_machine_id_biz_id
    on trade.stm_history (machine_id, biz_id);

create table if not exists trade.stm_state
(
    id           bigint unsigned auto_increment
        primary key,
    machine_id   varchar(64)     default ''                not null comment '状态机id',
    biz_id       varchar(64)                               not null comment '业务id',
    state        varchar(64)     default ''                not null comment '状态',
    ended        tinyint(1)      default 0                 not null comment '完结状态 0-否 1-是',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    constraint idx_machine_id_biz_id
        unique (machine_id, biz_id)
)
    comment '状态机数据记录表';