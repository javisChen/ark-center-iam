-- MySQL Script generated by MySQL Workbench
-- Tue Dec 15 18:49:14 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
-- Table `kt`.`upms_user_group_user_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_user_group_user_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_user_group_user_rel` (
                                                               `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                                               `user_group_id` BIGINT UNSIGNED NOT NULL COMMENT '用户组名称，关联upms_user_group.id',
                                                               `user_id` BIGINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户id，关联upms_user_id',
                                                               `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                               `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                               `creator` BIGINT NOT NULL COMMENT '创建人',
                                                               `modifier` BIGINT NULL COMMENT '更新人',
                                                               UNIQUE INDEX `uk_user_group_id_user_id` (`user_group_id` ASC, `user_id` ASC),
                                                               PRIMARY KEY (`id`))
    ENGINE = InnoDB
    COMMENT = '用户组与用户关联表';


-- -----------------------------------------------------
-- Table `kt`.`upms_user_role_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_user_role_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_user_role_rel` (
                                                         `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                                         `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户id，关联upms_role.id',
                                                         `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色id，关联upms_role.id',
                                                         `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                         `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                         `creator` BIGINT NOT NULL COMMENT '创建人',
                                                         `modifier` BIGINT NULL COMMENT '更新人',
                                                         PRIMARY KEY (`id`),
                                                         UNIQUE INDEX `uk_user_id_role_id` (`user_id` ASC, `role_id` ASC))
    ENGINE = InnoDB
    COMMENT = '用户角色关联表';


-- -----------------------------------------------------
-- Table `kt`.`upms_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_user` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_user` (
                                                `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                `name` VARCHAR(45) NULL COMMENT '用户名称',
                                                `phone` CHAR(11) NOT NULL COMMENT '手机号码',
                                                `password` VARCHAR(64) NOT NULL COMMENT '用户密码',
                                                `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态：1-已启用；2-已禁用；',
                                                `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                `creator` BIGINT NOT NULL COMMENT '创建人',
                                                `modifier` BIGINT NULL COMMENT '更新人',
                                                PRIMARY KEY (`id`),
                                                UNIQUE INDEX `phone_UNIQUE` (`phone` ASC))
    ENGINE = InnoDB
    COMMENT = '用户表';


