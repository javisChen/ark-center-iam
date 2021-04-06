
-- -----------------------------------------------------
-- Schema kt
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kt` ;

-- -----------------------------------------------------
-- Schema kt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kt` DEFAULT CHARACTER SET utf8mb4 ;
USE `kt` ;

-- -----------------------------------------------------
-- Table `kt`.`iam_user_group_user_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_user_group_user_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_user_group_user_rel` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_group_id` BIGINT UNSIGNED NOT NULL COMMENT '用户组名称，关联upms_user_group.id',
  `user_id` BIGINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户id，关联upms_user_id',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  UNIQUE INDEX `uk_user_group_id_user_id` (`user_group_id` ASC, `user_id` ASC) ,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '用户组与用户关联表';


-- -----------------------------------------------------
-- Table `kt`.`iam_user_role_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_user_role_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_user_role_rel` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户id，关联upms_role.id',
  `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色id，关联upms_role.id',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_user_id_role_id` (`user_id` ASC, `role_id` ASC) )
ENGINE = InnoDB
COMMENT = '用户角色关联表';


-- -----------------------------------------------------
-- Table `kt`.`iam_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_user` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL COMMENT '用户名称',
  `phone` CHAR(11) NOT NULL COMMENT '手机号码',
  `code` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '用户编码',
  `password` VARCHAR(64) NOT NULL COMMENT '用户密码',
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态：1-已启用；2-已禁用；',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_phone` (`phone` ASC, `is_deleted` ASC) ,
  INDEX `idx_is_deleted` (`is_deleted` ASC) ,
  UNIQUE INDEX `uk_code` (`code` ASC, `is_deleted` ASC) )
ENGINE = InnoDB
COMMENT = '用户表';


-- -----------------------------------------------------
-- Table `kt`.`iam_user_group_role_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_user_group_role_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_user_group_role_rel` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_group_id` BIGINT UNSIGNED NOT NULL COMMENT '用户组id，关联upms_user_group.id',
  `role_id` BIGINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '角色id，关联upms_role.id',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  UNIQUE INDEX `uk_user_group_id_role_id` (`user_group_id` ASC, `role_id` ASC) ,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '用户组与角色关联表';


-- -----------------------------------------------------
-- Table `kt`.`iam_permission_role_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_permission_role_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_permission_role_rel` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `permission_id` BIGINT UNSIGNED NOT NULL COMMENT '权限id，关联upms_permission.id',
  `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色id，关联upms_role.id',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_permission_id_role_id` (`permission_id` ASC, `role_id` ASC) )
ENGINE = InnoDB
COMMENT = '角色与权限关联表';


-- -----------------------------------------------------
-- Table `kt`.`iam_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_role` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_role` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` VARCHAR(45) NOT NULL COMMENT '用户名称',
  `code` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '角色编码',
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '角色状态 1-已启用；2-已禁用；',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 1-表示删除；0-表示未删除',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_name` (`name` ASC, `is_deleted` ASC) ,
  INDEX `idx_is_deleted` (`is_deleted` ASC) )
ENGINE = InnoDB
COMMENT = '角色表';


-- -----------------------------------------------------
-- Table `kt`.`iam_user_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_user_group` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_user_group` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pid` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '父用户组id，关联id',
  `name` VARCHAR(45) NOT NULL COMMENT '用户组名称',
  `level` INT UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户组层级',
  `level_path` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '部门层级',
  `type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户组类型 1-公司 2-部门',
  `inherit_type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '继承类型 0-不继承 1-继承上级用户组 2-继承所有用户组',
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户组状态：1-已启用；2-已禁用；',
  `gmt_create` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  UNIQUE INDEX `uk_name` (`name` ASC) ,
  INDEX `idx_is_deleted` (`is_deleted` ASC) ,
  INDEX `idx_pid` (`pid` ASC) ,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '用户组表';


-- -----------------------------------------------------
-- Table `kt`.`iam_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_permission` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_permission` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` VARCHAR(45) NOT NULL COMMENT '权限编码',
  `type` VARCHAR(25) NOT NULL COMMENT '权限类型 FRONT_ROUTE-前端路由；PAGE_ELEMENT-页面元素；PAGE-页面；FILE-文件；SER_API-内部服务API；OPEN_API-开放API',
  `resource_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '资源id',
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '权限状态 1-已启用；2-已禁用；',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_type_resource_id` (`type` ASC, `resource_id` ASC, `gmt_create` ASC) ,
  UNIQUE INDEX `uk_code` (`code` ASC) ,
  INDEX `idx_is_deleted` (`is_deleted` ASC) )
