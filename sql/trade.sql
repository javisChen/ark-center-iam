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
  `pay_type` tinyint DEFAULT NULL COMMENT '支付类型',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `freight_amount` int NOT NULL DEFAULT '0' COMMENT '运费金额',
  `pay_trade_no` varchar(128) NOT NULL DEFAULT '' COMMENT '支付交易单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `completion_time` datetime DEFAULT NULL COMMENT '完成时间',
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

INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732064885076471809,'202312052350233',1,1,3,3,2,229900,229900,0,'1732067387302277120',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF88888','2023-12-06 22:13:46','2023-12-05 23:50:23',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732236612632915970,'202312061112464',1,1,3,3,2,229900,229900,0,'1732236623882547200',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF00123','2023-12-06 22:13:22','2023-12-06 11:12:47',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732236740307529730,'202312061113168',1,1,3,3,2,229900,229900,0,'1732236752563793920',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF01122','2023-12-06 16:21:48','2023-12-06 11:13:17',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732326451432730625,'202312061709457',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-06 17:09:46','2023-12-06 17:09:46',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732326953499308034,'202312061711453',1,1,3,3,2,229900,229900,0,'1732326988820049920',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF88888','2023-12-06 17:12:21','2023-12-06 17:11:45',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732403784629956610,'202312062217033',1,1,3,3,2,229900,229900,0,'1732403898044444672',NULL,NULL,NULL,NULL,'',1,'Admin',0,'sf','4423','2023-12-06 22:18:04','2023-12-06 22:17:03',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732405075439595521,'202312062222110',1,1,3,3,2,229900,229900,0,'1732405084654989312',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','99999','2023-12-06 22:22:27','2023-12-06 22:22:11',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732405550201253890,'202312062224042',1,1,3,3,2,229900,229900,0,'1732405569994682368',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','A88888','2023-12-06 22:24:25','2023-12-06 22:24:04',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732413826448044033,'202312062256575',1,1,4,3,2,229900,229900,0,'1732413837760589824','2023-12-06 22:57:08','2023-12-06 22:57:49','2023-12-06 23:08:15',NULL,'',1,'Admin',0,'SF','SF9999123','2023-12-06 23:08:15','2023-12-06 22:56:58',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732629332975235074,'202312071313182',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 13:13:18','2023-12-07 13:13:18',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732643108927647746,'202312071408025',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 14:08:03','2023-12-07 14:08:03',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732645053448925186,'202312071415462',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 14:15:46','2023-12-07 14:15:46',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732648604527046657,'202312071429529',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 14:29:53','2023-12-07 14:29:53',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732648925269667841,'202312071431093',1,1,4,3,2,229900,229900,0,'1732651000259473408','2023-12-07 15:04:53','2023-12-07 15:05:12','2023-12-07 15:08:00',NULL,'',1,'Admin',0,'SF','123123123','2023-12-07 15:08:00','2023-12-07 14:31:10',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732696380694671361,'202312071739436',1,1,3,3,2,229900,229900,0,'1732696402786578432','2023-12-07 17:40:05','2023-12-07 17:40:29',NULL,NULL,'',1,'Admin',0,'SF','000123','2023-12-07 17:40:29','2023-12-07 17:39:44',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674635026433,'202312071748505',1,1,4,3,2,2299000,2299000,0,'1732698697783898112','2023-12-07 17:50:01','2023-12-07 17:50:54','2023-12-08 22:55:49',NULL,'',1,'Admin',0,'SF','SF9999','2023-12-08 22:55:49','2023-12-07 17:48:51',1,1,0);

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

INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732064885105831938,1732064885076471809,'202312052350233','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-05 23:50:23','2023-12-05 23:50:23',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732236612658081794,1732236612632915970,'202312061112464','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 11:12:47','2023-12-06 11:12:47',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732236740336889858,1732236740307529730,'202312061113168','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 11:13:17','2023-12-06 11:13:17',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732326451449507842,1732326451432730625,'202312061709457','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782404,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-06 17:09:46','2023-12-06 17:09:46',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732326953516085250,1732326953499308034,'202312061711453','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782404,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-06 17:11:45','2023-12-06 17:11:45',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732403784650928129,1732403784629956610,'202312062217033','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:17:03','2023-12-06 22:17:03',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732405075460567041,1732405075439595521,'202312062222110','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:22:11','2023-12-06 22:22:11',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732405550222225409,1732405550201253890,'202312062224042','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:24:04','2023-12-06 22:24:04',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732413826464821249,1732413826448044033,'202312062256575','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:56:58','2023-12-06 22:56:58',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732629333029761026,1732629332975235074,'202312071313182','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-07 13:13:18','2023-12-07 13:13:18',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732643109049282561,1732643108927647746,'202312071408025','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-07 14:08:03','2023-12-07 14:08:03',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732645053474091010,1732645053448925186,'202312071415462','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658374,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 14:15:46','2023-12-07 14:15:46',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732648604548018177,1732648604527046657,'202312071429529','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860550696962,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 14:29:53','2023-12-07 14:29:53',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732648925408079874,1732648925269667841,'202312071431093','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860550696962,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 14:31:10','2023-12-07 14:31:10',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732696380724031490,1732696380694671361,'202312071739436','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-07 17:39:44','2023-12-07 17:39:44',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674790215682,1732698674635026433,'202312071748505','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860550696965,229900,5,1149500,1149500,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674840547329,1732698674635026433,'202312071748505','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658374,229900,3,689700,689700,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `product_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674865713153,1732698674635026433,'202312071748505','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860810743813,229900,2,459800,459800,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);

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

INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732064885130997762,1732064885076471809,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-05 23:50:23','2023-12-05 23:50:23',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732236612679053313,1732236612632915970,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-06 11:12:47','2023-12-06 11:12:47',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732236740349472769,1732236740307529730,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-06 11:13:17','2023-12-06 11:13:17',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732326451457896450,1732326451432730625,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-06 17:09:46','2023-12-06 17:09:46',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732326953528668162,1732326953499308034,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-06 17:11:45','2023-12-06 17:11:45',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732403784663511042,1732403784629956610,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-06 22:17:03','2023-12-06 22:17:03',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732405075481538562,1732405075439595521,'','','','','','','','2023-12-06 22:22:11','2023-12-06 22:22:11',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732405550230614017,1732405550201253890,'','','','','','','','2023-12-06 22:24:04','2023-12-06 22:24:04',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732413826485792769,1732413826448044033,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-06 22:56:58','2023-12-06 22:56:58',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732629333088481282,1732629332975235074,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 13:13:18','2023-12-07 13:13:18',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732643109103808513,1732643108927647746,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:08:03','2023-12-07 14:08:03',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732645053486673922,1732645053448925186,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:15:46','2023-12-07 14:15:46',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732648604564795394,1732648604527046657,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:29:53','2023-12-07 14:29:53',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732648925424857090,1732648925269667841,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:31:10','2023-12-07 14:31:10',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732696380736614401,1732696380694671361,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 17:39:44','2023-12-07 17:39:44',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674882490370,1732698674635026433,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);

--
-- Table structure for table `stm_history`
--

DROP TABLE IF EXISTS `stm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stm_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态机id',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `event` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '驱动的事件',
  `pre_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转换前状态',
  `current_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '当前状态',
  `extras` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态流转的参数',
  `remark` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '保留信息',
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
  `machine_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态机id',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态',
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


--
-- Table structure for table `us_receive`
--

DROP TABLE IF EXISTS `us_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_receive` (
  `id` bigint unsigned NOT NULL,
  `user_id` bigint NOT NULL COMMENT '用户ID',
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
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户收货信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_receive`
--

INSERT INTO `us_receive` (`id`, `user_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732064830898647041,1,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-05 23:50:11','2023-12-05 23:50:11',1,1,0);
INSERT INTO `us_receive` (`id`, `user_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1732064868529942530,1,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-05 23:50:20','2023-12-05 23:50:20',1,1,0);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11 15:41:07
