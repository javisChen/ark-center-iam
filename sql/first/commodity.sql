create schema if not exists commodity collate utf8mb4_general_ci;

use commodity;

drop table if exists commodity.co_attachment;

drop table if exists commodity.co_attr;

drop table if exists commodity.co_attr_group;

drop table if exists commodity.co_attr_group_rel;

drop table if exists commodity.co_attr_option;

drop table if exists commodity.co_attr_spu;

drop table if exists commodity.co_attr_template;

drop table if exists commodity.co_brand;

drop table if exists commodity.co_category;

drop table if exists commodity.co_category_brand_rel;

drop table if exists commodity.co_sku;

drop table if exists commodity.co_sku_attr;

drop table if exists commodity.co_spu;

drop table if exists commodity.co_spu_attr;

drop table if exists commodity.co_spu_sales;

create table if not exists commodity.co_attachment
(
    id           bigint auto_increment comment 'ID'
        primary key,
    biz_type     varchar(64)     default ''                not null comment '业务类型',
    biz_id       bigint          default 0                 not null comment '业务ID',
    url          varchar(512)    default ''                not null comment '附件地址',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '附件表' charset = utf8mb4;

create index idx_biz_type_biz_id
    on commodity.co_attachment (biz_type, biz_id);

create table if not exists commodity.co_attr
(
    id               bigint auto_increment comment 'ID'
        primary key,
    name             varchar(50)     default ''                not null comment '属性名称',
    input_type       int(1)          default 1                 not null comment '属性录入方式，enums[INPUT,手工录入,1;SELECT,从选项列表选取,2]',
    type             tinyint(1)      default 1                 not null comment '属性的类型，enums[SPEC,规格,1;PARAM,参数,2]',
    sort             int             default 0                 not null comment '排序',
    attr_template_id bigint                                    not null comment '模板ID，关联co_attr_template.id',
    attr_group_id    bigint          default 0                 not null comment '属性组ID，关联co_attr_group.id',
    can_manual_add   int(1)          default 0                 not null comment '是否支持手动新增，enums[NO,不支持,0;YES,支持,1]',
    gmt_modified     datetime        default CURRENT_TIMESTAMP not null,
    gmt_create       datetime        default CURRENT_TIMESTAMP not null,
    creator          bigint unsigned default 0                 not null comment '创建人',
    modifier         bigint unsigned default 0                 not null comment '更新人',
    is_deleted       bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '商品属性' charset = utf8;

create index idx_attr_template_id
    on commodity.co_attr (attr_template_id);

create table if not exists commodity.co_attr_group
(
    id               bigint auto_increment comment 'ID'
        primary key,
    name             varchar(50)     default ''                not null comment '属性分组名称',
    attr_template_id bigint                                    not null comment '模板ID，关联co_attr_template.id',
    gmt_modified     datetime        default CURRENT_TIMESTAMP not null,
    gmt_create       datetime        default CURRENT_TIMESTAMP not null,
    creator          bigint unsigned default 0                 not null comment '创建人',
    modifier         bigint unsigned default 0                 not null comment '更新人',
    is_deleted       bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '商品属性组' charset = utf8;

create index idx_attr_template_id
    on commodity.co_attr_group (attr_template_id);

create table if not exists commodity.co_attr_group_rel
(
    id            bigint auto_increment comment 'ID'
        primary key,
    attr_id       bigint                                    not null comment '属性ID，关联co_attr.id',
    attr_group_id bigint                                    not null comment '属性组ID，关联co_attr_group.id',
    gmt_modified  datetime        default CURRENT_TIMESTAMP not null,
    gmt_create    datetime        default CURRENT_TIMESTAMP not null,
    creator       bigint unsigned default 0                 not null comment '创建人',
    modifier      bigint unsigned default 0                 not null comment '更新人',
    is_deleted    bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '商品属性组与属性关联表' charset = utf8;

create table if not exists commodity.co_attr_option
(
    id           bigint(11) auto_increment comment 'ID'
        primary key,
    attr_id      bigint(11)                                not null comment '商品属性ID，关联co_attr.id',
    value        varchar(64)     default ''                not null comment '属性值内容',
    type         tinyint(1)      default 1                 not null comment '类型：enums[COMMON,通用,1;EXCLUSIVE,商品特有,2]',
    spu_id       bigint          default 0                 not null comment '关联co_spu.id',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '商品属性值选项' charset = utf8;

create index idx_attr_id
    on commodity.co_attr_option (attr_id);

create table if not exists commodity.co_attr_spu
(
    id           bigint(11) auto_increment comment 'ID'
        primary key,
    attr_id      bigint(11)                                not null comment '商品属性ID，关联co_attr.id',
    spu_id       bigint(11)                                not null comment 'SPU ID，关联co_spu.id',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除',
    constraint idx_spu_id_attr_id
        unique (spu_id, attr_id)
)
    comment 'SPU特有的商品属性选项' charset = utf8;

create table if not exists commodity.co_attr_template
(
    id           bigint(11) auto_increment comment 'ID'
        primary key,
    name         varchar(50)     default ''                not null comment '模板名称',
    spec_count   int             default 0                 not null comment '规格数量',
    param_count  int             default 0                 not null comment '参数数量',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '商品属性模板' charset = utf8;

create table if not exists commodity.co_brand
(
    id           bigint auto_increment comment '品牌id'
        primary key,
    name         varchar(100)                              not null comment '品牌名称',
    image_url    varchar(1000)   default ''                null comment '品牌图片地址',
    letter       char            default ''                null comment '品牌的首字母',
    sort         int                                       null comment '排序',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '品牌表' charset = utf8;

create table if not exists commodity.co_category
(
    id               bigint auto_increment comment '分类ID'
        primary key,
    name             varchar(50)     default ''                not null comment '分类名称',
    code             varchar(32)     default ''                not null comment '编码',
    commodity_count  int             default 0                 not null comment '商品数量',
    is_show          tinyint(1)      default 0                 not null comment '是否显示 enums[NO,否,0;YES,是,1]',
    is_nav           tinyint(1)      default 0                 not null comment '是否导航 enums[NO,否,0;YES,是,1]',
    sort             int             default 0                 not null comment '排序',
    pid              bigint          default 0                 not null comment '上级ID',
    level_path       varchar(128)    default ''                not null comment '分类级别路径，例如：0.1.2 代表该分类是三级分类，上级路由的id是1,再上级的路由id是0',
    level            tinyint(1)      default 1                 not null comment '分类级别',
    attr_template_id bigint          default 0                 not null comment '属性模板ID',
    gmt_modified     datetime        default CURRENT_TIMESTAMP not null,
    gmt_create       datetime        default CURRENT_TIMESTAMP not null,
    creator          bigint unsigned default 0                 not null comment '创建人',
    modifier         bigint unsigned default 0                 not null comment '更新人',
    is_deleted       bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '商品类目' charset = utf8;

create index idx_parent_id
    on commodity.co_category (pid);

create table if not exists commodity.co_category_brand_rel
(
    id           bigint auto_increment comment 'ID'
        primary key,
    category_id  int                                       not null comment '分类ID',
    brand_id     int                                       not null comment '品牌ID',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment '分类品牌关联表' charset = utf8;

create index idx_category_id_brand_id
    on commodity.co_category_brand_rel (category_id, brand_id);

create table if not exists commodity.co_sku
(
    id           bigint auto_increment comment 'ID'
        primary key,
    spu_id       bigint                                    not null comment 'spuId，关联co_spu.id',
    spu_name     varchar(64)                               not null comment '商品名称（冗余）',
    code         varchar(64)     default ''                not null comment 'SKU编码',
    main_picture varchar(255)    default ''                not null comment 'SKU主图',
    sales_price  int             default 0                 not null comment '销售价（单位：分）',
    cost_price   int             default 0                 not null comment '成本价（单位：分）',
    stock        int             default 0                 not null comment '库存',
    warn_stock   int             default 0                 not null comment '预警库存',
    spec_data    varchar(512)    default ''                not null comment '销售参数JSON',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment 'sku' charset = utf8mb4;

create index idx_spu_id
    on commodity.co_sku (spu_id);

create table if not exists commodity.co_sku_attr
(
    id           bigint auto_increment comment 'ID'
        primary key,
    sku_id       bigint                                    not null comment 'skuId，关联co_sku.id',
    attr_value   varchar(2048)   default ''                not null comment '属性值',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment 'sku规格属性' charset = utf8mb4;

create index idx_sku_id
    on commodity.co_sku_attr (sku_id);

create table if not exists commodity.co_spu
(
    id            bigint auto_increment comment 'ID'
        primary key,
    name          varchar(64)     default ''                not null comment '商品名称',
    code          varchar(64)     default ''                not null comment '商品编号',
    description   varchar(255)    default ''                not null comment '商品介绍',
    main_picture  varchar(255)    default ''                not null comment 'spu主图url',
    shelf_status  tinyint(1)      default 0                 not null comment '上下架状态：enums[DOWN,下架,0;UP,上架,1]',
    verify_status tinyint(1)      default 0                 not null comment '审核状态：enums[NO_CHECK,未审核,0;CHECK_PASS,审核通过,1;CHECK_NO_PASS,审核不通过,2]',
    sales         int             default 0                 not null comment '销量',
    show_price    int             default 0                 not null comment '默认展示价格（单位：分）',
    unit          tinyint(1)      default 1                 null comment '单位：enums[G,克,1;KG,千克,2]',
    weight        int                                       null comment '商品重量，默认为克(g)',
    brand_id      bigint                                    not null comment '品牌id，关联co_brand.id',
    category_id   bigint                                    not null comment '分类id，关联co_category.id',
    gmt_modified  datetime        default CURRENT_TIMESTAMP not null,
    gmt_create    datetime        default CURRENT_TIMESTAMP not null,
    creator       bigint unsigned default 0                 not null comment '创建人',
    modifier      bigint unsigned default 0                 not null comment '更新人',
    is_deleted    bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment 'spu主表' charset = utf8mb4;

create index idx_brand_id
    on commodity.co_spu (brand_id);

create index idx_category_id
    on commodity.co_spu (category_id);

create table if not exists commodity.co_spu_attr
(
    id           bigint auto_increment comment 'ID'
        primary key,
    spu_id       bigint                                    not null comment 'spuId，关联co_spu.id',
    attr_value   varchar(2048)   default ''                not null comment '属性值（冗余）',
    attr_id      bigint                                    not null comment '属性id',
    gmt_modified datetime        default CURRENT_TIMESTAMP not null,
    gmt_create   datetime        default CURRENT_TIMESTAMP not null,
    creator      bigint unsigned default 0                 not null comment '创建人',
    modifier     bigint unsigned default 0                 not null comment '更新人',
    is_deleted   bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment 'spu参数属性' charset = utf8mb4;

create index idx_spu_id
    on commodity.co_spu_attr (spu_id);

create table if not exists commodity.co_spu_sales
(
    id                  bigint auto_increment comment 'ID'
        primary key,
    spu_id              bigint                                    not null comment 'spuId，关联co_spu.id',
    freight_template_id bigint          default 0                 not null comment '运费模版ID,关联freight_template.id',
    pc_detail_html      text                                      null comment 'PC端商品介绍富文本',
    mobile_detail_html  text                                      null comment '移动端商品介绍富文本',
    param_data          varchar(2048)   default ''                not null comment '参数属性JSON',
    gmt_modified        datetime        default CURRENT_TIMESTAMP not null,
    gmt_create          datetime        default CURRENT_TIMESTAMP not null,
    creator             bigint unsigned default 0                 not null comment '创建人',
    modifier            bigint unsigned default 0                 not null comment '更新人',
    is_deleted          bigint unsigned default 0                 not null comment '删除标识 0-表示未删除 大于0-已删除'
)
    comment 'spu销售属性' charset = utf8mb4;