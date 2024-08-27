create schema foundation collate utf8mb4_general_ci;

drop table if exists t_file;

drop table if exists t_file_group;

create table if not exists foundation.t_file
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(64)     default ''                not null comment '文件名称',
    uri         varchar(255)    default ''                not null comment '文件地址',
    mime_type   varchar(32)     default ''                not null comment '文件类型',
    biz_type    varchar(32)     default 'default'         not null comment '业务编码',
    group_id    bigint unsigned default '0'               not null comment '文件分组',
    update_time datetime        default CURRENT_TIMESTAMP null,
    create_time datetime        default CURRENT_TIMESTAMP null,
    creator     bigint unsigned default '0'               not null comment '创建人',
    modifier    bigint unsigned default '0'               not null comment '更新人',
    is_deleted  bigint unsigned default '0'               not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '文件表';

create index idx_group_id
    on foundation.t_file (group_id);

create table if not exists foundation.t_file_group
(
    id          bigint unsigned auto_increment comment 'id'
        primary key,
    name        varchar(64)                               not null comment '分组名称',
    pid         bigint          default 0                 not null comment '父级路由id',
    path        varchar(64)     default ''                not null comment '层级路径，例如：0.1.2 代表是三级路由，上级路由的id是1,再上级的路由id是0',
    level       int                                       not null comment '层级',
    create_time datetime        default CURRENT_TIMESTAMP null,
    update_time datetime        default CURRENT_TIMESTAMP null,
    creator     bigint unsigned default '0'               not null comment '创建人',
    modifier    bigint unsigned default '0'               not null comment '更新人',
    is_deleted  bigint unsigned default '0'               not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '文件分组表';

