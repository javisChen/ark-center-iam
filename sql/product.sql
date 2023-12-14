-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: product
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
-- Current Database: `product`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `product`;

--
-- Table structure for table `co_attachment`
--

DROP TABLE IF EXISTS `co_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `biz_type` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `biz_id` bigint NOT NULL DEFAULT '0' COMMENT '业务ID',
  `url` varchar(512) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附件地址',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_biz_type_biz_id` (`biz_type`,`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1735189298190282755 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attachment`
--

INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483973386242,'SPU_',1523329483184857089,'http://file.cloud.org:9000/default/5FFCQcW3yqvbo12iny1oNQ.jpeg','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483990163458,'SPU_',1523329483184857089,'http://file.cloud.org:9000/default/srF-EbWGIkcfbYNAiyWJYw.jpeg','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672488480769,'SPU_',1566725672303931393,'http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672488480770,'SPU_',1566725672303931393,'http://file.cloud.org:9000/default/pms_1660187405.88555521.jpg','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672488480771,'SPU_',1566725672303931393,'http://file.cloud.org:9000/default/pms_1660187409.41944393.jpg','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908376681357313,'SPU_',1585908375347568641,'http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg','2022-10-28 16:16:36','2022-10-28 16:16:36',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499282640897,'SPU_',1585928498976456706,'http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690085044226,'SPU_',1585930689908883458,'http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810474913793,'SPU_',1566986790461059073,'http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810474913794,'SPU_',1566986790461059073,'http://file.cloud.org:9000/default/pms_1624606012.35418317.jpg','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810537828354,'SPU_',1566986790461059073,'http://file.cloud.org:9000/default/pms_1624606020.36169148.jpg','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810537828355,'SPU_',1566986790461059073,'http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298165116929,'SPU_',1706962859971883009,'/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298177699842,'SPU_',1706962859971883009,'/minio/ark/2023/12/product/34793f2c-884b-4ddd-8bf7-a4fdfb6aa7c1.pms_1672037284.40181961.png','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_attachment` (`id`, `biz_type`, `biz_id`, `url`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298190282754,'SPU_',1706962859971883009,'/minio/ark/2023/12/product/ed7c63cb-b842-467f-ba82-a0a035d20ace.pms_1672220453.00928774.png','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);

--
-- Table structure for table `co_attr`
--

DROP TABLE IF EXISTS `co_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性名称',
  `input_type` int NOT NULL DEFAULT '1' COMMENT '属性录入方式，enums[INPUT,手工录入,1;SELECT,从选项列表选取,2]',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '属性的类型，enums[SPEC,规格,1;PARAM,参数,2]',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `attr_template_id` bigint NOT NULL COMMENT '模板ID，关联co_attr_template.id',
  `attr_group_id` bigint NOT NULL DEFAULT '0' COMMENT '属性组ID，关联co_attr_group.id',
  `can_manual_add` int NOT NULL DEFAULT '0' COMMENT '是否支持手动新增，enums[NO,不支持,0;YES,支持,1]',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_attr_template_id` (`attr_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706958257767624706 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attr`
--

INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327014409134081,'版本',2,1,0,1523326644605739010,0,0,'2022-09-05 16:12:06','2022-05-08 23:40:37',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327266537136130,'颜色',1,1,0,1523326644605739010,1584900871586369537,0,'2022-09-05 16:12:24','2022-05-08 23:41:37',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327841215504386,'包装清单',1,2,0,1523326644605739010,1523327481444884481,0,'2022-05-08 23:43:54','2022-05-08 23:43:54',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327922828271617,'品牌',1,2,0,1523326644605739010,1523327513929768961,0,'2022-05-08 23:44:14','2022-05-08 23:44:14',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327948132507649,'型号',1,2,0,1523326644605739010,1523327513929768961,0,'2022-05-08 23:44:20','2022-05-08 23:44:20',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327992193671170,'上市公司',1,2,0,1523326644605739010,1523327513929768961,0,'2022-05-08 23:44:30','2022-05-08 23:44:30',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523328053954797569,'机身内存',1,2,0,1523326644605739010,1523327550231470081,0,'2022-05-08 23:44:45','2022-05-08 23:44:45',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523328096413736962,'屏幕尺寸',1,2,0,1523326644605739010,1523327568535412738,0,'2022-05-08 23:44:55','2022-05-08 23:44:55',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523328146703441922,'前摄像头',1,2,0,1523326644605739010,1523327588366082049,0,'2022-05-08 23:45:07','2022-05-08 23:45:07',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566623322197233666,'认证型号',1,2,0,1523326644605739010,1523327513929768961,0,'2022-09-05 11:04:41','2022-09-05 11:04:41',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566623410889986050,'型号',1,2,0,1523326644605739010,1523327513929768961,0,'2022-09-05 11:05:02','2022-09-05 11:05:02',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566623458587611138,'网络连接',1,2,0,1523326644605739010,1523327513929768961,0,'2022-09-05 11:05:14','2022-09-05 11:05:14',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566623642553978881,'产品尺寸',1,2,0,1523326644605739010,1566620683606724610,0,'2022-09-05 11:05:58','2022-09-05 11:05:58',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566623988290457601,'屏幕类型',1,2,0,1523326644605739010,1566620726115995650,0,'2022-09-05 11:07:20','2022-09-05 11:07:20',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566624103143084034,'连接方式',1,2,0,1523326644605739010,1566620782399361025,0,'2022-09-05 11:07:47','2022-09-05 11:07:47',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566977806085730306,'颜色',1,1,0,1566977536152907778,0,0,'2022-09-06 10:33:17','2022-09-06 10:33:17',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566977968443043842,'尺寸',1,1,0,1566977536152907778,0,0,'2022-09-06 10:33:55','2022-09-06 10:33:55',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566981383629910018,'套装',1,1,0,1566977536152907778,0,0,'2022-09-06 10:47:30','2022-09-06 10:47:30',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985521315000322,'分辨率',1,2,0,1566977536152907778,0,0,'2022-09-06 11:03:56','2022-09-06 11:03:56',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985652697378818,' 背光',1,2,0,1566977536152907778,1566982019503173634,0,'2022-09-06 11:04:27','2022-09-06 11:04:27',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985744619745281,'刷新率',1,2,0,1566977536152907778,1566982019503173634,0,'2022-09-06 11:04:49','2022-09-06 11:04:49',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985820662476802,'CPU',1,2,0,1566977536152907778,1566982066806534146,0,'2022-09-06 11:05:07','2022-09-06 11:05:07',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985853843615745,'内存',1,2,0,1566977536152907778,1566982066806534146,0,'2022-09-06 11:05:15','2022-09-06 11:05:15',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985899037241346,'WIFI',1,2,0,1566977536152907778,1566982137874821121,0,'2022-09-06 11:05:26','2022-09-06 11:05:26',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566985933401174017,'蓝牙',1,2,0,1566977536152907778,1566982137874821121,0,'2022-09-06 11:05:34','2022-09-06 11:05:34',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1584905278361272321,'布料',1,2,0,1584897537135702018,1584900871586369537,0,'2022-10-25 21:50:39','2022-10-25 21:50:39',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706555434743697410,'频率',2,1,0,1523326644605739010,1523327691671789570,1,'2023-09-26 14:25:46','2023-09-26 14:24:57',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706862433809248258,'网络',2,1,0,1566977536152907778,0,1,'2023-09-27 10:44:51','2023-09-27 10:44:51',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956185395572737,'CCC强制性认证',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:58:02','2023-09-27 16:57:23',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956206258040833,'上市日期',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:03','2023-09-27 16:57:28',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956249597784066,'电信设备进网许可证',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:07','2023-09-27 16:57:38',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956274843299841,'入网型号',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:10','2023-09-27 16:57:44',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956293210157057,'机型',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:13','2023-09-27 16:57:49',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956857461485569,'机身重量',1,2,0,1706955247188488193,1706955869916803073,0,'2023-09-27 17:00:03','2023-09-27 17:00:03',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956909655404546,'机身颜色',1,2,0,1706955247188488193,0,0,'2023-09-27 17:00:16','2023-09-27 17:00:16',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956934162722817,'机身尺寸',1,2,0,1706955247188488193,0,0,'2023-09-27 17:00:21','2023-09-27 17:00:21',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956988785143809,'存储卡',1,2,0,1706955247188488193,1706955889235767298,0,'2023-09-27 17:00:35','2023-09-27 17:00:35',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957062483259393,'运行内存',1,2,0,1706955247188488193,1706955889235767298,0,'2023-09-27 17:00:52','2023-09-27 17:00:52',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957109094559745,'屏幕刷新率',1,2,0,1706955247188488193,1706955907288051713,0,'2023-09-27 17:01:03','2023-09-27 17:01:03',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957149271797762,'无线充电',1,2,0,1706955247188488193,1706955935696072705,0,'2023-09-27 17:01:13','2023-09-27 17:01:13',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957196965228546,'系统',1,2,0,1706955247188488193,1706955957661642754,0,'2023-09-27 17:01:24','2023-09-27 17:01:24',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957244453138434,'5G网络',1,2,0,1706955247188488193,1706956002666524673,0,'2023-09-27 17:01:35','2023-09-27 17:01:35',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957285632815106,'充电接口',1,2,0,1706955247188488193,1706956023357026305,0,'2023-09-27 17:01:45','2023-09-27 17:01:45',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957388594589698,'前摄主像素',1,2,0,1706955247188488193,1706956058803089409,0,'2023-09-27 17:02:10','2023-09-27 17:02:10',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706957820544987138,'版本',2,1,0,1706955247188488193,0,0,'2023-09-27 17:08:06','2023-09-27 17:03:53',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958003538276354,'购买方式',2,1,0,1706955247188488193,0,0,'2023-09-27 17:04:36','2023-09-27 17:04:36',1,1,0);
INSERT INTO `co_attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257767624705,'颜色',2,1,0,1706955247188488193,0,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);

--
-- Table structure for table `co_attr_group`
--

DROP TABLE IF EXISTS `co_attr_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attr_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性分组名称',
  `attr_template_id` bigint NOT NULL COMMENT '模板ID，关联co_attr_template.id',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_attr_template_id` (`attr_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706956058803089410 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attr_group`
--

INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327481444884481,'包装清单',1523326644605739010,'2022-05-08 23:42:28','2022-05-08 23:42:28',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327513929768961,'主体',1523326644605739010,'2022-05-08 23:42:36','2022-05-08 23:42:36',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327550231470081,'存储',1523326644605739010,'2022-05-08 23:42:45','2022-05-08 23:42:45',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327568535412738,'屏幕',1523326644605739010,'2022-05-08 23:42:49','2022-05-08 23:42:49',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327588366082049,'拍照',1523326644605739010,'2022-05-08 23:42:54','2022-05-08 23:42:54',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327654241820673,'基本信息',1523326644605739010,'2022-05-08 23:43:09','2022-05-08 23:43:09',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327669475532802,'系统',1523326644605739010,'2022-05-08 23:43:13','2022-05-08 23:43:13',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523327691671789570,'CPU',1523326644605739010,'2022-05-08 23:43:18','2022-05-08 23:43:18',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566620683606724610,'规格',1523326644605739010,'2022-09-05 10:54:12','2022-09-05 10:54:12',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566620726115995650,'显示',1523326644605739010,'2022-09-05 10:54:22','2022-09-05 10:54:22',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566620752770797570,'功能',1523326644605739010,'2022-09-05 10:54:29','2022-09-05 10:54:29',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566620782399361025,'连接',1523326644605739010,'2022-09-05 10:54:36','2022-09-05 10:54:36',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566982019503173634,'显示参数',1566977536152907778,'2022-09-06 10:50:01','2022-09-06 10:50:01',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566982066806534146,'处理器和存储',1566977536152907778,'2022-09-06 10:50:13','2022-09-06 10:50:13',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566982137874821121,'无线配置',1566977536152907778,'2022-09-06 10:50:29','2022-09-06 10:50:29',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1584900871586369537,'材质',1584897537135702018,'2022-10-25 21:33:08','2022-10-25 21:33:08',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955722642206722,'主体',1706955247188488193,'2023-09-27 16:55:33','2023-09-27 16:55:33',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955869916803073,'基本信息',1706955247188488193,'2023-09-27 16:56:08','2023-09-27 16:56:08',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955889235767298,'存储',1706955247188488193,'2023-09-27 16:56:12','2023-09-27 16:56:12',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955907288051713,'屏幕',1706955247188488193,'2023-09-27 16:56:17','2023-09-27 16:56:17',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955935696072705,'电池信息',1706955247188488193,'2023-09-27 16:56:23','2023-09-27 16:56:23',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955957661642754,'操作系统',1706955247188488193,'2023-09-27 16:56:29','2023-09-27 16:56:29',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956002666524673,'网络支持',1706955247188488193,'2023-09-27 16:56:39','2023-09-27 16:56:39',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956023357026305,'数据接口',1706955247188488193,'2023-09-27 16:56:44','2023-09-27 16:56:44',1,1,0);
INSERT INTO `co_attr_group` (`id`, `name`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706956058803089409,'摄像头',1706955247188488193,'2023-09-27 16:56:53','2023-09-27 16:56:53',1,1,0);

--
-- Table structure for table `co_attr_group_rel`
--

DROP TABLE IF EXISTS `co_attr_group_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attr_group_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attr_id` bigint NOT NULL COMMENT '属性ID，关联co_attr.id',
  `attr_group_id` bigint NOT NULL COMMENT '属性组ID，关联co_attr_group.id',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品属性组与属性关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attr_group_rel`
--


--
-- Table structure for table `co_attr_option`
--

DROP TABLE IF EXISTS `co_attr_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attr_option` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attr_id` bigint NOT NULL COMMENT '商品属性ID，关联co_attr.id',
  `value` varchar(64) NOT NULL DEFAULT '' COMMENT '属性值内容',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型：enums[COMMON,通用,1;EXCLUSIVE,商品特有,2]',
  `spu_id` bigint NOT NULL DEFAULT '0' COMMENT '关联co_spu.id',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_attr_id` (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706958881947168773 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性值选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attr_option`
--

INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924354,1523327014409134081,'4+128G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924355,1523327014409134081,'6+128G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924356,1523327014409134081,'8+128G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924357,1523327014409134081,'8+256G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673256038402,1523327266537136130,'月影黑',2,1566725672303931393,'2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673256038403,1523327266537136130,'星耀金',2,1566725672303931393,'2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192684740609,1566977806085730306,'灰色',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192751849473,1566977968443043842,'55英寸',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192818958337,1566981383629910018,'标准版',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192818958338,1566981383629910018,'影视会员版（内置两年影视会员权益）',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378073866241,1566977806085730306,'红',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378199695362,1566977806085730306,'',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378266804225,1566977806085730306,'蓝',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378593959938,1566977968443043842,'大',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379059527681,1566981383629910018,'维保',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499349749761,1566977968443043842,'大',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499416858626,1566977806085730306,'红',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499676905474,1566977806085730306,'蓝',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499739820034,1566981383629910018,'维保',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690210873346,1523327266537136130,'红',2,1585930689908883458,'2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706555641250254850,1706555434743697410,'10hz',1,0,'2023-09-26 14:25:46','2023-09-26 14:25:46',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706555641313169410,1706555434743697410,'20hz',1,0,'2023-09-26 14:25:46','2023-09-26 14:25:46',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706555641313169411,1706555434743697410,'30hz',1,0,'2023-09-26 14:25:46','2023-09-26 14:25:46',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706856325849874435,1566977806085730306,'蓝色',2,1566986790461059073,'2023-09-27 10:20:35','2023-09-27 10:20:35',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706862433872162818,1706862433809248258,'WIFI2',1,0,'2023-09-27 10:44:51','2023-09-27 10:44:51',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706862433935077377,1706862433809248258,'WIFI3',1,0,'2023-09-27 10:44:51','2023-09-27 10:44:51',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810600742913,1706862433809248258,'WIFI6',2,1566986790461059073,'2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958003538276355,1706958003538276354,'官方标配',1,0,'2023-09-27 17:04:36','2023-09-27 17:04:36',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958003596996609,1706958003538276354,'无线充版本',1,0,'2023-09-27 17:04:36','2023-09-27 17:04:36',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733570,1706958257767624705,'墨羽',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733571,1706958257767624705,'晴雪',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733572,1706958257767624705,'素皮晴蓝',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733573,1706958257767624705,'幽芒',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881884254210,1706957820544987138,'12GB+256GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881884254211,1706957820544987138,'12GB+512GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881947168770,1706957820544987138,'16GB+512GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881947168771,1706957820544987138,'16GB+256GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `co_attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881947168772,1706957820544987138,'16GB+1TB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);

--
-- Table structure for table `co_attr_spu`
--

DROP TABLE IF EXISTS `co_attr_spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attr_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attr_id` bigint NOT NULL COMMENT '商品属性ID，关联co_attr.id',
  `spu_id` bigint NOT NULL COMMENT 'SPU ID，关联co_spu.id',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spu_id_attr_id` (`spu_id`,`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='SPU特有的商品属性选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attr_spu`
--


--
-- Table structure for table `co_attr_template`
--

DROP TABLE IF EXISTS `co_attr_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_attr_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `spec_count` int NOT NULL DEFAULT '0' COMMENT '规格数量',
  `param_count` int NOT NULL DEFAULT '0' COMMENT '参数数量',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706955247188488194 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_attr_template`
--

INSERT INTO `co_attr_template` (`id`, `name`, `spec_count`, `param_count`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523326644605739010,'手机',0,0,'2022-05-08 23:39:09','2022-05-08 23:39:09',1,1,0);
INSERT INTO `co_attr_template` (`id`, `name`, `spec_count`, `param_count`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566977536152907778,'电视',0,0,'2022-09-06 10:32:12','2022-09-06 10:32:12',1,1,0);
INSERT INTO `co_attr_template` (`id`, `name`, `spec_count`, `param_count`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1584897537135702018,'衣服',0,0,'2022-10-25 21:19:53','2022-10-25 21:19:53',1,1,0);
INSERT INTO `co_attr_template` (`id`, `name`, `spec_count`, `param_count`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706955247188488193,'小米手机',0,0,'2023-09-27 16:53:39','2023-09-27 16:53:39',1,1,0);

--
-- Table structure for table `co_brand`
--

DROP TABLE IF EXISTS `co_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `image_url` varchar(1000) DEFAULT '' COMMENT '品牌图片地址',
  `letter` char(1) DEFAULT '' COMMENT '品牌的首字母',
  `sort` int DEFAULT NULL COMMENT '排序',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1583373803992973314 DEFAULT CHARSET=utf8mb3 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_brand`
--

INSERT INTO `co_brand` (`id`, `name`, `image_url`, `letter`, `sort`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523326203994103809,'小米','http://minio.ark-dev.svc:9000/default/微信截图_20220814215021.png','m',NULL,'2023-09-20 17:35:26','2022-05-08 23:37:24',1,1,0);
INSERT INTO `co_brand` (`id`, `name`, `image_url`, `letter`, `sort`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1583373803992973313,'Apple','','A',NULL,'2022-10-21 16:25:07','2022-10-21 16:25:07',1,1,0);

--
-- Table structure for table `co_category`
--

DROP TABLE IF EXISTS `co_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '编码',
  `commodity_count` int NOT NULL DEFAULT '0' COMMENT '商品数量',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 enums[NO,否,0;YES,是,1]',
  `is_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否导航 enums[NO,否,0;YES,是,1]',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '上级ID',
  `level_path` varchar(128) NOT NULL DEFAULT '' COMMENT '分类级别路径，例如：0.1.2 代表该分类是三级分类，上级路由的id是1,再上级的路由id是0',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类级别',
  `attr_template_id` bigint NOT NULL DEFAULT '0' COMMENT '属性模板ID',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1706253410848288771 DEFAULT CHARSET=utf8mb3 COMMENT='商品类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_category`
--

INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566616161236848642,'手机','dcjj4yng',0,1,0,0,0,'1566616161236848642.',1,1706955247188488193,'2023-09-27 17:07:08','2022-09-05 10:36:14',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566616909194498050,'电视','1566616909194498050',0,1,1,0,0,'1566616909194498050.',1,1566977536152907778,'2022-09-06 18:08:06','2022-09-05 10:39:12',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617791772528642,'平板','1566617791772528642',0,1,1,0,0,'1566617791772528642.',1,0,'2022-09-05 10:42:43','2022-09-05 10:42:43',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617816187572226,'出行','1566617816187572226',0,1,1,0,0,'1566617816187572226.',1,0,'2022-09-05 10:42:48','2022-09-05 10:42:48',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617878892417026,'耳机','1566617878892417026',0,1,1,0,0,'1566617878892417026.',1,0,'2022-09-05 10:43:03','2022-09-05 10:43:03',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617904418951170,'音箱','1566617904418951170',0,1,1,0,0,'1566617904418951170.',1,0,'2022-09-05 10:43:09','2022-09-05 10:43:09',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617940947144706,'家电','1566617940947144706',0,1,1,0,0,'1566617940947144706.',1,0,'2022-09-05 10:43:18','2022-09-05 10:43:18',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617958626136065,'智能','1566617958626136065',0,1,1,0,0,'1566617958626136065.',1,0,'2022-09-05 10:43:22','2022-09-05 10:43:22',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566617988292448257,'路由器','1566617988292448257',0,1,1,0,0,'1566617988292448257.',1,0,'2022-09-05 10:43:29','2022-09-05 10:43:29',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566618018348830722,'电源','1566618018348830722',0,1,1,0,0,'1566618018348830722.',1,0,'2022-09-05 10:43:37','2022-09-05 10:43:37',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566618035247681538,'配件','1566618035247681538',0,1,1,0,0,'1566618035247681538.',1,0,'2022-09-05 10:43:41','2022-09-05 10:43:41',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706246313708433409,'洗衣机','rnp36ty3',0,0,1,0,0,'1706246313708433409.',1,1566977536152907778,'2023-09-25 17:56:36','2023-09-25 17:56:36',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706253366002790402,'电脑鼠标','svmer7bd',0,0,1,0,0,'1706253366002790402.',1,1566977536152907778,'2023-09-25 18:24:38','2023-09-25 18:24:38',1,1,0);
INSERT INTO `co_category` (`id`, `name`, `code`, `commodity_count`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706253410848288770,'雷蛇','y474wpxy',0,0,0,0,1706253366002790402,'1706253366002790402.1706253410848288770.',2,1584897537135702018,'2023-09-25 18:24:48','2023-09-25 18:24:48',1,1,0);

--
-- Table structure for table `co_category_brand_rel`
--

DROP TABLE IF EXISTS `co_category_brand_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_category_brand_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int NOT NULL COMMENT '分类ID',
  `brand_id` int NOT NULL COMMENT '品牌ID',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_category_id_brand_id` (`category_id`,`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='分类品牌关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_category_brand_rel`
--


--
-- Table structure for table `co_sku`
--

DROP TABLE IF EXISTS `co_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint NOT NULL COMMENT 'spuId，关联co_spu.id',
  `spu_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称（冗余）',
  `code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU编码',
  `main_picture` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU主图',
  `sales_price` int NOT NULL DEFAULT '0' COMMENT '销售价（单位：分）',
  `cost_price` int NOT NULL DEFAULT '0' COMMENT '成本价（单位：分）',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存',
  `warn_stock` int NOT NULL DEFAULT '0' COMMENT '预警库存',
  `spec_data` varchar(512) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '销售参数JSON',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_spu_id` (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706962860873658376 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='sku';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_sku`
--

INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484740943874,1523329483184857089,'Redmi Note11 5G','XM00101','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"4+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485051322370,1523329483184857089,'Redmi Note11 5G','XM00102','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"6+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485298786306,1523329483184857089,'Redmi Note11 5G','XM00103','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485550444545,1523329483184857089,'Redmi Note11 5G','XM00104','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+256G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485793714178,1523329483184857089,'Redmi Note11 5G','XM00105','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"4+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486095704065,1523329483184857089,'Redmi Note11 5G','XM00106','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"6+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486397693953,1523329483184857089,'Redmi Note11 5G','XM00107','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486682906625,1523329483184857089,'Redmi Note11 5G','XM00108','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+256G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486989090817,1523329483184857089,'Redmi Note11 5G','XM00109','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"4+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487282692097,1523329483184857089,'Redmi Note11 5G','XM00110','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"6+128G\"}]','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487555321858,1523329483184857089,'Redmi Note11 5G','XM00111','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+128G\"}]','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487836340225,1523329483184857089,'Redmi Note11 5G','XM00112','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+256G\"}]','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673578999809,1566725672303931393,'Xiaomi MIX Fold 2','XMF000001','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"4+128G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673973264386,1566725672303931393,'Xiaomi MIX Fold 2','XMF000002','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"6+128G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674350751746,1566725672303931393,'Xiaomi MIX Fold 2','XMF000003','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+128G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674648547330,1566725672303931393,'Xiaomi MIX Fold 2','XMF000004','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',1199900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+256G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674921177089,1566725672303931393,'Xiaomi MIX Fold 2','XMF000005','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"4+128G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675256721409,1566725672303931393,'Xiaomi MIX Fold 2','XMF000006','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"6+128G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675617431553,1566725672303931393,'Xiaomi MIX Fold 2','XMF000007','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+128G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675810369537,1566725672303931393,'Xiaomi MIX Fold 2','XMF000008','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',1199900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+256G\"}]','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379193745410,1585908375347568641,'红米1.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',999900,0,0,0,'[{},{},{}]','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379655118849,1585908375347568641,'红米1.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',0,0,0,0,'[{},{},{}]','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499802734593,1585928498976456706,'红米3.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',99900,9900,99,9,'[{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"大\"},{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"维保\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"红\"}]','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500264108033,1585928498976456706,'红米3.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',0,0,0,0,'[{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"大\"},{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"维保\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝\"}]','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690277982210,1585930689908883458,'红米4.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',99900,9900,99,9,'[{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"4+128G\"},{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"红\"}]','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690613526530,1585930689908883458,'红米4.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',88800,0,0,0,'[{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"6+128G\"},{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"红\"}]','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810655268866,1566986790461059073,'小米电视6至尊版 55英寸','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI2\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810655268867,1566986790461059073,'小米电视6至尊版 55英寸','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI2\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794818,1566986790461059073,'小米电视6至尊版 55英寸','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI3\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794819,1566986790461059073,'小米电视6至尊版 55英寸','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI3\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794820,1566986790461059073,'小米电视6至尊版 55英寸','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI6\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794821,1566986790461059073,'小米电视6至尊版 55英寸','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI6\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860424867846,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860424867847,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860487782401,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860487782402,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860487782403,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860487782404,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860550696962,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860550696963,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860550696964,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860550696965,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860613611521,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860613611522,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860613611523,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860613611524,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860613611525,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860613611526,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860680720385,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860680720386,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860680720387,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860680720388,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860680720389,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860680720390,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860743634945,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860743634946,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860743634947,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860743634948,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743809,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743810,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743811,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743812,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743813,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743814,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860810743815,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658369,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658370,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658371,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658372,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658373,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658374,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);
INSERT INTO `co_sku` (`id`, `spu_id`, `spu_name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `spec_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860873658375,1706962859971883009,'Redmi K60','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',229900,100000,999,100,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"幽芒\"}]','2023-12-14 14:45:42','2023-09-27 17:23:55',1,1,0);

--
-- Table structure for table `co_sku_attr`
--

DROP TABLE IF EXISTS `co_sku_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_sku_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sku_id` bigint NOT NULL COMMENT 'skuId，关联co_sku.id',
  `attr_value` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1585930690743549954 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='sku规格属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_sku_attr`
--

INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484896133122,1523329484740943874,'神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484896133123,1523329484740943874,'4+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485151985665,1523329485051322370,'神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485151985666,1523329485051322370,'6+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485399449602,1523329485298786306,'神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485403643905,1523329485298786306,'8+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485646913538,1523329485550444545,'神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485646913539,1523329485550444545,'8+256G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485885988866,1523329485793714178,'微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485898571777,1523329485793714178,'4+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486234116098,1523329486095704065,'微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486246699010,1523329486095704065,'6+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486519328769,1523329486397693953,'微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486527717377,1523329486397693953,'8+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486804541441,1523329486682906625,'微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486808735746,1523329486682906625,'8+256G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487119114242,1523329486989090817,'浅梦星河','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487127502850,1523329486989090817,'4+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487383355394,1523329487282692097,'浅梦星河','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487395938306,1523329487282692097,'6+128G','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487693733889,1523329487555321858,'浅梦星河','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487693733890,1523329487555321858,'8+128G','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487928614913,1523329487836340225,'浅梦星河','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487937003521,1523329487836340225,'8+256G','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673843240962,1566725673578999809,'月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673843240963,1566725673578999809,'4+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674099093506,1566725673973264386,'月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674170396674,1566725673973264386,'6+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674476580866,1566725674350751746,'月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674476580867,1566725674350751746,'8+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674728239105,1566725674648547330,'月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674728239106,1566725674648547330,'8+256G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674988285953,1566725674921177089,'星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674988285954,1566725674921177089,'4+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675365773314,1566725675256721409,'星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675365773315,1566725675256721409,'6+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675680346114,1566725675617431553,'星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675680346115,1566725675617431553,'8+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725676007501825,1566725675810369537,'星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725676007501826,1566725675810369537,'8+256G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379323768834,1585908379193745410,'','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379390877698,1585908379193745410,'','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379525095426,1585908379193745410,'','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379722227714,1585908379655118849,'','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379785142273,1585908379655118849,'','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379919360002,1585908379655118849,'','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499869843457,1585928499802734593,'大','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499936952321,1585928499802734593,'维保','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499999866882,1585928499802734593,'红','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500264108034,1585928500264108033,'大','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500331216898,1585928500264108033,'维保','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500398325762,1585928500264108033,'蓝','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690412199938,1585930690277982210,'4+128G','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690479308801,1585930690277982210,'红','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690676441089,1585930690613526530,'6+128G','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_sku_attr` (`id`, `sku_id`, `attr_value`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690743549953,1585930690613526530,'红','2022-10-28 17:45:17','2022-10-28 17:45:17',1,1,0);

--
-- Table structure for table `co_spu`
--

DROP TABLE IF EXISTS `co_spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品介绍',
  `main_picture` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'spu主图url',
  `shelf_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上下架状态：enums[DOWN,下架,0;UP,上架,1]',
  `verify_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：enums[NO_CHECK,未审核,0;CHECK_PASS,审核通过,1;CHECK_NO_PASS,审核不通过,2]',
  `sales` int NOT NULL DEFAULT '0' COMMENT '销量',
  `show_price` int NOT NULL DEFAULT '0' COMMENT '默认展示价格（单位：分）',
  `unit` tinyint(1) DEFAULT '1' COMMENT '单位：enums[G,克,1;KG,千克,2]',
  `weight` int DEFAULT NULL COMMENT '商品重量，默认为克(g)',
  `brand_id` bigint NOT NULL COMMENT '品牌id，关联co_brand.id',
  `category_id` bigint NOT NULL COMMENT '分类id，关联co_category.id',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_brand_id` (`brand_id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706962859971883010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='spu主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_spu`
--

INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483184857089,'Redmi Note11 5G','XM001','','http://file.cloud.org:9000/default/5FFCQcW3yqvbo12iny1oNQ.jpeg',1,0,0,0,2,2,1523326203994103809,1523328341960876034,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672303931393,'Xiaomi MIX Fold 2','XM0000001','','http://file.cloud.org:9000/default/pms_1660187393.75797938.jpg',1,0,0,0,1,256,1523326203994103809,1566616161236848642,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566986790461059073,'小米电视6至尊版 55英寸','XM0000002','','http://file.cloud.org:9000/default/pms_1624606008.69672518.jpg',1,0,0,0,2,21,1523326203994103809,1566616909194498050,'2023-09-27 16:08:13','2022-09-06 11:08:59',1,1,0);
INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908375347568641,'红米1.0','MM9090','','',1,0,0,0,1,250,1523326203994103809,1566616161236848642,'2022-10-28 16:16:36','2022-10-28 16:16:36',1,1,0);
INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928498976456706,'红米3.0','MI3232','','',1,0,0,0,2,1,1523326203994103809,1566616909194498050,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930689908883458,'红米4.0','MI222333','','',1,0,0,0,2,1,1523326203994103809,1566616161236848642,'2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962859971883009,'Redmi K60','XM000123','超轻薄好手感，前置仿生双主摄，小米Civi3到手价2499起','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',1,0,0,229900,2,540,1523326203994103809,1566616161236848642,'2023-12-14 14:45:42','2023-09-27 17:23:54',1,1,0);

--
-- Table structure for table `co_spu_attr`
--

DROP TABLE IF EXISTS `co_spu_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_spu_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint NOT NULL COMMENT 'spuId，关联co_spu.id',
  `attr_value` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值（冗余）',
  `attr_id` bigint NOT NULL COMMENT '属性id',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_spu_id` (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1735189298358054914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='spu参数属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_spu_attr`
--

INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484208267266,1523329483184857089,'手机主机x1、电源适配器x1、插针x1、手机保护壳x1、说明书（含三包凭证）x1	',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484229238786,1523329483184857089,'小米(mi)',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484229238787,1523329483184857089,'Redmi Note11	',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484233433089,1523329483184857089,'2021年',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484233433090,1523329483184857089,'128GB',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484250210305,1523329483184857089,'6.6英寸',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484254404609,1523329483184857089,'1600万像素',0,'2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333314,1566725672303931393,'手机主机丨电源适配器丨USB Type-C 数据线丨Type-C to Audio 转接线|手机保护壳丨屏幕保护膜（出厂贴在手机上）丨卡针丨说明书（含三包凭证）',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333315,1566725672303931393,'小米',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333316,1566725672303931393,'小米 MIX Fold 2',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333317,1566725672303931393,'小米',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333318,1566725672303931393,'22061218C',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333319,1566725672303931393,'小米 MIX Fold 2',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333320,1566725672303931393,'512GB',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333321,1566725672303931393,'8.02英寸',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333322,1566725672303931393,'2000万像素',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333323,1566725672303931393,'WIFI',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333324,1566725672303931393,'WIFI',0,'2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810537828356,1566986790461059073,'支持蓝牙5.0',0,'2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986626,1706962859971883009,'是',1706956185395572737,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986627,1706962859971883009,'2022-12-27',1706956206258040833,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986628,1706962859971883009,'是',1706956249597784066,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986629,1706962859971883009,'23013RK75C',1706956274843299841,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095490,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095491,1706962859971883009,'204g',1706956857461485569,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095492,1706962859971883009,'不支持',1706956988785143809,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095493,1706962859971883009,'16GB',1706957062483259393,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095494,1706962859971883009,'120Hz',1706957109094559745,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095495,1706962859971883009,'30W',1706957149271797762,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095496,1706962859971883009,'Android',1706957196965228546,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095497,1706962859971883009,'支持5G',1706957244453138434,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670539010050,1706962859971883009,'Type-C',1706957285632815106,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670539010051,1706962859971883009,'1600万像素',1706957388594589698,'2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858151976962,1706962859971883009,'是',1706956185395572737,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858160365569,1706962859971883009,'2022-12-27',1706956206258040833,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858168754178,1706962859971883009,'是',1706956249597784066,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858172948481,1706962859971883009,'23013RK75C',1706956274843299841,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858177142786,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858198114306,1706962859971883009,'204g',1706956857461485569,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858219085826,1706962859971883009,'不支持',1706956988785143809,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858227474434,1706962859971883009,'16GB',1706957062483259393,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858231668738,1706962859971883009,'120Hz',1706957109094559745,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858240057345,1706962859971883009,'30W',1706957149271797762,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858248445954,1706962859971883009,'Android',1706957196965228546,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858261028865,1706962859971883009,'支持5G',1706957244453138434,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858265223170,1706962859971883009,'Type-C',1706957285632815106,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858269417474,1706962859971883009,'1600万像素',1706957388594589698,'2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589973475329,1706962859971883009,'是',1706956185395572737,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589981863937,1706962859971883009,'2022-12-27',1706956206258040833,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589986058241,1706962859971883009,'是',1706956249597784066,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589994446850,1706962859971883009,'23013RK75C',1706956274843299841,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589998641154,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590011224066,1706962859971883009,'204g',1706956857461485569,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590019612673,1706962859971883009,'不支持',1706956988785143809,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590028001281,1706962859971883009,'16GB',1706957062483259393,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590032195586,1706962859971883009,'120Hz',1706957109094559745,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590040584194,1706962859971883009,'30W',1706957149271797762,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590048972801,1706962859971883009,'Android',1706957196965228546,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590057361409,1706962859971883009,'支持5G',1706957244453138434,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590061555714,1706962859971883009,'Type-C',1706957285632815106,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590065750017,1706962859971883009,'1600万像素',1706957388594589698,'2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619204657154,1706962859971883009,'是',1706956185395572737,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619213045762,1706962859971883009,'2022-12-27',1706956206258040833,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619221434370,1706962859971883009,'是',1706956249597784066,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619225628673,1706962859971883009,'23013RK75C',1706956274843299841,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619234017282,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619238211585,1706962859971883009,'204g',1706956857461485569,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619242405889,1706962859971883009,'不支持',1706956988785143809,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619246600194,1706962859971883009,'16GB',1706957062483259393,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619250794497,1706962859971883009,'120Hz',1706957109094559745,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619259183105,1706962859971883009,'30W',1706957149271797762,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619263377410,1706962859971883009,'Android',1706957196965228546,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619267571714,1706962859971883009,'支持5G',1706957244453138434,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619271766018,1706962859971883009,'Type-C',1706957285632815106,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619275960322,1706962859971883009,'1600万像素',1706957388594589698,'2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124206583809,1706962859971883009,'是',1706956185395572737,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124214972418,1706962859971883009,'2022-12-27',1706956206258040833,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124223361026,1706962859971883009,'是',1706956249597784066,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124227555330,1706962859971883009,'23013RK75C',1706956274843299841,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124231749634,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124235943938,1706962859971883009,'204g',1706956857461485569,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124240138242,1706962859971883009,'不支持',1706956988785143809,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124244332545,1706962859971883009,'16GB',1706957062483259393,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124244332546,1706962859971883009,'120Hz',1706957109094559745,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124252721154,1706962859971883009,'30W',1706957149271797762,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124256915457,1706962859971883009,'Android',1706957196965228546,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124265304066,1706962859971883009,'支持5G',1706957244453138434,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124269498369,1706962859971883009,'Type-C',1706957285632815106,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124273692674,1706962859971883009,'1600万像素',1706957388594589698,'2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292001918977,1706962859971883009,'是',1706956185395572737,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292010307585,1706962859971883009,'2022-12-27',1706956206258040833,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292018696193,1706962859971883009,'是',1706956249597784066,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292027084802,1706962859971883009,'23013RK75C',1706956274843299841,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292035473410,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292039667713,1706962859971883009,'204g',1706956857461485569,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292043862018,1706962859971883009,'不支持',1706956988785143809,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292043862019,1706962859971883009,'16GB',1706957062483259393,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292043862020,1706962859971883009,'120Hz',1706957109094559745,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292052250625,1706962859971883009,'30W',1706957149271797762,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292052250626,1706962859971883009,'Android',1706957196965228546,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292052250627,1706962859971883009,'支持5G',1706957244453138434,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292060639233,1706962859971883009,'Type-C',1706957285632815106,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292060639234,1706962859971883009,'1600万像素',1706957388594589698,'2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298232225793,1706962859971883009,'是',1706956185395572737,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298244808706,1706962859971883009,'2022-12-27',1706956206258040833,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298265780226,1706962859971883009,'是',1706956249597784066,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298282557442,1706962859971883009,'23013RK75C',1706956274843299841,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298290946049,1706962859971883009,'小米 Redmi K60',1706956293210157057,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298299334658,1706962859971883009,'204g',1706956857461485569,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298311917569,1706962859971883009,'不支持',1706956988785143809,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298316111873,1706962859971883009,'16GB',1706957062483259393,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298320306177,1706962859971883009,'120Hz',1706957109094559745,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298324500482,1706962859971883009,'30W',1706957149271797762,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298328694786,1706962859971883009,'Android',1706957196965228546,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298341277698,1706962859971883009,'支持5G',1706957244453138434,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298353860609,1706962859971883009,'Type-C',1706957285632815106,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `co_spu_attr` (`id`, `spu_id`, `attr_value`, `attr_id`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298358054913,1706962859971883009,'1600万像素',1706957388594589698,'2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);

--
-- Table structure for table `co_spu_sales`
--

DROP TABLE IF EXISTS `co_spu_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_spu_sales` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint NOT NULL COMMENT 'spuId，关联co_spu.id',
  `freight_template_id` bigint NOT NULL DEFAULT '0' COMMENT '运费模版ID,关联freight_template.id',
  `pc_detail_html` text COLLATE utf8mb4_general_ci COMMENT 'PC端商品介绍富文本',
  `mobile_detail_html` text COLLATE utf8mb4_general_ci COMMENT '移动端商品介绍富文本',
  `param_data` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数属性JSON',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706962860164820995 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='spu销售属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_spu_sales`
--

INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483734310913,1523329483184857089,0,'<p>hello123</p>','','[{\"attrId\":\"1523327841215504386\",\"attrValue\":\"手机主机x1、电源适配器x1、插针x1、手机保护壳x1、说明书（含三包凭证）x1\\t\"},{\"attrId\":\"1523327922828271617\",\"attrValue\":\"小米(mi)\"},{\"attrId\":\"1523327948132507649\",\"attrValue\":\"Redmi Note11\\t\"},{\"attrId\":\"1523327992193671170\",\"attrValue\":\"2021年\"},{\"attrId\":\"1523328053954797569\",\"attrValue\":\"128GB\"},{\"attrId\":\"1523328096413736962\",\"attrValue\":\"6.6英寸\"},{\"attrId\":\"1523328146703441922\",\"attrValue\":\"1600万像素\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672366845954,1566725672303931393,0,'<p>hello</p>','','[{\"attrId\":\"1523327841215504386\",\"attrValue\":\"手机主机丨电源适配器丨USB Type-C 数据线丨Type-C to Audio 转接线|手机保护壳丨屏幕保护膜（出厂贴在手机上）丨卡针丨说明书（含三包凭证）\"},{\"attrId\":\"1523327922828271617\",\"attrValue\":\"小米\"},{\"attrId\":\"1523327948132507649\",\"attrValue\":\"小米 MIX Fold 2\"},{\"attrId\":\"1523327992193671170\",\"attrValue\":\"小米\"},{\"attrId\":\"1566623322197233666\",\"attrValue\":\"22061218C\"},{\"attrId\":\"1566623410889986050\",\"attrValue\":\"小米 MIX Fold 2\"},{\"attrId\":\"1523328053954797569\",\"attrValue\":\"512GB\"},{\"attrId\":\"1523328096413736962\",\"attrValue\":\"8.02英寸\"},{\"attrId\":\"1523328146703441922\",\"attrValue\":\"2000万像素\"},{\"attrId\":\"1566624103143084034\",\"attrValue\":\"WIFI\"},{\"attrId\":\"1566623458587611138\",\"attrValue\":\"WIFI\"}]','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1566986790653997057,1566986790461059073,0,'<p>hello</p>','','[{\"attrId\":\"1566985652697378818\",\"attrValue\":\"直下式\"},{\"attrId\":\"1566985744619745281\",\"attrValue\":\"120Hz\"},{\"attrId\":\"1566985820662476802\",\"attrValue\":\"Cortex A73 四核\"},{\"attrId\":\"1566985853843615745\",\"attrValue\":\"4.5GB\"},{\"attrId\":\"1566985899037241346\",\"attrValue\":\"2.4GHz、5GHz双频WiFi 6\"},{\"attrId\":\"1566985933401174017\",\"attrValue\":\"支持蓝牙5.0\"}]','2022-09-06 18:15:33','2022-09-06 11:08:59',1,1,0);
INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585908375754416130,1585908375347568641,0,'<p>hello</p>','','[]','2022-10-28 16:16:36','2022-10-28 16:16:36',1,1,0);
INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499081314305,1585928498976456706,0,'<p>hello</p>','','[]','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690022129666,1585930689908883458,0,'<p>hello</p>','','[]','2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `co_spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_detail_html`, `mobile_detail_html`, `param_data`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1706962860164820994,1706962859971883009,0,'<p>213123</p>','','[{\"attrId\":\"1706956185395572737\",\"attrValue\":\"是\"},{\"attrId\":\"1706956206258040833\",\"attrValue\":\"2022-12-27\"},{\"attrId\":\"1706956249597784066\",\"attrValue\":\"是\"},{\"attrId\":\"1706956274843299841\",\"attrValue\":\"23013RK75C\"},{\"attrId\":\"1706956293210157057\",\"attrValue\":\"小米 Redmi K60\"},{\"attrId\":\"1706956857461485569\",\"attrValue\":\"204g\"},{\"attrId\":\"1706956988785143809\",\"attrValue\":\"不支持\"},{\"attrId\":\"1706957062483259393\",\"attrValue\":\"16GB\"},{\"attrId\":\"1706957109094559745\",\"attrValue\":\"120Hz\"},{\"attrId\":\"1706957149271797762\",\"attrValue\":\"30W\"},{\"attrId\":\"1706957196965228546\",\"attrValue\":\"Android\"},{\"attrId\":\"1706957244453138434\",\"attrValue\":\"支持5G\"},{\"attrId\":\"1706957285632815106\",\"attrValue\":\"Type-C\"},{\"attrId\":\"1706957388594589698\",\"attrValue\":\"1600万像素\"}]','2023-09-27 17:23:54','2023-09-27 17:23:54',1,1,0);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14 15:56:46