-- -----------------------------------------------------
-- Table `kt`.`upms_user_group_role_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_user_group_role_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_user_group_role_rel` (
                                                               `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                                               `user_group_id` BIGINT UNSIGNED NOT NULL COMMENT '用户组id，关联upms_user_group.id',
                                                               `role_id` BIGINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '角色id，关联upms_role.id',
                                                               `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                               `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                               `creator` BIGINT NOT NULL COMMENT '创建人',
                                                               `modifier` BIGINT NULL COMMENT '更新人',
                                                               UNIQUE INDEX `uk_user_group_id_role_id` (`user_group_id` ASC, `role_id` ASC),
                                                               PRIMARY KEY (`id`))
    ENGINE = InnoDB
    COMMENT = '用户组与角色关联表';


-- -----------------------------------------------------
-- Table `kt`.`upms_permission_role_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_permission_role_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_permission_role_rel` (
                                                               `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                               `permission_id` BIGINT UNSIGNED NOT NULL COMMENT '权限id，关联upms_permission.id',
                                                               `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色id，关联upms_role.id',
                                                               `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                               `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                               `creator` BIGINT NOT NULL COMMENT '创建人',
                                                               `modifier` BIGINT NULL COMMENT '更新人',
                                                               PRIMARY KEY (`id`),
                                                               UNIQUE INDEX `uk_permission_id_role_id` (`permission_id` ASC, `role_id` ASC))
    ENGINE = InnoDB
    COMMENT = '角色与权限关联表';


-- -----------------------------------------------------
-- Table `kt`.`upms_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_role` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_role` (
                                                `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                                `name` VARCHAR(45) NOT NULL COMMENT '用户名称',
                                                `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '角色状态 1-已启用；2-已禁用；',
                                                `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                `creator` BIGINT NOT NULL COMMENT '创建人',
                                                `modifier` BIGINT NULL COMMENT '更新人',
                                                PRIMARY KEY (`id`),
                                                UNIQUE INDEX `uk_name` (`name` ASC))
    ENGINE = InnoDB
    COMMENT = '角色表';


-- -----------------------------------------------------
-- Table `kt`.`upms_user_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_user_group` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_user_group` (
                                                      `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                                      `name` VARCHAR(45) NOT NULL COMMENT '用户组名称',
                                                      `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户组状态：1-已启用；2-已禁用；',
                                                      `gmt_create` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                      `gmt_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                      `creator` BIGINT NOT NULL COMMENT '创建人',
                                                      `modifier` BIGINT NULL COMMENT '更新人',
                                                      UNIQUE INDEX `uk_name` (`name` ASC),
                                                      INDEX `fk_upms_user_group_upms_user_group_user_ref1_idx` (`id` ASC))
    ENGINE = InnoDB
    COMMENT = '用户组表';


-- -----------------------------------------------------
-- Table `kt`.`upms_permission_resource_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_permission_resource_rel` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_permission_resource_rel` (
                                                                   `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                                   `permission_id` BIGINT UNSIGNED NOT NULL COMMENT '权限id，关联upms_permission.id',
                                                                   `resource_id` BIGINT UNSIGNED NOT NULL COMMENT '资源id，关联各种不同资源（菜单、菜单元素、文件、API统称为资源）主表的id',
                                                                   `resource_type` VARCHAR(45) NULL COMMENT '权限类型 MENU-菜单权限；PAGE_ELEMENT-页面元素；FILE-文件；SER_API-内部服务API；OPEN_API-开放API',
                                                                   `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                                   `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                                   `creator` BIGINT NOT NULL COMMENT '创建人',
                                                                   `modifier` BIGINT NULL COMMENT '更新人',
                                                                   PRIMARY KEY (`id`),
                                                                   INDEX `idx_permission_id` (`permission_id` ASC),
                                                                   INDEX `idx_resource_id` (`resource_id` ASC))
    ENGINE = InnoDB
    COMMENT = '权限与资源关联表';


-- -----------------------------------------------------
-- Table `kt`.`upms_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_permission` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_permission` (
                                                      `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                      `name` VARCHAR(45) NOT NULL COMMENT '权限名称',
                                                      `type` VARCHAR(25) NOT NULL COMMENT '权限类型 MENU-菜单权限；PAGE_ELEMENT-页面元素；FILE-文件；SER_API-内部服务API；OPEN_API-开放API',
                                                      `code` VARCHAR(45) NOT NULL COMMENT '权限编码',
                                                      `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '权限状态 1-已启用；2-已禁用；',
                                                      `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                      `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                      `creator` BIGINT NOT NULL COMMENT '创建人',
                                                      `modifier` BIGINT NULL COMMENT '更新人',
                                                      PRIMARY KEY (`id`),
                                                      UNIQUE INDEX `uk_name` (`name` ASC))
    ENGINE = InnoDB
    COMMENT = '权限表';


-- -----------------------------------------------------
-- Table `kt`.`upms_page_element`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_page_element` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_page_element` (
                                                        `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                        `page_id` BIGINT UNSIGNED NOT NULL COMMENT '页面id，关联upms_page.id',
                                                        `name` VARCHAR(45) NOT NULL COMMENT '元素名称',
                                                        `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1-已启用；2-已禁用；',
                                                        `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                        `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                        `creator` BIGINT NOT NULL COMMENT '创建人',
                                                        `modifier` BIGINT NULL COMMENT '更新人',
                                                        PRIMARY KEY (`id`),
                                                        INDEX `uk_name` (`name` ASC))
    ENGINE = InnoDB
    COMMENT = '页面元素表';


-- -----------------------------------------------------
-- Table `kt`.`upms_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_menu` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_menu` (
                                                `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                `name` VARCHAR(45) NOT NULL COMMENT '元素名称',
                                                `pid` INT NOT NULL COMMENT '父级菜单id',
                                                `level_path` VARCHAR(45) NOT NULL COMMENT '菜单层级路径，例如：0.1.2 代表该菜单是三级菜单，上级菜单的id是1,再上级的菜单id是0',
                                                `level` INT NOT NULL COMMENT '菜单层级',
                                                `path` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '菜单路径',
                                                `icon` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '图标',
                                                `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '权限状态 1-已启用；2-已禁用；',
                                                `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                `creator` BIGINT NOT NULL COMMENT '创建人',
                                                `modifier` BIGINT NULL COMMENT '更新人',
                                                PRIMARY KEY (`id`),
                                                UNIQUE INDEX `uk_name` (`name` ASC))
    ENGINE = InnoDB
    COMMENT = '菜单表';


-- -----------------------------------------------------
-- Table `kt`.`upms_api`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_api` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_api` (
                                               `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                               `name` VARCHAR(50) NOT NULL COMMENT 'API名称',
                                               `code` VARCHAR(50) NOT NULL COMMENT 'API编码',
                                               `status` TINYINT(1) NOT NULL COMMENT '状态 1-已启用；2-已禁用；',
                                               `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                               `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                               `creator` BIGINT NOT NULL COMMENT '创建人',
                                               `modifier` BIGINT NOT NULL COMMENT '更新人',
                                               PRIMARY KEY (`id`),
                                               UNIQUE INDEX `uk_code` (`code` ASC))
    COMMENT = 'api表';


-- -----------------------------------------------------
-- Table `kt`.`upms_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kt`.`upms_page` ;

CREATE TABLE IF NOT EXISTS `kt`.`upms_page` (
                                                `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                `name` VARCHAR(45) NOT NULL COMMENT '页面名称',
                                                `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1-已启用；2-已禁用；',
                                                `gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                `creator` BIGINT NOT NULL COMMENT '创建人',
                                                `modifier` BIGINT NULL COMMENT '更新人',
                                                PRIMARY KEY (`id`),
                                                INDEX `uk_name` (`name` ASC))
    ENGINE = InnoDB
    COMMENT = '页面表';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;