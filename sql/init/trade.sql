-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `od_cart_item`
--

DROP TABLE IF EXISTS `od_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_cart_item` (
  `id` bigint(20) unsigned NOT NULL,
  `buyer_id` bigint(20) NOT NULL COMMENT '买家ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKU ID',
  `spu_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU单价',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `expect_amount` int(11) NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int(11) NOT NULL DEFAULT '0' COMMENT '实付金额',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `spec_data` varchar(512) NOT NULL DEFAULT '' COMMENT 'SKU销售参数JSON',
  `checked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否选中 enums[YES,是,1;NO,否,0]',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_cart_item`
--

/*!40000 ALTER TABLE `od_cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `od_cart_item` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `od_order`
--

DROP TABLE IF EXISTS `od_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_order` (
  `id` bigint(20) unsigned NOT NULL,
  `trade_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型 enums[SHOP,商城订单,1]',
  `order_channel` int(11) NOT NULL DEFAULT '0' COMMENT '下单渠道 enums[PC,PC,1;APP,APP,2;MINI,小程序,3]',
  `order_status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 enums[PENDING_PAY,待支付,1;PENDING_DELIVER,待发货,2;PENDING_RECEIVE,待收货,3;SUCCESS,交易成功,4]',
  `pay_status` int(11) NOT NULL DEFAULT '1' COMMENT '支付状态 enums[PENDING_PAY,待支付,1;PAYING,支付中,2;PAY_SUCCESS,支付成功,3;PAY_FAIL,支付失败,4]',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付类型 enums[WECHAT,微信支付,1;ALIPAY,支付宝,2]',
  `expect_amount` int(11) NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int(11) NOT NULL DEFAULT '0' COMMENT '实付金额',
  `freight_amount` int(11) NOT NULL DEFAULT '0' COMMENT '运费金额',
  `pay_trade_no` varchar(128) NOT NULL DEFAULT '' COMMENT '支付交易单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `buyer_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '买家备注',
  `buyer_id` bigint(20) NOT NULL COMMENT '买家ID',
  `seller_id` bigint(20) NOT NULL COMMENT '卖家ID',
  `logistics_company` varchar(32) NOT NULL DEFAULT '' COMMENT '物流公司',
  `logistics_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流单号',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx_trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order`
--

/*!40000 ALTER TABLE `od_order` DISABLE KEYS */;
INSERT INTO `od_order` VALUES (1625110021352824834,'1625110018274205696',1,1,1,1,NULL,239800,239800,0,'',NULL,NULL,NULL,'速度发货',1,1,'','','2023-02-13 20:29:57','2023-02-13 20:29:57',0,0,0),(1625375271213920257,'1625375269645250560',1,1,1,1,NULL,239800,239800,0,'',NULL,NULL,NULL,'速度发货',1,1,'','','2023-02-14 14:03:57','2023-02-14 14:03:57',0,0,0);
/*!40000 ALTER TABLE `od_order` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `od_order_item`
--

DROP TABLE IF EXISTS `od_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_order_item` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `trade_no` varchar(64) NOT NULL DEFAULT '' COMMENT '交易订单号',
  `spu_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称（冗余）',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKU ID',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU单价',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `expect_amount` int(11) NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int(11) NOT NULL DEFAULT '0' COMMENT '实付金额',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `spec_data` varchar(512) NOT NULL DEFAULT '' COMMENT 'SKU销售参数JSON',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order_item`
--

/*!40000 ALTER TABLE `od_order_item` DISABLE KEYS */;
INSERT INTO `od_order_item` VALUES (1625110021541568513,1625110021352824834,'1625110018274205696','',1523329484740943874,119900,2,239800,239800,'','\"[{\\\"attrName\\\":\\\"颜色\\\",\\\"attrValue\\\":\\\"神秘黑境\\\"},{\\\"attrName\\\":\\\"制式\\\",\\\"attrValue\\\":\\\"4+128G\\\"}]\"','2023-02-13 20:29:57','2023-02-13 20:29:57',0,0,0),(1625375271440412673,1625375271213920257,'1625375269645250560','',1523329484740943874,119900,2,239800,239800,'','\"颜色：神秘黑境;制式：4+128G;\"','2023-02-14 14:03:57','2023-02-14 14:03:57',0,0,0);
/*!40000 ALTER TABLE `od_order_item` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `od_receive`
--

DROP TABLE IF EXISTS `od_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_receive` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `name` varchar(64) DEFAULT '' COMMENT '收货人名称',
  `mobile` varchar(64) DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) DEFAULT '' COMMENT '省份',
  `city` varchar(64) DEFAULT '' COMMENT '城市',
  `district` varchar(64) DEFAULT '' COMMENT '区',
  `street` varchar(128) NOT NULL DEFAULT '' COMMENT '街道',
  `address` varchar(256) DEFAULT '' COMMENT '详细地址',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单收货信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_receive`
--

/*!40000 ALTER TABLE `od_receive` DISABLE KEYS */;
INSERT INTO `od_receive` VALUES (1625110021608677378,1625110021352824834,'需我整规地','18676638181','新疆维吾尔自治区','广州市','乐都区','汉阳街','沿江路','2023-02-13 20:29:57','2023-02-13 20:29:57',0,0,0),(1625375271507521537,1625375271213920257,'需我整规地','18676638181','新疆维吾尔自治区','广州市','乐都区','汉阳街','沿江路','2023-02-14 14:03:57','2023-02-14 14:03:57',0,0,0);
/*!40000 ALTER TABLE `od_receive` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stm_statemachine_definition`
--

DROP TABLE IF EXISTS `stm_statemachine_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stm_statemachine_definition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_code` varchar(50) NOT NULL DEFAULT '' COMMENT '业务编码',
  `config` varchar(1024) NOT NULL DEFAULT '' COMMENT '状态机规则配置（JSON）',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态 0-禁用；1-启用；',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_biz_code` (`biz_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='状态机规则定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stm_statemachine_definition`
--

/*!40000 ALTER TABLE `stm_statemachine_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `stm_statemachine_definition` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stm_statemachine_history`
--

DROP TABLE IF EXISTS `stm_statemachine_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stm_statemachine_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_code` varchar(50) NOT NULL DEFAULT '' COMMENT '业务编码',
  `biz_id` bigint(20) NOT NULL COMMENT '业务ID',
  `event` varchar(64) NOT NULL DEFAULT '' COMMENT '驱动的事件',
  `pre_state` varchar(64) NOT NULL DEFAULT '' COMMENT '转换前状态',
  `current_state` varchar(64) NOT NULL DEFAULT '' COMMENT '当前状态',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_biz_code_biz_id` (`biz_code`,`biz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='状态机历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stm_statemachine_history`
--

/*!40000 ALTER TABLE `stm_statemachine_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stm_statemachine_history` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: trade
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stm_statemachine_runtime`
--

DROP TABLE IF EXISTS `stm_statemachine_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stm_statemachine_runtime` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_code` varchar(50) NOT NULL DEFAULT '' COMMENT '业务编码',
  `biz_id` bigint(20) NOT NULL COMMENT '业务ID',
  `state` varchar(64) NOT NULL DEFAULT '' COMMENT '状态',
  `finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT '完结状态 0-否 1-是',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_biz_code_biz_id` (`biz_code`,`biz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='状态机运行时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stm_statemachine_runtime`
--

/*!40000 ALTER TABLE `stm_statemachine_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `stm_statemachine_runtime` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:17:10
