-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: eop
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
-- Table structure for table `project_basic`
--

DROP TABLE IF EXISTS `project_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '工程名称',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '工程代码',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '工程介绍',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '工程类型 enums[BACKEND,后端应用,1 ;FRONTEND,前端应用,2]',
  `scaffold` tinyint(1) NOT NULL DEFAULT '1' COMMENT '脚手架 enums[SpringCloud,SpringCloud,1;]',
  `git_html_url` varchar(256) NOT NULL DEFAULT '' COMMENT 'Git主页地址',
  `git_https_url` varchar(256) NOT NULL DEFAULT '' COMMENT 'Git Clone HTTPS地址',
  `git_ssh_url` varchar(256) NOT NULL DEFAULT '' COMMENT 'Git Clone SSH地址',
  `ext_properties` varchar(1000) NOT NULL DEFAULT '' COMMENT '工程的独有属性JSON',
  `push_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '代码推送状态 enums[NOT_PUSH,未推送,0;SUCCESS,推送成功,1;FAIL,推送失败,2;]',
  `repos_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '仓库状态 enums[NOT_CREATE,未推送,0;SUCCESS,创建成功,1;FAIL,创建失败,2;]',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1561627012771151874 DEFAULT CHARSET=utf8mb4 COMMENT='工程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_basic`
--