ENGINE = InnoDB
COMMENT = '权限表';


-- -----------------------------------------------------
-- Table `kt`.`iam_application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_application` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_application` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '应用编码',
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1-已上线；2-已下线；',
  `type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '应用类型 1-业务系统（前后端）2-纯后台服务',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_code` (`code` ASC, `is_deleted` ASC) ,
  INDEX `uk_is_deleted` (`is_deleted` ASC) ,
  UNIQUE INDEX `uk_name` (`name` ASC, `is_deleted` ASC) )
COMMENT = '应用表';


-- -----------------------------------------------------
-- Table `kt`.`iam_route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_route` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_route` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `application_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '应用id，关联upms_application.id',
  `name` VARCHAR(45) NOT NULL COMMENT '路由标题',
  `code` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '路由编码',
  `component` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '组件名',
  `pid` INT NOT NULL COMMENT '父级路由id',
  `level_path` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '路由层级路径，例如：0.1.2 代表该菜单是三级路由，上级路由的id是1,再上级的路由id是0',
  `level` INT NOT NULL COMMENT '路由层级',
  `path` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '路由path',
  `icon` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '图标',
  `hide_children` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏子路由 0-否 1-是',
  `type` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '路由类型 1：菜单路由 2：页面路由',
  `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序序号',
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '权限状态 1-已启用；2-已禁用；',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`, `application_id`),
  UNIQUE INDEX `uk_name` (`name` ASC, `is_deleted` ASC) ,
  UNIQUE INDEX `uk_code` (`code` ASC, `is_deleted` ASC) ,
  INDEX `idx_is_deleted` (`is_deleted` ASC) ,
  INDEX `idx_pid` (`pid` ASC) ,
  INDEX `fk_idx_system_id` (`application_id` ASC) ,
  INDEX `idx_system_id` (`is_deleted` ASC, `application_id` ASC) )
ENGINE = InnoDB
COMMENT = '路由表';


-- -----------------------------------------------------
-- Table `kt`.`iam_page_element`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_page_element` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_page_element` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` BIGINT UNSIGNED NOT NULL COMMENT '所属菜单id，关联upms_menu.id',
  `name` VARCHAR(45) NOT NULL COMMENT '元素名称',
  `type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '元素类型 1-按钮；2-层；',
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  INDEX `idx_is_deleted` (`is_deleted` ASC) ,
  INDEX `idx_route_id` (`route_id` ASC) )
ENGINE = InnoDB
COMMENT = '页面元素表';


-- -----------------------------------------------------
-- Table `kt`.`iam_api_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_api_category` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_api_category` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `application_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '应用id，关联upms_application.id',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'API分类名称',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`, `application_id`),
  INDEX `idx_is_deleted` (`is_deleted` ASC) ,
  INDEX `idx_application_id` (`application_id` ASC, `is_deleted` ASC) ,
  UNIQUE INDEX `uk_name_application_id` (`application_id` ASC, `name` ASC, `is_deleted` ASC) )
COMMENT = 'Api分类表';


-- -----------------------------------------------------
-- Table `kt`.`iam_api`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`iam_api` ;

CREATE TABLE IF NOT EXISTS `kt`.`iam_api` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `application_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '应用id，关联upms_application.id',
  `name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'API名称',
  `url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '接口地址',
  `method` VARCHAR(10) NOT NULL DEFAULT '' COMMENT 'Http Method 1-GET 2-POST 3-PUT 4-DELETE 5-PATCH',
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1-已启用；2-已禁用；',
  `category_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'api分类id，关联api_category.id',
  `auth_type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权',
  `has_path_variable` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'url是否包含路径参数，例： /user/{userId}/api/{apiId} 0-不包含 1-包含',
  `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `modifier` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`, `application_id`),
  UNIQUE INDEX `uk_application_id_url_method` (`url` ASC, `application_id` ASC, `method` ASC) ,
  INDEX `idx_is_deleted` (`is_deleted` ASC) ,
  INDEX `idx_application_id` (`application_id` ASC, `is_deleted` ASC) ,
  INDEX `fk_upms_api_category_idx` (`category_id` ASC) )
COMMENT = 'api表';