create schema if not exists trade collate utf8mb4_general_ci;

use trade;
-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: trade
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `trade`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `trade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `trade`;

--
-- Table structure for table `od_cart_item`
--

DROP TABLE IF EXISTS `od_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `od_cart_item` (
  `id` bigint unsigned NOT NULL,
  `buyer_id` bigint NOT NULL COMMENT '买家ID',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `product_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` int NOT NULL DEFAULT '0' COMMENT 'SKU单价',
  `quantity` int NOT NULL DEFAULT '0' COMMENT '购买数量',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `spec_data` varchar(512) NOT NULL DEFAULT '' COMMENT 'SKU销售参数JSON',
  `checked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否选中 enums[YES,是,1;NO,否,0]',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_cart_item`
--


--
-- Table structure for table `od_order`
--

DROP TABLE IF EXISTS `od_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `od_order` (
  `id` bigint unsigned NOT NULL,
  `trade_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_type` int NOT NULL DEFAULT '1' COMMENT '订单类型 enums[SHOP,商城订单,1]',
  `order_channel` int NOT NULL DEFAULT '0' COMMENT '下单渠道 enums[PC,PC,1;APP,APP,2;MINI,小程序,3]',
  `order_status` int NOT NULL DEFAULT '1' COMMENT '订单状态 enums[PENDING_PAY,待支付,1;PENDING_DELIVER,待发货,2;PENDING_RECEIVE,待收货,3;SUCCESS,交易成功,4]',
  `pay_status` int NOT NULL DEFAULT '1' COMMENT '支付状态 enums[PENDING_PAY,待支付,1;PAYING,支付中,2;PAY_SUCCESS,支付成功,3;PAY_FAIL,支付失败,4]',
  `pay_type_code` varchar(32) DEFAULT NULL COMMENT '支付类型编码',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `freight_amount` int NOT NULL DEFAULT '0' COMMENT '运费金额',
  `pay_trade_no` varchar(128) NOT NULL DEFAULT '' COMMENT '支付交易单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `buyer_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '买家备注',
  `buyer_id` bigint NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(64) NOT NULL DEFAULT '' COMMENT '买家名称（冗余）',
  `seller_id` bigint NOT NULL COMMENT '卖家ID',
  `logistics_company` varchar(32) NOT NULL DEFAULT '' COMMENT '物流公司',
  `logistics_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流单号',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx_trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order`
--


--
-- Table structure for table `od_order_item`
--

DROP TABLE IF EXISTS `od_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `od_order_item` (
  `id` bigint unsigned NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `trade_no` varchar(64) NOT NULL DEFAULT '' COMMENT '交易订单号',
  `product_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称（冗余）',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `price` int NOT NULL DEFAULT '0' COMMENT 'SKU单价',
  `quantity` int NOT NULL DEFAULT '0' COMMENT '购买数量',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `spec_data` varchar(512) NOT NULL DEFAULT '' COMMENT 'SKU销售参数JSON',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order_item`
--


--
-- Table structure for table `od_receive`
--

DROP TABLE IF EXISTS `od_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `od_receive` (
  `id` bigint unsigned NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `name` varchar(64) DEFAULT '' COMMENT '收货人名称',
  `mobile` varchar(64) DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) DEFAULT '' COMMENT '省份',
  `city` varchar(64) DEFAULT '' COMMENT '城市',
  `district` varchar(64) DEFAULT '' COMMENT '区',
  `street` varchar(128) NOT NULL DEFAULT '' COMMENT '街道',
  `address` varchar(256) DEFAULT '' COMMENT '详细地址',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单收货信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_receive`
--


--
-- Table structure for table `stm_history`
--

DROP TABLE IF EXISTS `stm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stm_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态机id',
  `biz_id` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `event` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '驱动的事件',
  `pre_state` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转换前状态',
  `current_state` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '当前状态',
  `extras` varchar(2048) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态流转的参数',
  `remark` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '保留信息',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_machine_id_biz_id` (`machine_id`,`biz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='状态机历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stm_history`
--


--
-- Table structure for table `stm_state`
--

DROP TABLE IF EXISTS `stm_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stm_state` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态机id',
  `biz_id` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `state` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  `ended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '完结状态 0-否 1-是',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_machine_id_biz_id` (`machine_id`,`biz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='状态机数据记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stm_state`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01  0:41:43