/*!40000 ALTER TABLE `project_basic` DISABLE KEYS */;
INSERT INTO `project_basic` VALUES (55,'认证服务','kt-cloud-identity','认证服务',1,1,'https://github.com/javisChen/kt-cloud-identity','https://github.com/javisChen/kt-cloud-identity.git','git@github.com:javisChen/kt-cloud-identity.git','{\"artifactId\":\"kt-cloud-identity\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.identity\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 11:35:52','2022-02-24 11:35:52',0,0,0),(58,'商品服务','kt-cloud-commodity','商品服务',1,1,'https://github.com/javisChen/kt-cloud-commodity','https://github.com/javisChen/kt-cloud-commodity.git','git@github.com:javisChen/kt-cloud-commodity.git','{\"artifactId\":\"kt-cloud-commodity\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.commodity\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 14:37:25','2022-02-24 14:37:25',0,0,0),(60,'支付服务','kt-cloud-payment','支付服务',1,1,'https://github.com/javisChen/kt-cloud-payment','https://github.com/javisChen/kt-cloud-payment.git','git@github.com:javisChen/kt-cloud-payment.git','{\"artifactId\":\"kt-cloud-payment\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.payment\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 14:44:14','2022-02-24 14:44:14',0,0,0),(61,'订单服务','kt-cloud-order','订单服务',1,1,'https://github.com/javisChen/kt-cloud-order','https://github.com/javisChen/kt-cloud-order.git','git@github.com:javisChen/kt-cloud-order.git','{\"artifactId\":\"kt-cloud-order\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.order\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 14:45:28','2022-02-24 14:45:28',0,0,0),(62,'IAM','kt-cloud-iam','IAM',1,1,'https://github.com/javisChen/kt-cloud-iam','https://github.com/javisChen/kt-cloud-iam.git','git@github.com:javisChen/kt-cloud-iam.git','{\"artifactId\":\"kt-cloud-iam\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.iam\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 14:45:28','2022-02-24 14:45:28',0,0,0),(63,'研发效能服务','kt-cloud-eop','研发效能服务',1,1,'https://github.com/javisChen/kt-cloud-eop','https://github.com/javisChen/kt-cloud-eop.git','git@github.com:javisChen/kt-cloud-eop.git','{\"artifactId\":\"kt-cloud-eop\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.eop\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 14:45:28','2022-02-24 14:45:28',0,0,0),(64,'支付服务','kt-cloud-order1','支付服务',1,1,'https://github.com/javisChen/kt-cloud-order1','https://github.com/javisChen/kt-cloud-order1.git','git@github.com:javisChen/kt-cloud-order1.git','{\"artifactId\":\"kt-cloud-order1\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.order1\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-24 18:28:22','2022-02-24 18:28:22',0,0,0),(1497488240521535490,'kt-cloud-message','kt-cloud-message','',1,1,'https://github.com/javisChen/kt-cloud-message','https://github.com/javisChen/kt-cloud-message.git','git@github.com:javisChen/kt-cloud-message.git','{\"artifactId\":\"kt-cloud-message\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.message\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":0}',1,2,'2022-02-26 16:26:33','2022-02-26 16:26:33',0,0,0),(1498154429400797186,'OSS服务','kt-cloud-oss','OSS服务',1,1,'https://github.com/javisChen/kt-cloud-oss','https://github.com/javisChen/kt-cloud-oss.git','git@github.com:javisChen/kt-cloud-oss.git','{\"artifactId\":\"kt-cloud-oss\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.oss\",\"dsUrl\":\"jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"kt_cloud8888\",\"dsPassword\":\"Kt.cloud1234!@#$\",\"genDAOCode\":false}',1,2,'2022-02-28 12:33:45','2022-02-28 12:33:45',0,0,0),(1556681149233545217,'中心服务-订单','kt-cloud-order','中心服务-订单',1,1,'https://github.com/javisChen/kt-cloud-order','https://github.com/javisChen/kt-cloud-order.git','git@github.com:javisChen/kt-cloud-order.git','{\"artifactId\":\"kt-cloud-order\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.order\",\"dsUrl\":\"jdbc:mysql://localhost:3306/cop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"root\",\"dsPassword\":\"Root1234!@#$\",\"genDAOCode\":0}',1,2,'2022-08-09 00:38:02','2022-08-09 00:38:02',1,1,0),(1557646128720130049,'中心服务-支付','kt-cloud-pay','中心服务-支付',1,1,'https://github.com/javisChen/kt-cloud-pay','https://github.com/javisChen/kt-cloud-pay.git','git@github.com:javisChen/kt-cloud-pay.git','{\"artifactId\":\"kt-cloud-pay\",\"groupId\":\"com.kt.cloud\",\"packageName\":\"com.kt.cloud.pay\",\"dsUrl\":\"jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"kt_cloud8888\",\"dsPassword\":\"Kt.cloud1234!@#$\",\"genDAOCode\":false}',1,2,'2022-08-11 16:32:31','2022-08-11 16:32:31',0,0,0),(1561618234877210625,'应用服务-商城','kt-app-shop','应用服务-商城',1,1,'https://github.com/javisChen/kt-app-shop','https://github.com/javisChen/kt-app-shop.git','git@github.com:javisChen/kt-app-shop.git','{\"artifactId\":\"kt-app-shop\",\"groupId\":\"com.kt.app.shop\",\"packageName\":\"com.kt.app.shop\",\"dsUrl\":\"jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"kt_cloud8888\",\"dsPassword\":\"Kt.cloud1234!@#$\",\"genDAOCode\":false}',1,2,'2022-08-22 15:36:15','2022-08-22 15:36:15',0,0,0),(1561627012771151873,'应用服务-商城','kt-app-shop2','应用服务-商城',1,1,'https://github.com/javisChen/kt-app-shop2','https://github.com/javisChen/kt-app-shop2.git','git@github.com:javisChen/kt-app-shop2.git','{\"artifactId\":\"kt-app-shop2\",\"groupId\":\"com.kt.app.shop2\",\"packageName\":\"com.kt.app.shop2\",\"dsUrl\":\"jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\",\"dsUsername\":\"kt_cloud8888\",\"dsPassword\":\"Kt.cloud1234!@#$\",\"genDAOCode\":false}',1,2,'2022-08-22 16:11:08','2022-08-22 16:11:08',0,0,0);
/*!40000 ALTER TABLE `project_basic` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:16:09
