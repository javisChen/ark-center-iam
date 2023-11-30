create schema if not exists pay collate utf8mb4_general_ci;

use pay;

-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: pay
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
-- Current Database: `pay`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pay`;

--
-- Table structure for table `pay_notify_record`
--

DROP TABLE IF EXISTS `pay_notify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_notify_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_trade_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务订单号',
  `pay_trade_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付订单号',
  `req_body` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '通知请求体',
  `status` int DEFAULT NULL COMMENT '支付状态',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付结果通知记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_notify_record`
--


--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_trade_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务订单号',
  `pay_trade_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付订单号',
  `out_trade_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方平台交易单号',
  `pay_type_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付类型编码',
  `amount` int DEFAULT NULL COMMENT '支付金额',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付单描述信息',
  `status` int DEFAULT NULL COMMENT '支付状态',
  `last_notify_time` datetime DEFAULT NULL COMMENT '最后一次支付结果通知时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order`
--


--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付类型名称',
  `code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付类型编号',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付单描述信息',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01  0:41:48
