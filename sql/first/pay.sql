create schema if not exists pay collate utf8mb4_general_ci;

drop table if exists pay.pay_notify_record;

drop table if exists pay.pay_order;

drop table if exists pay.pay_type;

drop table if exists trade.stm_state;

create table if not exists pay.pay_notify_record
(
    id           bigint auto_increment comment '主键'
        primary key,
    biz_trade_no varchar(255)                              null comment '业务订单号',
    pay_trade_no varchar(255)                              null comment '支付订单号',
    req_body     varchar(255)                              null comment '通知请求体',
    status       int                                       null comment '支付状态',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   tinyint         default 0                 not null comment '逻辑删除'
)
    comment '支付结果通知记录表';

create table if not exists pay.pay_order
(
    id               bigint auto_increment comment '主键'
        primary key,
    biz_trade_no     varchar(255)                              null comment '业务订单号',
    pay_trade_no     varchar(255)                              null comment '支付订单号',
    out_trade_no     varchar(255)                              null comment '第三方平台交易单号',
    pay_type_code    varchar(255)                              null comment '支付类型编码',
    amount           int                                       null comment '支付金额',
    description      varchar(255)                              null comment '支付单描述信息',
    status           int                                       null comment '支付状态',
    last_notify_time datetime                                  null comment '最后一次支付结果通知时间',
    gmt_modified     datetime        default CURRENT_TIMESTAMP not null,
    gmt_create       datetime        default CURRENT_TIMESTAMP not null,
    creator          bigint unsigned default 0                 not null comment '创建人',
    modifier         bigint unsigned default 0                 not null comment '更新人',
    is_deleted       tinyint         default 0                 not null comment '逻辑删除'
)
    comment '支付订单表';

create table if not exists pay.pay_type
(
    id           bigint auto_increment comment '主键'
        primary key,
    name         varchar(255)                              null comment '支付类型名称',
    code         varchar(255)                              null comment '支付类型编号',
    description  varchar(255)                              null comment '支付单描述信息',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   tinyint         default 0                 not null comment '逻辑删除'
)
    comment '支付类别表';