-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: iam
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
-- Current Database: `iam`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `iam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `iam`;

--
-- Table structure for table `iam_api`
--

DROP TABLE IF EXISTS `iam_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_api` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `application_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'API名称',
  `uri` varchar(128) NOT NULL DEFAULT '' COMMENT '接口地址',
  `method` varchar(10) NOT NULL DEFAULT '' COMMENT 'Http Method 1-GET 2-POST 3-PUT 4-DELETE 5-PATCH',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-已启用；2-已禁用；',
  `category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'api分类id，关联api_category.id',
  `auth_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权',
  `has_path_variable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'url是否包含路径参数，例： /user/{userId}/api/{apiId} 0-不包含 1-包含',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_application_id_url_method` (`application_id`,`uri`,`method`),
  KEY `fk_upms_api_category_idx` (`category_id`),
  KEY `idx_application_id` (`application_id`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1701471524422688770 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='api表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_api`
--

INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,'/iam/v1/api/category','/iam/v1/api/category','PUT',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'/iam/v1/api/category','/iam/v1/api/category','DELETE',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'/iam/v1/api/categories','/iam/v1/api/categories','GET',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'/iam/v1/api/category','/iam/v1/api/category','POST',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'/iam/v1/api/init','/iam/v1/api/init','GET',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'/iam/v1/apis','/iam/v1/apis','POST',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'/iam/v1/api/test','/iam/v1/api/test','GET',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'/iam/v1/api','/iam/v1/api','POST',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'/iam/v1/api','/iam/v1/api','PUT',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (10,1,'/iam/v1/api/{id}','/iam/v1/api/{id}','DELETE',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (11,1,'/iam/v1/api/cache','/iam/v1/api/cache','PUT',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (12,1,'/iam/v1/applications','/iam/v1/applications','POST',1,4,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'/iam/v1/application','/iam/v1/application','POST',1,4,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'/iam/v1/application','/iam/v1/application','PUT',1,4,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'/iam/v1/auth/login','/iam/v1/auth/login','POST',1,0,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'/iam/v1/roles/all','/iam/v1/roles/all','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'/iam/v1/role/status','/iam/v1/role/status','PUT',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'/iam/v1/role','/iam/v1/role','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'/iam/v1/role/{id}','/iam/v1/role/{id}','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'/iam/v1/role','/iam/v1/role','PUT',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (21,1,'/iam/v1/roles','/iam/v1/roles','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'/iam/v1/role/permission/route','/iam/v1/role/permission/route','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'/iam/v1/role/permission/api','/iam/v1/role/permission/api','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'/iam/v1/role/permission/routes','/iam/v1/role/permission/routes','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'/iam/v1/role/permission/elements','/iam/v1/role/permission/elements','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'/iam/v1/role/permission/apis','/iam/v1/role/permission/apis','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'/iam/v1/route/status','/iam/v1/route/status','PUT',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'/iam/v1/route/parent','/iam/v1/route/parent','PUT',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'/iam/v1/route','/iam/v1/route','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'/iam/v1/route/{id}','/iam/v1/route/{id}','GET',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (31,1,'/iam/v1/route','/iam/v1/route','PUT',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'/iam/v1/routes/init','/iam/v1/routes/init','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (33,1,'/iam/v1/routes/all','/iam/v1/routes/all','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'/iam/v1/routes','/iam/v1/routes','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'/iam/v1/route/{id}','/iam/v1/route/{id}','DELETE',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'/iam/v1/route/{routeId}/elements','/iam/v1/route/{routeId}/elements','GET',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'/iam/v1/user','/iam/v1/user','POST',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'/iam/v1/user/self','/iam/v1/user/self','GET',1,1,2,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'/iam/v1/user','/iam/v1/user','PUT',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'/iam/v1/users','/iam/v1/users','POST',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (41,1,'/iam/v1/user/info','/iam/v1/user/details','GET',1,1,2,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'/iam/v1/user/self/routes','/iam/v1/user/self/routes','GET',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'/iam/v1/user/self/elements','/iam/v1/user/self/elements','GET',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'/iam/v1/usergroup/status','/iam/v1/usergroup/status','PUT',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'/iam/v1/usergroup','/iam/v1/usergroup','POST',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (46,1,'/iam/v1/usergroup','/iam/v1/usergroup','PUT',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (47,1,'/iam/v1/usergroups/all','/iam/v1/usergroups/all','GET',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (48,1,'/iam/v1/usergroups','/iam/v1/usergroups','POST',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (49,1,'/iam/v1/usergroups/tree','/iam/v1/usergroups/tree','POST',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331501293570,1,'查询用户组详情','/iam/v1/usergroup','GET',1,1701174623697727490,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122690,1,'删除用户组','/iam/v1/usergroup','DELETE',1,1701174623697727490,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122692,1,'更新路由','/iam/v1/route/update','PUT',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037250,1,'更新应用','/iam/v1/application/update','PUT',1,1701174623634812930,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037252,1,'查询API详情','/iam/v1/api','GET',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951813,1,'更新分类','/iam/v1/api/category/update','PUT',1,1701432390324854786,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060676,1,'编辑用户','/iam/v1/user/update','POST',1,1701174623718699010,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060678,1,'创建用户','/iam/v1/user/create','POST',1,1701174623718699010,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975236,1,'创建路由','/iam/v1/route/create','POST',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975238,1,'更新角色','/iam/v1/role/update','POST',1,1701174623676755970,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975240,1,'角色路由授权','/iam/v1/role/permission/grant','POST',1,1701431351114797058,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084099,1,'/v1/role/permission/application/api','/iam/v1/role/permission/application/api','POST',1,1701431351114797058,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084103,1,'创建角色','/iam/v1/role/create','POST',1,1701174623676755970,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998661,1,'创建应用','/iam/v1/application/create','POST',1,1701174623634812930,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998663,1,'同步API','/iam/v1/api/sync','POST',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913219,1,'启用/禁用','/iam/v1/api/enable','POST',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913221,1,'新建分类','/iam/v1/api/category/create','POST',1,1701432390324854786,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913223,1,'分页查询用户信息','/iam/v1/users','GET',1,1701174623718699010,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936644,1,'查询路由详情','/iam/v1/route','GET',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936646,1,'获取路由的页面元素','/iam/v1/route/elements','GET',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936648,1,'分页查询','/iam/v1/roles','GET',1,1701174623676755970,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045509,1,'角色详情','/iam/v1/role','GET',1,1701174623676755970,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960069,1,'用户管理（内部调用） - 查询单个用户','/iam/v1/inner/users','GET',1,1701431351198683138,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960071,1,'用户管理（内部调用） - 查询用户是否具备API访问权限','/iam/v1/inner/users/has-api-permission','GET',1,1701431351198683138,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068930,1,'用户管理（内部调用） - 查询用户拥有的API权限','/iam/v1/inner/users/api-permission','GET',1,1701431351198683138,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068932,1,'查询所有Api','/iam/v1/inner/apis','GET',1,1701431351215460354,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068934,1,'API列表（全量）','/iam/v1/apis','GET',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177795,1,'删除用户','/iam/v1/user/delete','DELETE',1,1701174623718699010,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177797,1,'删除路由','/iam/v1/route/delete','DELETE',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898050,1,'删除角色','/iam/v1/role/delete','DELETE',1,1701174623676755970,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701432390475849729,1,'删除分类','/iam/v1/api/category/delete','DELETE',1,1701432390324854786,3,0,'2023-09-12 11:07:48','2023-09-12 11:07:48',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523692879874,3,'SKU-扣减库存','/commodity/v1/sku/stock/reduce','POST',1,1701471523453804546,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523747405825,3,'SKU-列表查询','/commodity/v1/sku/list','POST',1,1701471523453804546,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523818708993,3,'修改商品','/commodity/v1/brand/update','POST',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523860652033,3,'查询商品分页列表','/commodity/v1/brand/page','POST',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523881623553,3,'新建商品','/commodity/v1/brand/create','POST',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523919372290,3,'修改商品属性','/commodity/v1/attr/update','POST',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523940343810,3,'编辑属性模板','/commodity/v1/attr/template/update','POST',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523965509633,3,'查询属性模板分页列表','/commodity/v1/attr/template/page','POST',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523982286850,3,'创建属性模板','/commodity/v1/attr/template/create','POST',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524003258370,3,'查询商品属性分页列表','/commodity/v1/attr/page','POST',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524020035585,3,'修改商品属性组','/commodity/v1/attr/group/update','POST',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524036812802,3,'查询商品属性组分页列表','/commodity/v1/attr/group/page','POST',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524061978626,3,'创建商品属性组','/commodity/v1/attr/group/create','POST',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524116504578,3,'创建商品属性','/commodity/v1/attr/create','POST',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524141670401,3,'修改商品','/commodity/v1/admin/commodity/update','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524175224833,3,'查询分页列表','/commodity/v1/admin/commodity/search','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524192002049,3,'查询分页列表','/commodity/v1/admin/commodity/page','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524204584962,3,'创建商品','/commodity/v1/admin/commodity/create','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524225556481,3,'修改商品类目','/commodity/v1/admin/category/update','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524246528001,3,'查询商品类目树形结构','/commodity/v1/admin/category/tree','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524263305217,3,'查询商品类目分页列表','/commodity/v1/admin/category/page','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524280082434,3,'创建商品类目','/commodity/v1/admin/category/create','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524301053954,3,'查询商品详情','/commodity/v1/brand/info','GET',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524317831170,3,'查询属性模板详情','/commodity/v1/attr/template/info','GET',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524338802690,3,'查询商品属性详情','/commodity/v1/attr/info','GET',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524355579905,3,'查询商品属性组详情','/commodity/v1/attr/group/info','GET',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524376551426,3,'查询详情','/commodity/v1/admin/commodity/info','GET',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524393328642,3,'查询商品类目详情','/commodity/v1/admin/category/info','GET',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524410105857,3,'删除商品属性','/commodity/v1/attr','DELETE',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524422688769,3,'删除类目（包括其下所有子分类）','/commodity/v1/admin/category','DELETE',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);

--
-- Table structure for table `iam_api_category`
--

DROP TABLE IF EXISTS `iam_api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_api_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `application_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'API分类名称',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_name_application_id` (`application_id`,`name`,`is_deleted`),
  KEY `idx_application_id` (`application_id`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1701471523634159619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Api分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_api_category`
--

INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,'用户管理','2021-01-26 13:56:54','2021-01-26 13:56:54',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'用户组管理','2021-01-26 13:56:58','2021-01-26 13:56:58',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'角色管理','2021-01-26 13:57:19','2021-01-26 13:57:19',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'应用管理','2021-01-26 13:57:24','2021-01-26 13:57:24',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'接口管理','2021-01-26 13:57:29','2021-01-26 13:57:29',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'路由管理','2021-01-26 13:57:36','2021-01-26 13:57:36',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (7,2,'订单管理','2021-01-26 14:41:03','2021-01-26 14:41:03',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'用户组管理','2021-01-26 14:41:17','2021-01-26 14:41:17',0,0,1);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'认证接口','2021-01-26 16:48:01','2021-01-26 16:48:01',0,0,1);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'认证管理','2021-01-27 11:00:34','2021-01-27 11:00:34',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701174623706116098,1,'API管理','2023-09-11 18:03:31','2023-09-11 18:03:31',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701174623727087617,1,'API类目管理','2023-09-11 18:03:31','2023-09-11 18:03:31',1,1,1701174623727087617);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924822900738,1,'role-permission-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924822900738);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924856455170,1,'user-self-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924856455170);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924873232386,1,'user-inner-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924873232386);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924885815298,1,'api-inner-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924885815298);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351114797058,1,'角色权限管理','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351181905921,1,'登录用户相关接口','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351198683138,1,'用户接口（内部调用）','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351215460354,1,'Api接口（内部调用）','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701432390324854786,1,'API分类','2023-09-12 11:07:48','2023-09-12 11:07:48',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523453804546,3,'sku-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523567050753,3,'brand-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523575439361,3,'attr-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523583827970,3,'attr-template-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523604799489,3,'attr-group-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523621576706,3,'commodity-admin-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523634159618,3,'category-admin-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);

--
-- Table structure for table `iam_application`
--

DROP TABLE IF EXISTS `iam_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_application` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编码',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-已上线；2-已下线；',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '应用类型 1-业务系统（前后端）2-纯后台服务',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`,`is_deleted`),
  UNIQUE KEY `uk_name` (`name`,`is_deleted`),
  KEY `uk_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_application`
--

INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (1,'IAM','permission',1,1,'2021-01-25 15:29:20','2021-01-25 15:29:20',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (2,'研发效能','eop',1,1,'2021-05-26 13:16:09','2021-05-26 13:16:09',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (3,'商品中心','commodity',1,1,'2022-02-25 13:57:08','2022-02-25 13:57:08',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (4,'订单中心','order',1,1,'2022-02-25 14:00:27','2022-02-25 14:00:27',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (5,'支付中心','payment',1,1,'2022-02-25 14:12:28','2022-02-25 14:12:28',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (6,'物流中心','logistics',1,1,'2022-02-25 14:13:15','2022-02-25 14:13:15',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (7,'搜索中心','search',1,1,'2022-02-25 14:13:37','2022-02-25 14:13:37',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (8,'消息中心','message',1,1,'2022-02-25 14:13:53','2022-02-25 14:13:53',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `gmt_modified`, `gmt_create`, `creator`, `modifier`, `is_deleted`) VALUES (9,'网关服务','gateway',1,1,'2022-02-25 14:14:46','2022-02-25 14:14:46',0,0,0);

--
-- Table structure for table `iam_element`
--

DROP TABLE IF EXISTS `iam_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_element` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` bigint unsigned NOT NULL COMMENT '所属菜单id，关联upms_menu.id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '元素名称',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '元素类型 1-按钮；2-层；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_is_deleted` (`is_deleted`),
  KEY `idx_route_id` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='页面元素表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_element`
--

INSERT INTO `iam_element` (`id`, `route_id`, `name`, `type`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1,76,'新增',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_element` (`id`, `route_id`, `name`, `type`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (2,76,'删除',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_element` (`id`, `route_id`, `name`, `type`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (3,76,'导出',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);

--
-- Table structure for table `iam_page_element`
--

DROP TABLE IF EXISTS `iam_page_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_page_element` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` bigint unsigned NOT NULL COMMENT '所属菜单id，关联upms_menu.id',
  `name` varchar(45) NOT NULL COMMENT '元素名称',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '元素类型 1-按钮；2-层；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_is_deleted` (`is_deleted`),
  KEY `idx_route_id` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='页面元素表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_page_element`
--

INSERT INTO `iam_page_element` (`id`, `route_id`, `name`, `type`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1,76,'新增',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_page_element` (`id`, `route_id`, `name`, `type`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (2,76,'删除',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_page_element` (`id`, `route_id`, `name`, `type`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (3,76,'导出',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);

--
-- Table structure for table `iam_permission`
--

DROP TABLE IF EXISTS `iam_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `application_id` bigint NOT NULL DEFAULT '1' COMMENT '应用id',
  `code` varchar(45) NOT NULL COMMENT '权限编码',
  `type` varchar(25) NOT NULL COMMENT '权限类型 FRONT_ROUTE-前端路由；PAGE_ELEMENT-页面元素；PAGE-页面；FILE-文件；SER_API-内部服务API；OPEN_API-开放API',
  `resource_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '资源id',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '权限状态 1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  UNIQUE KEY `uk_type_resource_id` (`type`,`resource_id`,`gmt_create`)
) ENGINE=InnoDB AUTO_INCREMENT=1701471524431077378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_permission`
--

INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,'FR00001','FRONT_ROUTE',1,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'FR00002','FRONT_ROUTE',2,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'FR00003','FRONT_ROUTE',3,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'FR00004','FRONT_ROUTE',4,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'FR00005','FRONT_ROUTE',5,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'FR00006','FRONT_ROUTE',6,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'FR00007','FRONT_ROUTE',7,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'FR00008','FRONT_ROUTE',8,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'FR00009','FRONT_ROUTE',9,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (10,1,'FR00010','FRONT_ROUTE',10,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (11,1,'FR00011','FRONT_ROUTE',11,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (12,1,'FR00012','FRONT_ROUTE',12,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'FR00013','FRONT_ROUTE',13,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'FR00014','FRONT_ROUTE',14,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'FR00015','FRONT_ROUTE',15,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'FR00016','FRONT_ROUTE',16,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'FR00017','FRONT_ROUTE',17,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'FR00018','FRONT_ROUTE',18,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'FR00019','FRONT_ROUTE',19,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'FR00020','FRONT_ROUTE',20,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (21,1,'FR00021','FRONT_ROUTE',21,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'FR00022','FRONT_ROUTE',22,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'FR00023','FRONT_ROUTE',23,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'FR00024','FRONT_ROUTE',24,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'FR00025','FRONT_ROUTE',25,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'FR00026','FRONT_ROUTE',26,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'FR00027','FRONT_ROUTE',27,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'FR00028','FRONT_ROUTE',28,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'FR00029','FRONT_ROUTE',29,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'FR00030','FRONT_ROUTE',30,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (31,1,'FR00031','FRONT_ROUTE',31,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'FR00032','FRONT_ROUTE',32,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (33,1,'FR00033','FRONT_ROUTE',33,1,'2020-12-24 18:28:38','2020-12-24 18:28:38',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'FR00035','FRONT_ROUTE',35,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'FR00036','FRONT_ROUTE',36,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'FR00037','FRONT_ROUTE',37,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'FR00038','FRONT_ROUTE',38,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'FR00039','FRONT_ROUTE',39,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'FR00040','FRONT_ROUTE',40,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'FR00041','FRONT_ROUTE',41,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (41,1,'FR00042','FRONT_ROUTE',42,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'FR00043','FRONT_ROUTE',43,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'FR00044','FRONT_ROUTE',44,1,'2020-12-25 17:41:40','2020-12-25 17:41:40',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'FR00045','FRONT_ROUTE',45,1,'2020-12-25 17:41:45','2020-12-25 17:41:45',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'FR00046','FRONT_ROUTE',46,1,'2020-12-29 14:52:49','2020-12-29 14:52:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (46,1,'FR00047','FRONT_ROUTE',47,1,'2020-12-29 15:51:28','2020-12-29 15:51:28',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (47,1,'FR00048','FRONT_ROUTE',48,1,'2020-12-29 15:52:58','2020-12-29 15:52:58',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (48,1,'FR00049','FRONT_ROUTE',49,1,'2020-12-29 16:34:36','2020-12-29 16:34:36',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (49,1,'FR00050','FRONT_ROUTE',50,1,'2020-12-29 16:58:00','2020-12-29 16:58:00',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (50,1,'FR00051','FRONT_ROUTE',51,1,'2020-12-29 16:58:45','2020-12-29 16:58:45',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (51,1,'FR00052','FRONT_ROUTE',52,1,'2020-12-29 17:01:27','2020-12-29 17:01:27',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (52,1,'FR00053','FRONT_ROUTE',53,1,'2020-12-29 17:01:31','2020-12-29 17:01:31',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (53,1,'FR00054','FRONT_ROUTE',54,1,'2020-12-29 17:05:29','2020-12-29 17:05:29',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (54,1,'FR00055','FRONT_ROUTE',55,1,'2020-12-29 17:05:41','2020-12-29 17:05:41',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (55,1,'FR00056','FRONT_ROUTE',56,1,'2020-12-29 17:05:50','2020-12-29 17:05:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (56,1,'FR00057','FRONT_ROUTE',57,1,'2020-12-29 17:17:56','2020-12-29 17:17:56',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (57,1,'FR00058','FRONT_ROUTE',58,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (58,1,'FR00059','FRONT_ROUTE',59,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (59,1,'FR00060','FRONT_ROUTE',60,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (60,1,'FR00061','FRONT_ROUTE',61,1,'2020-12-29 17:36:25','2020-12-29 17:36:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (61,1,'FR00062','FRONT_ROUTE',62,1,'2020-12-29 17:36:40','2020-12-29 17:36:40',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (62,1,'FR00063','FRONT_ROUTE',63,1,'2020-12-29 17:36:49','2020-12-29 17:36:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (63,1,'FR00064','FRONT_ROUTE',64,1,'2020-12-29 18:11:17','2020-12-29 18:11:17',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (64,1,'FR00065','FRONT_ROUTE',65,1,'2020-12-29 18:11:57','2020-12-29 18:11:57',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (65,1,'FR00066','FRONT_ROUTE',66,1,'2020-12-29 18:30:10','2020-12-29 18:30:10',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (66,1,'FR00067','FRONT_ROUTE',67,1,'2020-12-30 16:37:49','2020-12-30 16:37:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (67,1,'FR00068','FRONT_ROUTE',68,1,'2020-12-30 16:40:51','2020-12-30 16:40:51',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (68,1,'FR00069','FRONT_ROUTE',69,1,'2020-12-30 17:00:20','2020-12-30 17:00:20',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (69,1,'FR00070','FRONT_ROUTE',70,1,'2020-12-30 17:00:33','2020-12-30 17:00:33',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (70,1,'FR00071','FRONT_ROUTE',71,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (71,1,'FR00072','FRONT_ROUTE',72,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (72,1,'FR00073','FRONT_ROUTE',73,1,'2021-01-04 22:57:11','2021-01-04 22:57:11',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (73,1,'FR00074','FRONT_ROUTE',74,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (74,1,'FR00075','FRONT_ROUTE',75,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (75,1,'FR00076','FRONT_ROUTE',76,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (76,1,'FR00034','FRONT_ROUTE',34,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (77,1,'IA00001','SER_API',1,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (78,1,'IA00002','SER_API',2,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (79,1,'IA00003','SER_API',3,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (80,1,'IA00004','SER_API',4,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (81,1,'IA00005','SER_API',5,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (82,1,'IA00006','SER_API',6,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (83,1,'IA00007','SER_API',7,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (84,1,'IA00008','SER_API',8,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (85,1,'IA00009','SER_API',9,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (86,1,'IA00010','SER_API',10,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (87,1,'IA00011','SER_API',11,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (88,1,'IA00012','SER_API',12,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (89,1,'IA00013','SER_API',13,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (90,1,'IA00014','SER_API',14,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (91,1,'IA00015','SER_API',15,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (92,1,'IA00016','SER_API',16,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (93,1,'IA00017','SER_API',17,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (94,1,'IA00018','SER_API',18,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (95,1,'IA00019','SER_API',19,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (96,1,'IA00020','SER_API',20,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (97,1,'IA00021','SER_API',21,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (98,1,'IA00022','SER_API',22,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (99,1,'IA00023','SER_API',23,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (100,1,'IA00024','SER_API',24,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (101,1,'IA00025','SER_API',25,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (102,1,'IA00026','SER_API',26,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (103,1,'IA00027','SER_API',27,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (104,1,'IA00028','SER_API',28,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (105,1,'IA00029','SER_API',29,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (106,1,'IA00030','SER_API',30,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (107,1,'IA00031','SER_API',31,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (108,1,'IA00032','SER_API',32,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (109,1,'IA00033','SER_API',33,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (110,1,'IA00034','SER_API',34,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (111,1,'IA00035','SER_API',35,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (112,1,'IA00036','SER_API',36,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (113,1,'IA00037','SER_API',37,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (114,1,'IA00038','SER_API',38,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (115,1,'IA00039','SER_API',39,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (116,1,'IA00040','SER_API',40,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (117,1,'IA00041','SER_API',41,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (118,1,'IA00042','SER_API',42,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (119,1,'IA00043','SER_API',43,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (120,1,'IA00044','SER_API',44,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (121,1,'IA00045','SER_API',45,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (122,1,'IA00046','SER_API',46,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (123,1,'IA00047','SER_API',47,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (124,1,'IA00048','SER_API',48,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (125,1,'IA00049','SER_API',49,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (126,1,'FR000000077','FRONT_ROUTE',77,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (127,1,'FR000000078','FRONT_ROUTE',78,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (128,1,'PE000000001','PAGE_ELEMENT',1,1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (129,1,'PE000000002','PAGE_ELEMENT',2,1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (130,1,'PE000000003','PAGE_ELEMENT',3,1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501071146942779393,1,'FR1501071145118257154','FRONT_ROUTE',1501071145118257154,1,'2022-03-08 13:43:45','2022-03-08 13:43:45',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501090429122985986,1,'FR1501090428636446722','FRONT_ROUTE',1501090428636446722,1,'2022-03-08 15:00:22','2022-03-08 15:00:22',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501091483138998273,1,'FR1501091482874757122','FRONT_ROUTE',1501091482874757122,1,'2022-03-08 15:04:33','2022-03-08 15:04:33',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501099263551946754,1,'FR1501099262847303682','FRONT_ROUTE',1501099262847303682,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1507770691097538561,1,'FR1507770690745217026','FRONT_ROUTE',1507770690745217026,1,'2022-03-27 01:25:20','2022-03-27 01:25:20',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1514538324815577089,1,'FR1514538324329037825','FRONT_ROUTE',1514538324329037825,1,'2022-04-14 17:37:30','2022-04-14 17:37:30',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1514907534288326657,1,'FR1514907533453660161','FRONT_ROUTE',1514907533453660161,1,'2022-04-15 18:04:36','2022-04-15 18:04:36',0,0,1);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515191968020099074,1,'FR1515191685995098114','FRONT_ROUTE',1515191685995098114,1,'2022-04-16 12:54:53','2022-04-16 12:54:53',1,1,1);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515193279763509250,1,'FR1515193173177856002','FRONT_ROUTE',1515193173177856002,1,'2022-04-16 13:00:03','2022-04-16 13:00:03',1,1,1);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515894903171252225,1,'FR1515894902969925634','FRONT_ROUTE',1515894902969925634,1,'2022-04-18 11:28:04','2022-04-18 11:28:04',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515899373326237697,1,'FR1515899373154271234','FRONT_ROUTE',1515899373154271234,1,'2022-04-18 11:45:49','2022-04-18 11:45:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1557399233712144386,1,'FR1557399233418543106','FRONT_ROUTE',1557399233418543106,1,'2022-08-11 00:11:27','2022-08-11 00:11:27',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1557401007294562306,1,'FR1557401007147761665','FRONT_ROUTE',1557401007147761665,1,'2022-08-11 00:18:30','2022-08-11 00:18:30',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1626224210581757954,1,'FR1626224210330099714','FRONT_ROUTE',1626224210330099714,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331564208129,1,'IA1701421331501293570','SER_API',1701421331501293570,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331564208131,1,'IA1701421331564208130','SER_API',1701421331564208130,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331564208133,1,'IA1701421331564208132','SER_API',1701421331564208132,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122691,1,'IA1701421331627122690','SER_API',1701421331627122690,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122693,1,'IA1701421331627122692','SER_API',1701421331627122692,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122695,1,'IA1701421331627122694','SER_API',1701421331627122694,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037249,1,'IA1701421331627122696','SER_API',1701421331627122696,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037251,1,'IA1701421331690037250','SER_API',1701421331690037250,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037253,1,'IA1701421331690037252','SER_API',1701421331690037252,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951810,1,'IA1701421331690037254','SER_API',1701421331690037254,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951812,1,'IA1701421331752951811','SER_API',1701421331752951811,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951814,1,'IA1701421331752951813','SER_API',1701421331752951813,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951816,1,'IA1701421331752951815','SER_API',1701421331752951815,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060675,1,'IA1701421331820060674','SER_API',1701421331820060674,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060677,1,'IA1701421331820060676','SER_API',1701421331820060676,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060679,1,'IA1701421331820060678','SER_API',1701421331820060678,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975233,1,'IA1701421331820060680','SER_API',1701421331820060680,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975235,1,'IA1701421331882975234','SER_API',1701421331882975234,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975237,1,'IA1701421331882975236','SER_API',1701421331882975236,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975239,1,'IA1701421331882975238','SER_API',1701421331882975238,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084098,1,'IA1701421331882975240','SER_API',1701421331882975240,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084100,1,'IA1701421331950084099','SER_API',1701421331950084099,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084102,1,'IA1701421331950084101','SER_API',1701421331950084101,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998658,1,'IA1701421331950084103','SER_API',1701421331950084103,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998660,1,'IA1701421332012998659','SER_API',1701421332012998659,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998662,1,'IA1701421332012998661','SER_API',1701421332012998661,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913218,1,'IA1701421332012998663','SER_API',1701421332012998663,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913220,1,'IA1701421332075913219','SER_API',1701421332075913219,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913222,1,'IA1701421332075913221','SER_API',1701421332075913221,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913224,1,'IA1701421332075913223','SER_API',1701421332075913223,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022082,1,'IA1701421332143022081','SER_API',1701421332143022081,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022084,1,'IA1701421332143022083','SER_API',1701421332143022083,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022086,1,'IA1701421332143022085','SER_API',1701421332143022085,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022088,1,'IA1701421332143022087','SER_API',1701421332143022087,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936643,1,'IA1701421332205936642','SER_API',1701421332205936642,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936645,1,'IA1701421332205936644','SER_API',1701421332205936644,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936647,1,'IA1701421332205936646','SER_API',1701421332205936646,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045506,1,'IA1701421332205936648','SER_API',1701421332205936648,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045508,1,'IA1701421332273045507','SER_API',1701421332273045507,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045510,1,'IA1701421332273045509','SER_API',1701421332273045509,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045512,1,'IA1701421332273045511','SER_API',1701421332273045511,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960066,1,'IA1701421332335960065','SER_API',1701421332335960065,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960068,1,'IA1701421332335960067','SER_API',1701421332335960067,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960070,1,'IA1701421332335960069','SER_API',1701421332335960069,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068929,1,'IA1701421332335960071','SER_API',1701421332335960071,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068931,1,'IA1701421332403068930','SER_API',1701421332403068930,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068933,1,'IA1701421332403068932','SER_API',1701421332403068932,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068935,1,'IA1701421332403068934','SER_API',1701421332403068934,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177794,1,'IA1701421332470177793','SER_API',1701421332470177793,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177796,1,'IA1701421332470177795','SER_API',1701421332470177795,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177798,1,'IA1701421332470177797','SER_API',1701421332470177797,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898051,1,'IA1701421332528898050','SER_API',1701421332528898050,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898053,1,'IA1701421332528898052','SER_API',1701421332528898052,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898055,1,'IA1701421332528898054','SER_API',1701421332528898054,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701432390509404161,1,'IA1701432390475849729','SER_API',1701432390475849729,1,'2023-09-12 11:07:48','2023-09-12 11:07:48',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523722240002,1,'IA1701471523692879874','SER_API',1701471523692879874,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523759988738,1,'IA1701471523747405825','SER_API',1701471523747405825,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523839680513,1,'IA1701471523818708993','SER_API',1701471523818708993,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523873234945,1,'IA1701471523860652033','SER_API',1701471523860652033,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523906789378,1,'IA1701471523881623553','SER_API',1701471523881623553,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523931955202,1,'IA1701471523919372290','SER_API',1701471523919372290,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523952926722,1,'IA1701471523940343810','SER_API',1701471523940343810,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523973898242,1,'IA1701471523965509633','SER_API',1701471523965509633,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523994869762,1,'IA1701471523982286850','SER_API',1701471523982286850,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524011646978,1,'IA1701471524003258370','SER_API',1701471524003258370,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524032618498,1,'IA1701471524020035585','SER_API',1701471524020035585,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524045201409,1,'IA1701471524036812802','SER_API',1701471524036812802,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524099727361,1,'IA1701471524061978626','SER_API',1701471524061978626,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524129087489,1,'IA1701471524116504578','SER_API',1701471524116504578,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524162641921,1,'IA1701471524141670401','SER_API',1701471524141670401,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524183613441,1,'IA1701471524175224833','SER_API',1701471524175224833,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524196196353,1,'IA1701471524192002049','SER_API',1701471524192002049,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524212973569,1,'IA1701471524204584962','SER_API',1701471524204584962,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524238139393,1,'IA1701471524225556481','SER_API',1701471524225556481,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524254916610,1,'IA1701471524246528001','SER_API',1701471524246528001,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524271693825,1,'IA1701471524263305217','SER_API',1701471524263305217,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524292665345,1,'IA1701471524280082434','SER_API',1701471524280082434,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524309442561,1,'IA1701471524301053954','SER_API',1701471524301053954,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524326219777,1,'IA1701471524317831170','SER_API',1701471524317831170,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524347191298,1,'IA1701471524338802690','SER_API',1701471524338802690,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524368162817,1,'IA1701471524355579905','SER_API',1701471524355579905,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524384940034,1,'IA1701471524376551426','SER_API',1701471524376551426,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524401717250,1,'IA1701471524393328642','SER_API',1701471524393328642,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524418494465,1,'IA1701471524410105857','SER_API',1701471524410105857,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524431077377,1,'IA1701471524422688769','SER_API',1701471524422688769,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);

--
-- Table structure for table `iam_permission_role_rel`
--

DROP TABLE IF EXISTS `iam_permission_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_permission_role_rel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `permission_id` bigint unsigned NOT NULL COMMENT '权限id，关联upms_permission.id',
  `role_id` bigint unsigned NOT NULL COMMENT '角色id，关联upms_role.id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_role_id_permission_id` (`role_id`,`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_permission_role_rel`
--

INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (44,1,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (45,2,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (46,3,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (47,4,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (48,5,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (49,6,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (50,7,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (51,8,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (52,9,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (53,10,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (54,11,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (55,12,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (56,13,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (57,14,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (58,15,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (59,16,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (60,17,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (61,18,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (62,19,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (63,20,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (64,21,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (65,22,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (66,23,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (67,24,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (68,25,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (69,26,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (70,27,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (71,28,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (72,29,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (73,30,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (74,31,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (75,32,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (76,33,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (77,34,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (78,35,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (79,36,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (80,37,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (81,38,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (82,39,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (83,40,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (84,41,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (85,42,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (86,43,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (87,70,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (88,71,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (89,73,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (90,75,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (91,76,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (92,44,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (93,56,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (94,57,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (95,58,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (96,59,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (97,74,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (98,77,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (99,78,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (100,79,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (101,80,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (102,81,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (103,82,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (104,83,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (105,84,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (106,85,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (107,86,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (108,87,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (109,88,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (110,89,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (111,90,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (112,91,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (113,92,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (114,93,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (115,94,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (116,95,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (117,96,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (118,97,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (119,98,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (120,99,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (121,100,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (122,101,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (123,102,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (124,103,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (125,104,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (126,105,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (127,106,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (128,107,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (129,108,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (130,109,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (131,110,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (132,111,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (133,112,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (134,113,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (135,114,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (136,115,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (137,116,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (138,117,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (139,118,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (140,119,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (141,43,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (142,75,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (143,74,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (144,73,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (145,71,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (146,70,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (147,44,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (148,4,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (149,17,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (150,18,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (151,2,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (152,24,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (153,25,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (154,28,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (155,29,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (156,30,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (157,32,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (158,72,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (159,7,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (160,22,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (161,23,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);

--
-- Table structure for table `iam_role`
--

DROP TABLE IF EXISTS `iam_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(45) NOT NULL COMMENT '用户名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色编码',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '角色状态 1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 1-表示删除；0-表示未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_role`
--

INSERT INTO `iam_role` (`id`, `name`, `code`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1,'超级管理员','',1,'2021-01-21 10:37:00','2021-01-21 10:37:00',0,0,0);
INSERT INTO `iam_role` (`id`, `name`, `code`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (2,'后端','c9d4f55af376400285cb5fa21bf9aebc',1,'2022-02-21 17:31:21','2022-02-21 17:31:21',0,0,0);

--
-- Table structure for table `iam_route`
--

DROP TABLE IF EXISTS `iam_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_route` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `application_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(45) NOT NULL COMMENT '路由标题',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '路由编码',
  `component` varchar(64) NOT NULL DEFAULT '' COMMENT '组件名',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '父级路由id',
  `level_path` varchar(45) NOT NULL DEFAULT '' COMMENT '路由层级路径，例如：0.1.2 代表该菜单是三级路由，上级路由的id是1,再上级的路由id是0',
  `level` int NOT NULL COMMENT '路由层级',
  `path` varchar(64) NOT NULL DEFAULT '' COMMENT '路由path',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `hide_children` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏子路由 0-否 1-是',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '路由类型 1：菜单路由 2：页面路由 3: 隐藏页面路由',
  `sequence` int NOT NULL DEFAULT '0' COMMENT '排序序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限状态 1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_code` (`code`,`is_deleted`),
  UNIQUE KEY `uk_name` (`name`,`is_deleted`),
  KEY `fk_idx_system_id` (`application_id`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1626224210330099715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_route`
--

INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'个人页','account','RouteView',0,'2.',1,'','user',0,1,700,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'结果页','result','PageView',0,'3.',1,'','check-circle-o',0,1,500,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'详情页','profile','RouteView',0,'4.',1,'','profile',0,1,400,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'列表页','list','RouteView',0,'5.',1,'','table',0,1,300,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'仪表盘','dashboard','RouteView',0,'6.',1,'','dashboard',0,1,100,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'异常页','exception','RouteView',0,'7.',1,'','warning',0,1,600,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'工作台','workplace','Workplace',6,'6.8.',2,'/dashboard/workplace','',0,1,102,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'分析页','Analysis','Analysis',6,'6.9.',2,'/dashboard/analysis/:pageNo([1-9]\\\\d*)?','',0,1,101,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'查询表格','table-list','TableList',5,'5.13.',2,'/list/table-list/:pageNo([1-9]\\\\d*)?','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'标准列表','basic-list','StandardList',5,'5.14.',2,'/list/basic-list','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'卡片列表','card','CardList',5,'5.15.',2,'/list/card','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'搜索列表','search','SearchLayout',5,'5.16.',2,'/list/search','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'基础详情页','basic','ProfileBasic',4,'4.17.',2,'/profile/basic','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'高级详情页','advanced','ProfileAdvanced',4,'4.18.',2,'/profile/advanced','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'成功','success','ResultSuccess',3,'3.19.',2,'/result/success','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'失败','fail','ResultFail',3,'3.20.',2,'/result/fail','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'404','404','Exception404',7,'7.22.',2,'/exception/404','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'500','500','Exception500',7,'7.23.',2,'/exception/500','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'个人中心','center','AccountCenter',2,'2.24.',2,'/account/center','',0,2,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'个人设置','settings','AccountSettings',2,'2.25.',2,'/account/settings','',1,1,0,1,'2020-12-24 16:02:53','2021-01-04 22:56:19',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'搜索列表（项目）','project','SearchProjects',16,'5.16.26.',2,'/list/search/project','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'搜索列表（应用）','application','SearchApplications',16,'5.16.27.',2,'/list/search/application','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'基本设置','BasicSettings','BasicSettings',25,'2.25.28.',3,'/account/settings/basic','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'安全设置','SecuritySettings','SecuritySettings',25,'2.25.29.',3,'/account/settings/security','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'个性化设置','CustomSettings','CustomSettings',25,'2.25.30.',3,'/account/settings/custom','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'新消息通知','NotificationSettings','NotificationSettings',25,'2.25.32.',3,'/account/settings/notification','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'搜索列表（文章）','article','SearchArticles',16,'5.16.27.',3,'/list/search/article','',0,1,0,1,'2020-12-24 23:55:30','2020-12-24 23:55:30',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'其他组件','other','PageView',0,'35.',1,'','slack',0,1,800,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'IconSelector','TestIconSelect','EditList',35,'35.36.',2,'/other/icon-selector','tool',0,1,810,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'业务布局','bizLayout','RouteView',35,'35.37.',2,'','layout',0,1,820,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'树目录表格','TreeList','TreeList',37,'35.37.38.',3,'/other/list/tree-list','',0,1,821,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'内联编辑表格','EditList','EditList',37,'35.37.39.',3,'/other/list/edit-table','',0,1,822,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'权限列表','PermissionList','PermissionList',37,'35.37.40.',3,'/other/list/system-permission','',0,1,823,1,'2020-12-25 17:23:25','2021-01-04 22:54:33',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'角色列表','RoleList','RoleList',37,'35.37.42.',3,'/other/list/role-list','',0,1,825,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'角色列表2','SystemRole','SystemRole',37,'35.37.43.',3,'/other/list/system-role','',0,1,826,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'身份与访问','permission','RouteView',0,'44.',1,'/permission','slack',0,1,1,1,'2020-12-25 17:41:40','2021-01-02 22:57:31',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'路由管理','permission:route','PermissionRoute',44,'44.45.',2,'/permission/route','',0,2,910,1,'2020-12-25 17:41:45','2021-01-03 16:18:16',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (57,1,'表单页','form','RouteView',0,'57.',1,'','form',0,1,2,1,'2020-12-29 17:17:56','2021-01-03 16:29:31',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (58,1,'高级表单','advanced-form','AdvanceForm',57,'57.58.',2,'/form/advanced-form','',0,1,0,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (59,1,'分步表单','step-form','StepForm',57,'57.59.',2,'/form/step-form','',0,1,0,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (60,1,'基础表单','basic-form','BasicForm',57,'57.60.',2,'/form/base-form','',0,1,0,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (70,1,'测试子路由','3213','',69,'6.70.',2,'','',0,1,0,1,'2020-12-30 17:00:33','2020-12-30 17:00:44',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (71,1,'用户管理','permission:user','PermissionUser',44,'44.71.',2,'/permission/user','',0,2,0,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (72,1,'用户组管理','permission:usergroup','PermissionUserGroup',44,'44.72.',2,'/permission/usergroup','',0,2,0,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (73,1,'账号绑定','BindingSettings','BindingSettings',25,'2.25.73.',3,'/account/settings/binding','',0,1,0,1,'2021-01-04 22:57:11','2021-01-04 23:13:44',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (74,1,'角色管理','permission:role','PermissionRole',44,'44.74.',2,'/permission/role','',0,2,0,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (75,1,'应用管理','permission:application','PermissionApplication',44,'44.75.',2,'/permission/application','',0,2,0,1,'2021-01-21 10:28:58','2021-01-21 10:28:58',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (76,1,'接口管理','permission:interface','PermissionApi',44,'44.76.',2,'/permission/interface','',0,2,0,1,'2021-01-21 10:29:32','2021-01-21 10:29:32',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (77,2,'研发效能','cop','RouteView',0,'77.',1,'/cop','project',0,1,0,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (78,2,'代码工程','cop:code-project','CodeProject',77,'77.78.',2,'/cop/code-project','',0,1,0,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501071145118257154,3,'商品中心','product','RouteView',0,'1501071145118257154.',1,'','slack',0,1,0,1,'2022-03-08 13:43:44','2022-04-18 11:26:50',1,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501090428636446722,3,'商品分类','product:category','GoodsCategory',1501071145118257154,'1501071145118257154.1501090428636446722.',2,'/goods/category','',0,2,0,1,'2022-03-08 15:00:22','2022-03-08 15:34:58',1,1,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501091482874757122,3,'商品属性','product:attr:template','GoodsAttrTemplate',1501071145118257154,'1501071145118257154.1501091482874757122.',2,'/goods/attr/template','',0,2,0,1,'2022-03-08 15:04:33','2022-04-14 08:16:02',1,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1501099262847303682,3,'商品品牌','product:brand','GoodsBrand',1501071145118257154,'1501071145118257154.1501099262847303682.',2,'/goods/brand','',0,2,0,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1507770690745217026,3,'商品属性组','product:attr:group','GoodsAttrGroup',1501071145118257154,'1501071145118257154.1507770690745217026.',2,'/goods/attr/group','',0,3,0,1,'2022-03-27 01:25:20','2022-04-14 07:46:08',1,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1514538324329037825,3,'商品规格属性','product:attr','GoodsAttr',1501071145118257154,'1501071145118257154.1514538324329037825.',2,'/goods/attr','',0,3,0,1,'2022-04-14 17:37:30','2022-04-14 17:40:59',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1514907533453660161,3,'132','123','BasicLayout',0,'1514907533453660161.',1,'123','',0,1,0,1,'2022-04-15 18:04:36','2022-04-15 18:04:36',0,0,1514907533453660161);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515191685995098114,3,'1','1','404',0,'1515191685995098114.',1,'1','1',0,1,0,1,'2022-04-16 12:54:46','2022-04-16 12:54:50',1,1,1515191685995098114);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515193173177856002,3,'123','31','404',0,'1515193173177856002.',1,'','',0,1,0,1,'2022-04-16 12:59:38','2022-04-16 13:00:03',1,1,1515193173177856002);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515894902969925634,3,'商品管理','goods','Goods',1501071145118257154,'1501071145118257154.1515894902969925634.',2,'/goods','',0,2,0,1,'2022-04-18 11:28:03','2022-04-18 11:32:47',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1515899373154271234,3,'商品编辑表单','goodsForm','GoodsForm',1501071145118257154,'1501071145118257154.1515899373154271234.',2,'/goods/form','',0,3,0,1,'2022-04-18 11:45:49','2022-04-18 11:52:31',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1557399233418543106,4,'订单中心','order','RouteView',0,'1557399233418543106.',1,'/order','slack',0,1,0,1,'2022-08-11 00:11:27','2022-08-11 00:12:02',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1557401007147761665,4,'订单管理','order:list','Order',1557399233418543106,'1557399233418543106.1557401007147761665.',2,'/order/list','slack',0,2,0,1,'2022-08-11 00:18:30','2022-08-11 00:25:26',0,0,0);
INSERT INTO `iam_route` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1626224210330099714,4,'订单详情','order:detail','OrderDetail',1557399233418543106,'1557399233418543106.1626224210330099714.',2,'/order/:id','',0,2,0,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);

--
-- Table structure for table `iam_user`
--

DROP TABLE IF EXISTS `iam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL COMMENT '用户名',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `code` varchar(45) NOT NULL DEFAULT '' COMMENT '用户编码',
  `password` varchar(64) NOT NULL COMMENT '用户密码',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户状态：1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`,`is_deleted`),
  UNIQUE KEY `uk_mobile` (`mobile`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user`
--

INSERT INTO `iam_user` (`id`, `username`, `mobile`, `code`, `password`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (1,'Admin','Admin','SuperAdmin','$2a$10$Za0yx5PAGKZIviKfDwP7uuWVjCPu2DswMDqAkv93H7Ia0FO6XlbKK',1,'2021-01-21 10:40:47','2021-12-20 22:41:27',0,0,0);
INSERT INTO `iam_user` (`id`, `username`, `mobile`, `code`, `password`, `status`, `gmt_create`, `gmt_modified`, `creator`, `modifier`, `is_deleted`) VALUES (2,'Javis','18588686715','e5584ab9cda147c3956fe1b6af85f448','$2a$10$.VsAKjkii.rQMrs/k0YQMOjhyLPfAB3xvokULboT5kJtKZR8q7k7C',1,'2022-02-16 18:32:24','2022-02-21 18:00:54',0,0,0);

--
-- Table structure for table `iam_user_group`
--

DROP TABLE IF EXISTS `iam_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_user_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父用户组id，关联id',
  `name` varchar(45) NOT NULL COMMENT '用户组名称',
  `level` int unsigned NOT NULL DEFAULT '1' COMMENT '用户组层级',
  `level_path` varchar(45) NOT NULL DEFAULT '' COMMENT '部门层级',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户组类型 1-公司 2-部门',
  `inherit_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '继承类型 0-不继承 1-继承上级用户组 2-继承所有用户组',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户组状态：1-已启用；2-已禁用；',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `idx_is_deleted` (`is_deleted`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_group`
--


--
-- Table structure for table `iam_user_group_role_rel`
--

DROP TABLE IF EXISTS `iam_user_group_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_user_group_role_rel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_group_id` bigint unsigned NOT NULL COMMENT '用户组id，关联upms_user_group.id',
  `role_id` bigint unsigned NOT NULL DEFAULT '1' COMMENT '角色id，关联upms_role.id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_group_id_role_id` (`user_group_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户组与角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_group_role_rel`
--


--
-- Table structure for table `iam_user_group_user_rel`
--

DROP TABLE IF EXISTS `iam_user_group_user_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_user_group_user_rel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_group_id` bigint unsigned NOT NULL COMMENT '用户组名称，关联upms_user_group.id',
  `user_id` bigint unsigned NOT NULL DEFAULT '1' COMMENT '用户id，关联upms_user_id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_group_id_user_id` (`user_group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户组与用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_group_user_rel`
--


--
-- Table structure for table `iam_user_role_rel`
--

DROP TABLE IF EXISTS `iam_user_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_user_role_rel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` bigint unsigned NOT NULL COMMENT '用户id，关联upms_role.id',
  `role_id` bigint unsigned NOT NULL COMMENT '角色id，关联upms_role.id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_role_rel`
--

INSERT INTO `iam_user_role_rel` (`id`, `user_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (1,1,1,'2021-01-21 10:40:47','2021-01-21 10:40:47',0,0);
INSERT INTO `iam_user_role_rel` (`id`, `user_id`, `role_id`, `gmt_create`, `gmt_modified`, `creator`, `modifier`) VALUES (2,2,2,'2022-02-21 18:00:54','2022-02-21 18:00:54',0,0);

--
-- Current Database: `product`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `product`;

--
-- Table structure for table `attr`
--

DROP TABLE IF EXISTS `attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性名称',
  `input_type` int NOT NULL DEFAULT '1' COMMENT '属性录入方式，enums[INPUT,手工录入,1;SELECT,从选项列表选取,2]',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '属性的类型，enums[SPEC,规格,1;PARAM,参数,2]',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `attr_template_id` bigint NOT NULL COMMENT '模板ID，关联co_attr_template.id',
  `attr_group_id` bigint NOT NULL DEFAULT '0' COMMENT '属性组ID，关联co_attr_group.id',
  `can_manual_add` int NOT NULL DEFAULT '0' COMMENT '是否支持手动新增，enums[NO,不支持,0;YES,支持,1]',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_attr_template_id` (`attr_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706958257767624706 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr`
--

INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327014409134081,'版本',2,1,0,1523326644605739010,0,0,'2022-09-05 16:12:06','2022-05-08 23:40:37',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327266537136130,'颜色',1,1,0,1523326644605739010,1584900871586369537,0,'2022-09-05 16:12:24','2022-05-08 23:41:37',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327841215504386,'包装清单',1,2,0,1523326644605739010,1523327481444884481,0,'2022-05-08 23:43:54','2022-05-08 23:43:54',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327922828271617,'品牌',1,2,0,1523326644605739010,1523327513929768961,0,'2022-05-08 23:44:14','2022-05-08 23:44:14',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327948132507649,'型号',1,2,0,1523326644605739010,1523327513929768961,0,'2022-05-08 23:44:20','2022-05-08 23:44:20',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327992193671170,'上市公司',1,2,0,1523326644605739010,1523327513929768961,0,'2022-05-08 23:44:30','2022-05-08 23:44:30',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523328053954797569,'机身内存',1,2,0,1523326644605739010,1523327550231470081,0,'2022-05-08 23:44:45','2022-05-08 23:44:45',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523328096413736962,'屏幕尺寸',1,2,0,1523326644605739010,1523327568535412738,0,'2022-05-08 23:44:55','2022-05-08 23:44:55',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523328146703441922,'前摄像头',1,2,0,1523326644605739010,1523327588366082049,0,'2022-05-08 23:45:07','2022-05-08 23:45:07',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566623322197233666,'认证型号',1,2,0,1523326644605739010,1523327513929768961,0,'2022-09-05 11:04:41','2022-09-05 11:04:41',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566623410889986050,'型号',1,2,0,1523326644605739010,1523327513929768961,0,'2022-09-05 11:05:02','2022-09-05 11:05:02',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566623458587611138,'网络连接',1,2,0,1523326644605739010,1523327513929768961,0,'2022-09-05 11:05:14','2022-09-05 11:05:14',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566623642553978881,'产品尺寸',1,2,0,1523326644605739010,1566620683606724610,0,'2022-09-05 11:05:58','2022-09-05 11:05:58',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566623988290457601,'屏幕类型',1,2,0,1523326644605739010,1566620726115995650,0,'2022-09-05 11:07:20','2022-09-05 11:07:20',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566624103143084034,'连接方式',1,2,0,1523326644605739010,1566620782399361025,0,'2022-09-05 11:07:47','2022-09-05 11:07:47',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566977806085730306,'颜色',1,1,0,1566977536152907778,0,0,'2022-09-06 10:33:17','2022-09-06 10:33:17',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566977968443043842,'尺寸',1,1,0,1566977536152907778,0,0,'2022-09-06 10:33:55','2022-09-06 10:33:55',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566981383629910018,'套装',1,1,0,1566977536152907778,0,0,'2022-09-06 10:47:30','2022-09-06 10:47:30',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985521315000322,'分辨率',1,2,0,1566977536152907778,0,0,'2022-09-06 11:03:56','2022-09-06 11:03:56',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985652697378818,' 背光',1,2,0,1566977536152907778,1566982019503173634,0,'2022-09-06 11:04:27','2022-09-06 11:04:27',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985744619745281,'刷新率',1,2,0,1566977536152907778,1566982019503173634,0,'2022-09-06 11:04:49','2022-09-06 11:04:49',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985820662476802,'CPU',1,2,0,1566977536152907778,1566982066806534146,0,'2022-09-06 11:05:07','2022-09-06 11:05:07',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985853843615745,'内存',1,2,0,1566977536152907778,1566982066806534146,0,'2022-09-06 11:05:15','2022-09-06 11:05:15',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985899037241346,'WIFI',1,2,0,1566977536152907778,1566982137874821121,0,'2022-09-06 11:05:26','2022-09-06 11:05:26',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566985933401174017,'蓝牙',1,2,0,1566977536152907778,1566982137874821121,0,'2022-09-06 11:05:34','2022-09-06 11:05:34',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1584905278361272321,'布料',1,2,0,1584897537135702018,1584900871586369537,0,'2022-10-25 21:50:39','2022-10-25 21:50:39',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706555434743697410,'频率',2,1,0,1523326644605739010,1523327691671789570,1,'2023-09-26 14:25:46','2023-09-26 14:24:57',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706862433809248258,'网络',2,1,0,1566977536152907778,0,1,'2023-09-27 10:44:51','2023-09-27 10:44:51',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956185395572737,'CCC强制性认证',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:58:02','2023-09-27 16:57:23',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956206258040833,'上市日期',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:03','2023-09-27 16:57:28',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956249597784066,'电信设备进网许可证',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:07','2023-09-27 16:57:38',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956274843299841,'入网型号',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:10','2023-09-27 16:57:44',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956293210157057,'机型',1,2,0,1706955247188488193,1706955722642206722,0,'2023-09-27 16:59:13','2023-09-27 16:57:49',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956857461485569,'机身重量',1,2,0,1706955247188488193,1706955869916803073,0,'2023-09-27 17:00:03','2023-09-27 17:00:03',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956909655404546,'机身颜色',1,2,0,1706955247188488193,0,0,'2023-09-27 17:00:16','2023-09-27 17:00:16',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956934162722817,'机身尺寸',1,2,0,1706955247188488193,0,0,'2023-09-27 17:00:21','2023-09-27 17:00:21',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956988785143809,'存储卡',1,2,0,1706955247188488193,1706955889235767298,0,'2023-09-27 17:00:35','2023-09-27 17:00:35',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957062483259393,'运行内存',1,2,0,1706955247188488193,1706955889235767298,0,'2023-09-27 17:00:52','2023-09-27 17:00:52',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957109094559745,'屏幕刷新率',1,2,0,1706955247188488193,1706955907288051713,0,'2023-09-27 17:01:03','2023-09-27 17:01:03',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957149271797762,'无线充电',1,2,0,1706955247188488193,1706955935696072705,0,'2023-09-27 17:01:13','2023-09-27 17:01:13',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957196965228546,'系统',1,2,0,1706955247188488193,1706955957661642754,0,'2023-09-27 17:01:24','2023-09-27 17:01:24',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957244453138434,'5G网络',1,2,0,1706955247188488193,1706956002666524673,0,'2023-09-27 17:01:35','2023-09-27 17:01:35',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957285632815106,'充电接口',1,2,0,1706955247188488193,1706956023357026305,0,'2023-09-27 17:01:45','2023-09-27 17:01:45',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957388594589698,'前摄主像素',1,2,0,1706955247188488193,1706956058803089409,0,'2023-09-27 17:02:10','2023-09-27 17:02:10',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706957820544987138,'版本',2,1,0,1706955247188488193,0,0,'2023-09-27 17:08:06','2023-09-27 17:03:53',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958003538276354,'购买方式',2,1,0,1706955247188488193,0,0,'2023-09-27 17:04:36','2023-09-27 17:04:36',1,1,0);
INSERT INTO `attr` (`id`, `name`, `input_type`, `type`, `sort`, `attr_template_id`, `attr_group_id`, `can_manual_add`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257767624705,'颜色',2,1,0,1706955247188488193,0,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);

--
-- Table structure for table `attr_group`
--

DROP TABLE IF EXISTS `attr_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性分组名称',
  `attr_template_id` bigint NOT NULL COMMENT '模板ID，关联co_attr_template.id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_attr_template_id` (`attr_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706956058803089410 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_group`
--

INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327481444884481,'包装清单',1523326644605739010,'2022-05-08 23:42:28','2022-05-08 23:42:28',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327513929768961,'主体',1523326644605739010,'2022-05-08 23:42:36','2022-05-08 23:42:36',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327550231470081,'存储',1523326644605739010,'2022-05-08 23:42:45','2022-05-08 23:42:45',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327568535412738,'屏幕',1523326644605739010,'2022-05-08 23:42:49','2022-05-08 23:42:49',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327588366082049,'拍照',1523326644605739010,'2022-05-08 23:42:54','2022-05-08 23:42:54',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327654241820673,'基本信息',1523326644605739010,'2022-05-08 23:43:09','2022-05-08 23:43:09',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327669475532802,'系统',1523326644605739010,'2022-05-08 23:43:13','2022-05-08 23:43:13',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523327691671789570,'CPU',1523326644605739010,'2022-05-08 23:43:18','2022-05-08 23:43:18',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566620683606724610,'规格',1523326644605739010,'2022-09-05 10:54:12','2022-09-05 10:54:12',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566620726115995650,'显示',1523326644605739010,'2022-09-05 10:54:22','2022-09-05 10:54:22',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566620752770797570,'功能',1523326644605739010,'2022-09-05 10:54:29','2022-09-05 10:54:29',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566620782399361025,'连接',1523326644605739010,'2022-09-05 10:54:36','2022-09-05 10:54:36',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566982019503173634,'显示参数',1566977536152907778,'2022-09-06 10:50:01','2022-09-06 10:50:01',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566982066806534146,'处理器和存储',1566977536152907778,'2022-09-06 10:50:13','2022-09-06 10:50:13',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566982137874821121,'无线配置',1566977536152907778,'2022-09-06 10:50:29','2022-09-06 10:50:29',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1584900871586369537,'材质',1584897537135702018,'2022-10-25 21:33:08','2022-10-25 21:33:08',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955722642206722,'主体',1706955247188488193,'2023-09-27 16:55:33','2023-09-27 16:55:33',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955869916803073,'基本信息',1706955247188488193,'2023-09-27 16:56:08','2023-09-27 16:56:08',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955889235767298,'存储',1706955247188488193,'2023-09-27 16:56:12','2023-09-27 16:56:12',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955907288051713,'屏幕',1706955247188488193,'2023-09-27 16:56:17','2023-09-27 16:56:17',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955935696072705,'电池信息',1706955247188488193,'2023-09-27 16:56:23','2023-09-27 16:56:23',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955957661642754,'操作系统',1706955247188488193,'2023-09-27 16:56:29','2023-09-27 16:56:29',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956002666524673,'网络支持',1706955247188488193,'2023-09-27 16:56:39','2023-09-27 16:56:39',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956023357026305,'数据接口',1706955247188488193,'2023-09-27 16:56:44','2023-09-27 16:56:44',1,1,0);
INSERT INTO `attr_group` (`id`, `name`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706956058803089409,'摄像头',1706955247188488193,'2023-09-27 16:56:53','2023-09-27 16:56:53',1,1,0);

--
-- Table structure for table `attr_group_rel`
--

DROP TABLE IF EXISTS `attr_group_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr_group_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attr_id` bigint NOT NULL COMMENT '属性ID，关联co_attr.id',
  `attr_group_id` bigint NOT NULL COMMENT '属性组ID，关联co_attr_group.id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品属性组与属性关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_group_rel`
--


--
-- Table structure for table `attr_option`
--

DROP TABLE IF EXISTS `attr_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr_option` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attr_id` bigint NOT NULL COMMENT '商品属性ID，关联co_attr.id',
  `value` varchar(64) NOT NULL DEFAULT '' COMMENT '属性值内容',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型：enums[COMMON,通用,1;EXCLUSIVE,商品特有,2]',
  `spu_id` bigint NOT NULL DEFAULT '0' COMMENT '关联co_spu.id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_attr_id` (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706958881947168773 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性值选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_option`
--

INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924354,1523327014409134081,'4+128G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924355,1523327014409134081,'6+128G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924356,1523327014409134081,'8+128G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566700684653924357,1523327014409134081,'8+256G',1,0,'2022-09-05 16:12:06','2022-09-05 16:12:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673256038402,1523327266537136130,'月影黑',2,1566725672303931393,'2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673256038403,1523327266537136130,'星耀金',2,1566725672303931393,'2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192684740609,1566977806085730306,'灰色',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192751849473,1566977968443043842,'55英寸',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192818958337,1566981383629910018,'标准版',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1567093192818958338,1566981383629910018,'影视会员版（内置两年影视会员权益）',2,1566986790461059073,'2022-09-06 18:11:47','2022-09-06 18:11:47',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378073866241,1566977806085730306,'红',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378199695362,1566977806085730306,'',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378266804225,1566977806085730306,'蓝',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908378593959938,1566977968443043842,'大',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379059527681,1566981383629910018,'维保',2,1585908375347568641,'2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499349749761,1566977968443043842,'大',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499416858626,1566977806085730306,'红',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499676905474,1566977806085730306,'蓝',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499739820034,1566981383629910018,'维保',2,1585928498976456706,'2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690210873346,1523327266537136130,'红',2,1585930689908883458,'2022-10-28 17:45:16','2022-10-28 17:45:16',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706555641250254850,1706555434743697410,'10hz',1,0,'2023-09-26 14:25:46','2023-09-26 14:25:46',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706555641313169410,1706555434743697410,'20hz',1,0,'2023-09-26 14:25:46','2023-09-26 14:25:46',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706555641313169411,1706555434743697410,'30hz',1,0,'2023-09-26 14:25:46','2023-09-26 14:25:46',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706856325849874435,1566977806085730306,'蓝色',2,1566986790461059073,'2023-09-27 10:20:35','2023-09-27 10:20:35',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706862433872162818,1706862433809248258,'WIFI2',1,0,'2023-09-27 10:44:51','2023-09-27 10:44:51',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706862433935077377,1706862433809248258,'WIFI3',1,0,'2023-09-27 10:44:51','2023-09-27 10:44:51',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810600742913,1706862433809248258,'WIFI6',2,1566986790461059073,'2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958003538276355,1706958003538276354,'官方标配',1,0,'2023-09-27 17:04:36','2023-09-27 17:04:36',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958003596996609,1706958003538276354,'无线充版本',1,0,'2023-09-27 17:04:36','2023-09-27 17:04:36',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733570,1706958257767624705,'墨羽',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733571,1706958257767624705,'晴雪',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733572,1706958257767624705,'素皮晴蓝',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958257834733573,1706958257767624705,'幽芒',1,0,'2023-09-27 17:05:37','2023-09-27 17:05:37',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881884254210,1706957820544987138,'12GB+256GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881884254211,1706957820544987138,'12GB+512GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881947168770,1706957820544987138,'16GB+512GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881947168771,1706957820544987138,'16GB+256GB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);
INSERT INTO `attr_option` (`id`, `attr_id`, `value`, `type`, `spu_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706958881947168772,1706957820544987138,'16GB+1TB',1,0,'2023-09-27 17:08:06','2023-09-27 17:08:06',1,1,0);

--
-- Table structure for table `attr_spu`
--

DROP TABLE IF EXISTS `attr_spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attr_id` bigint NOT NULL COMMENT '商品属性ID，关联co_attr.id',
  `spu_id` bigint NOT NULL COMMENT 'SPU ID，关联co_spu.id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spu_id_attr_id` (`spu_id`,`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='SPU特有的商品属性选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_spu`
--


--
-- Table structure for table `attr_template`
--

DROP TABLE IF EXISTS `attr_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `spec_count` int NOT NULL DEFAULT '0' COMMENT '规格数量',
  `param_count` int NOT NULL DEFAULT '0' COMMENT '参数数量',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706955247188488194 DEFAULT CHARSET=utf8mb3 COMMENT='商品属性模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_template`
--

INSERT INTO `attr_template` (`id`, `name`, `spec_count`, `param_count`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523326644605739010,'手机',0,0,'2022-05-08 23:39:09','2022-05-08 23:39:09',1,1,0);
INSERT INTO `attr_template` (`id`, `name`, `spec_count`, `param_count`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566977536152907778,'电视',0,0,'2022-09-06 10:32:12','2022-09-06 10:32:12',1,1,0);
INSERT INTO `attr_template` (`id`, `name`, `spec_count`, `param_count`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1584897537135702018,'衣服',0,0,'2022-10-25 21:19:53','2022-10-25 21:19:53',1,1,0);
INSERT INTO `attr_template` (`id`, `name`, `spec_count`, `param_count`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706955247188488193,'小米手机',0,0,'2023-09-27 16:53:39','2023-09-27 16:53:39',1,1,0);

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `image_url` varchar(1000) DEFAULT '' COMMENT '品牌图片地址',
  `letter` char(1) DEFAULT '' COMMENT '品牌的首字母',
  `sort` int DEFAULT NULL COMMENT '排序',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1583373803992973314 DEFAULT CHARSET=utf8mb3 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `image_url`, `letter`, `sort`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523326203994103809,'小米','http://minio.ark-dev.svc:9000/default/微信截图_20220814215021.png','m',NULL,'2023-09-20 17:35:26','2022-05-08 23:37:24',1,1,0);
INSERT INTO `brand` (`id`, `name`, `image_url`, `letter`, `sort`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1583373803992973313,'Apple','','A',NULL,'2022-10-21 16:25:07','2022-10-21 16:25:07',1,1,0);

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '编码',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 enums[NO,否,0;YES,是,1]',
  `is_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否导航 enums[NO,否,0;YES,是,1]',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '上级ID',
  `level_path` varchar(128) NOT NULL DEFAULT '' COMMENT '分类级别路径，例如：0.1.2 代表该分类是三级分类，上级路由的id是1,再上级的路由id是0',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类级别',
  `attr_template_id` bigint NOT NULL DEFAULT '0' COMMENT '属性模板ID',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1706253410848288771 DEFAULT CHARSET=utf8mb3 COMMENT='商品类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566616161236848642,'手机','dcjj4yng',1,0,0,0,'1566616161236848642.',1,1706955247188488193,'2023-09-27 17:07:08','2022-09-05 10:36:14',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566616909194498050,'电视','1566616909194498050',1,1,0,0,'1566616909194498050.',1,1566977536152907778,'2022-09-06 18:08:06','2022-09-05 10:39:12',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566617878892417026,'耳机','1566617878892417026',1,1,0,0,'1566617878892417026.',1,0,'2022-09-05 10:43:03','2022-09-05 10:43:03',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566617904418951170,'音箱','1566617904418951170',1,1,0,0,'1566617904418951170.',1,0,'2022-09-05 10:43:09','2022-09-05 10:43:09',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566617940947144706,'家电','1566617940947144706',1,1,0,0,'1566617940947144706.',1,0,'2022-09-05 10:43:18','2022-09-05 10:43:18',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566617958626136065,'智能','1566617958626136065',1,1,0,0,'1566617958626136065.',1,0,'2022-09-05 10:43:22','2022-09-05 10:43:22',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566617988292448257,'路由器','1566617988292448257',1,1,0,0,'1566617988292448257.',1,0,'2022-09-05 10:43:29','2022-09-05 10:43:29',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566618018348830722,'电源','1566618018348830722',1,1,0,0,'1566618018348830722.',1,0,'2022-09-05 10:43:37','2022-09-05 10:43:37',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706246313708433409,'洗衣机','rnp36ty3',0,1,0,0,'1706246313708433409.',1,1566977536152907778,'2023-09-25 17:56:36','2023-09-25 17:56:36',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706253366002790402,'电脑鼠标','svmer7bd',0,1,0,0,'1706253366002790402.',1,1566977536152907778,'2023-09-25 18:24:38','2023-09-25 18:24:38',1,1,0);
INSERT INTO `category` (`id`, `name`, `code`, `is_show`, `is_nav`, `sort`, `pid`, `level_path`, `level`, `attr_template_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706253410848288770,'雷蛇','y474wpxy',0,0,0,1706253366002790402,'1706253366002790402.1706253410848288770.',2,1584897537135702018,'2023-09-25 18:24:48','2023-09-25 18:24:48',1,1,0);

--
-- Table structure for table `func_attachment`
--

DROP TABLE IF EXISTS `func_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `func_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `biz_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `biz_id` bigint NOT NULL DEFAULT '0' COMMENT '业务ID',
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附件地址',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_biz_type_biz_id` (`biz_type`,`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1745016328713449475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func_attachment`
--

INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483973386242,'SPU_',1523329483184857089,'http://file.cloud.org:9000/default/5FFCQcW3yqvbo12iny1oNQ.jpeg','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483990163458,'SPU_',1523329483184857089,'http://file.cloud.org:9000/default/srF-EbWGIkcfbYNAiyWJYw.jpeg','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908376681357313,'SPU_',1585908375347568641,'http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg','2022-10-28 16:16:36','2022-10-28 16:16:36',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728185528322,'SPU_',1706962859971883009,'/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728202305537,'SPU_',1706962859971883009,'/minio/ark/2023/12/product/34793f2c-884b-4ddd-8bf7-a4fdfb6aa7c1.pms_1672037284.40181961.png','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728206499842,'SPU_',1706962859971883009,'/minio/ark/2023/12/product/ed7c63cb-b842-467f-ba82-a0a035d20ace.pms_1672220453.00928774.png','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728210694145,'SPU_',1706962859971883009,'/minio/ark/2024/01/product/a1415883-75db-465f-b470-63b9d98cea81.pms_1672220453.00928774.png','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728214888449,'SPU_',1706962859971883009,'/minio/ark/2024/01/product/3cee9cdc-b607-4a75-8d1c-1d1a45750216.pms_1672037284.35878773.png','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744266916072566785,'SPU_',1585928498976456706,'/minio/ark/2024/01/product/918d762c-6636-49af-9cc4-c5e7c86baaca.pms_1701682022.1651733.png','2024-01-08 15:56:54','2024-01-08 15:56:54',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979190218753,'SPU_',1585930689908883458,'/minio/ark/2024/01/product/c2d9b925-32c9-495d-ab73-e98cf075b599.pms_1672037284.35878773.png','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979194413057,'SPU_',1585930689908883458,'/minio/ark/2024/01/product/be356180-1deb-4f6b-9b7b-916e83cfa06f.pms_1672037284.40181961.png','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979194413058,'SPU_',1585930689908883458,'/minio/ark/2024/01/product/8ad39cda-9455-4746-a4d6-703610fdead9.pms_1672220453.00928774.png','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291067885826050,'SPU_',1566986790461059073,'/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `func_attachment` (`id`, `biz_type`, `biz_id`, `url`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328713449474,'SPU_',1566725672303931393,'/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint unsigned NOT NULL COMMENT 'spuId',
  `sku_id` bigint unsigned NOT NULL COMMENT 'skuId',
  `available_stock` int unsigned NOT NULL DEFAULT '0' COMMENT '可用库存数',
  `locked_stock` int unsigned NOT NULL DEFAULT '0' COMMENT '锁定库存数',
  `sold_stock` int unsigned DEFAULT '0' COMMENT '已售库存',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sku_id_udx` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1745016329086742530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='库存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615958646785,1706962859971883009,1740734615916703746,200,0,0,'2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615958646786,1706962859971883009,1740734615933480961,200,0,0,'2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615958646787,1706962859971883009,1740734615941869569,200,0,0,'2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744266916101926913,1585928498976456706,1585928499802734593,99,0,0,'2024-01-08 15:56:54','2024-01-08 15:56:54',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744266916101926914,1585928498976456706,1585928500264108033,0,0,0,'2024-01-08 15:56:54','2024-01-08 15:56:54',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489643638785,1566986790461059073,1706943810655268866,99,0,0,'2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489643638786,1566986790461059073,1706943810655268867,99,0,0,'2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489643638787,1566986790461059073,1706943810709794818,99,0,0,'2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489643638788,1566986790461059073,1706943810709794819,99,0,0,'2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489643638789,1566986790461059073,1706943810709794820,99,0,0,'2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489647833089,1566986790461059073,1706943810709794821,99,0,0,'2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979408322562,1585930689908883458,1744267979374768129,20,0,0,'2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979412516866,1585930689908883458,1744267979383156737,20,0,0,'2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979412516867,1585930689908883458,1744267979391545346,20,0,0,'2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979412516868,1585930689908883458,1744267979399933954,20,0,0,'2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329053188098,1566725672303931393,1566725673578999809,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329057382401,1566725672303931393,1566725673973264386,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329061576705,1566725672303931393,1566725674350751746,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329065771009,1566725672303931393,1566725674648547330,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329069965313,1566725672303931393,1566725674921177089,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329074159618,1566725672303931393,1566725675256721409,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329078353921,1566725672303931393,1566725675617431553,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `inventory` (`id`, `spu_id`, `sku_id`, `available_stock`, `locked_stock`, `sold_stock`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016329086742529,1566725672303931393,1566725675810369537,99,0,0,'2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);

--
-- Table structure for table `inventory_record`
--

DROP TABLE IF EXISTS `inventory_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `inventory_id` bigint unsigned NOT NULL COMMENT '库存id',
  `type` tinyint unsigned NOT NULL COMMENT '操作类型 1-锁定库存 2-库存扣减 3-库存发货 4-库存返回',
  `quantity` int NOT NULL COMMENT '操作数量',
  `note` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `inventory_record_inventory_id_idx` (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='库存操作记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_record`
--


--
-- Table structure for table `sku`
--

DROP TABLE IF EXISTS `sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint NOT NULL COMMENT 'spuId，关联co_spu.id',
  `name` varchar(256) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SKU名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU编码',
  `main_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU主图',
  `sales_price` int NOT NULL DEFAULT '0' COMMENT '销售价（单位：分）',
  `cost_price` int NOT NULL DEFAULT '0' COMMENT '成本价（单位：分）',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存',
  `warn_stock` int NOT NULL DEFAULT '0' COMMENT '预警库存',
  `specs` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU规则属性JSON',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_spu_id` (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1744267979399933955 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='sku';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku`
--

INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484740943874,1523329483184857089,'Redmi Note11 5G','XM00101','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"4+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485051322370,1523329483184857089,'Redmi Note11 5G','XM00102','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"6+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485298786306,1523329483184857089,'Redmi Note11 5G','XM00103','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485550444545,1523329483184857089,'Redmi Note11 5G','XM00104','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"神秘黑境\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+256G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485793714178,1523329483184857089,'Redmi Note11 5G','XM00105','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"4+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486095704065,1523329483184857089,'Redmi Note11 5G','XM00106','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"6+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486397693953,1523329483184857089,'Redmi Note11 5G','XM00107','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486682906625,1523329483184857089,'Redmi Note11 5G','XM00108','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"微醺薄荷\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+256G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486989090817,1523329483184857089,'Redmi Note11 5G','XM00109','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"4+128G\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487282692097,1523329483184857089,'Redmi Note11 5G','XM00110','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"6+128G\"}]','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487555321858,1523329483184857089,'Redmi Note11 5G','XM00111','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+128G\"}]','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487836340225,1523329483184857089,'Redmi Note11 5G','XM00112','',119900,50000,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"浅梦星河\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"制式\",\"attrValue\":\"8+256G\"}]','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673578999809,1566725672303931393,'Xiaomi MIX Fold 2 月影黑 4+128G','XMF000001','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"4+128G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673973264386,1566725672303931393,'Xiaomi MIX Fold 2 月影黑 6+128G','XMF000002','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"6+128G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674350751746,1566725672303931393,'Xiaomi MIX Fold 2 月影黑 8+128G','XMF000003','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+128G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674648547330,1566725672303931393,'Xiaomi MIX Fold 2 月影黑 8+256G','XMF000004','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',1199900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"月影黑\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+256G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674921177089,1566725672303931393,'Xiaomi MIX Fold 2 星耀金 4+128G','XMF000005','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"4+128G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675256721409,1566725672303931393,'Xiaomi MIX Fold 2 星耀金 6+128G','XMF000006','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"6+128G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675617431553,1566725672303931393,'Xiaomi MIX Fold 2 星耀金 8+128G','XMF000007','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',999900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+128G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675810369537,1566725672303931393,'Xiaomi MIX Fold 2 星耀金 8+256G','XMF000008','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',1199900,0,99,10,'[{\"attrId\":\"1523327266537136130\",\"attrName\":\"颜色\",\"attrValue\":\"星耀金\"},{\"attrId\":\"1523327014409134081\",\"attrName\":\"版本\",\"attrValue\":\"8+256G\"}]','2024-01-10 17:34:48','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379193745410,1585908375347568641,'红米1.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',999900,0,0,0,'[{},{},{}]','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379655118849,1585908375347568641,'红米1.0','','http://file.cloud.org:9000/default/pms_1624606024.57162239.jpg',0,0,0,0,'[{},{},{}]','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499802734593,1585928498976456706,'红米3.0 大 维保 红','','/minio/ark/2024/01/product/918d762c-6636-49af-9cc4-c5e7c86baaca.pms_1701682022.1651733.png',99900,9900,99,9,'[{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"大\"},{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"维保\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"红\"}]','2024-01-08 15:56:54','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500264108033,1585928498976456706,'红米3.0 大 维保 蓝','','/minio/ark/2024/01/product/918d762c-6636-49af-9cc4-c5e7c86baaca.pms_1701682022.1651733.png',0,0,0,0,'[{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"大\"},{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"维保\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝\"}]','2024-01-08 15:56:54','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810655268866,1566986790461059073,'小米电视6至尊版 55英寸 标准版 WIFI2 灰色 55英寸','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI2\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 17:32:53','2023-09-27 16:08:13',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810655268867,1566986790461059073,'小米电视6至尊版 55英寸 标准版 WIFI2 蓝色 55英寸','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI2\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 17:32:53','2023-09-27 16:08:13',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794818,1566986790461059073,'小米电视6至尊版 55英寸 标准版 WIFI3 灰色 55英寸','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI3\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 17:32:53','2023-09-27 16:08:13',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794819,1566986790461059073,'小米电视6至尊版 55英寸 标准版 WIFI3 蓝色 55英寸','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI3\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 17:32:53','2023-09-27 16:08:13',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794820,1566986790461059073,'小米电视6至尊版 55英寸 标准版 WIFI6 灰色 55英寸','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI6\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 17:32:53','2023-09-27 16:08:13',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810709794821,1566986790461059073,'小米电视6至尊版 55英寸 标准版 WIFI6 蓝色 55英寸','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',99900,98800,99,88,'[{\"attrId\":\"1566981383629910018\",\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrId\":\"1706862433809248258\",\"attrName\":\"网络\",\"attrValue\":\"WIFI6\"},{\"attrId\":\"1566977806085730306\",\"attrName\":\"颜色\",\"attrValue\":\"蓝色\"},{\"attrId\":\"1566977968443043842\",\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 17:32:53','2023-09-27 16:08:13',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615916703746,1706962859971883009,'Redmi K60123 12GB+512GB 无线充版本 素皮晴蓝','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',299900,200000,200,0,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2024-01-03 10:34:03','2023-12-29 22:00:48',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615933480961,1706962859971883009,'Redmi K60123 12GB+512GB 无线充版本 晴雪','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',299900,200000,200,0,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2024-01-03 10:34:03','2023-12-29 22:00:48',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615941869569,1706962859971883009,'Redmi K60123 12GB+512GB 无线充版本 墨羽','','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',299900,200000,200,0,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2024-01-03 10:34:03','2023-12-29 22:00:48',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979374768129,1585930689908883458,'红米4.0 12GB+256GB 无线充版本 晴雪','','/minio/ark/2024/01/product/c2d9b925-32c9-495d-ab73-e98cf075b599.pms_1672037284.35878773.png',299900,100000,20,10,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979383156737,1585930689908883458,'红米4.0 12GB+256GB 无线充版本 墨羽','','/minio/ark/2024/01/product/c2d9b925-32c9-495d-ab73-e98cf075b599.pms_1672037284.35878773.png',399900,100000,20,10,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979391545346,1585930689908883458,'红米4.0 12GB+256GB 官方标配 晴雪','','/minio/ark/2024/01/product/c2d9b925-32c9-495d-ab73-e98cf075b599.pms_1672037284.35878773.png',499900,100000,20,10,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);
INSERT INTO `sku` (`id`, `spu_id`, `name`, `code`, `main_picture`, `sales_price`, `cost_price`, `stock`, `warn_stock`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267979399933954,1585930689908883458,'红米4.0 12GB+256GB 官方标配 墨羽','','/minio/ark/2024/01/product/c2d9b925-32c9-495d-ab73-e98cf075b599.pms_1672037284.35878773.png',299900,100000,20,10,'[{\"attrId\":\"1706957820544987138\",\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrId\":\"1706958003538276354\",\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrId\":\"1706958257767624705\",\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2024-01-08 16:01:08','2024-01-08 16:01:08',1,1,0);

--
-- Table structure for table `sku_attr`
--

DROP TABLE IF EXISTS `sku_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sku_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sku_id` bigint NOT NULL COMMENT 'skuId，关联co_sku.id',
  `attr_id` bigint DEFAULT NULL COMMENT '属性id',
  `attr_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `attr_value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1585930690743549954 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='sku规格属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_attr`
--

INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484896133122,1523329484740943874,NULL,'','神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484896133123,1523329484740943874,NULL,'','4+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485151985665,1523329485051322370,NULL,'','神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485151985666,1523329485051322370,NULL,'','6+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485399449602,1523329485298786306,NULL,'','神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485403643905,1523329485298786306,NULL,'','8+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485646913538,1523329485550444545,NULL,'','神秘黑境','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485646913539,1523329485550444545,NULL,'','8+256G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485885988866,1523329485793714178,NULL,'','微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329485898571777,1523329485793714178,NULL,'','4+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486234116098,1523329486095704065,NULL,'','微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486246699010,1523329486095704065,NULL,'','6+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486519328769,1523329486397693953,NULL,'','微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486527717377,1523329486397693953,NULL,'','8+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486804541441,1523329486682906625,NULL,'','微醺薄荷','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329486808735746,1523329486682906625,NULL,'','8+256G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487119114242,1523329486989090817,NULL,'','浅梦星河','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487127502850,1523329486989090817,NULL,'','4+128G','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487383355394,1523329487282692097,NULL,'','浅梦星河','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487395938306,1523329487282692097,NULL,'','6+128G','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487693733889,1523329487555321858,NULL,'','浅梦星河','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487693733890,1523329487555321858,NULL,'','8+128G','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487928614913,1523329487836340225,NULL,'','浅梦星河','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329487937003521,1523329487836340225,NULL,'','8+256G','2022-05-08 23:50:27','2022-05-08 23:50:27',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673843240962,1566725673578999809,NULL,'','月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725673843240963,1566725673578999809,NULL,'','4+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674099093506,1566725673973264386,NULL,'','月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674170396674,1566725673973264386,NULL,'','6+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674476580866,1566725674350751746,NULL,'','月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674476580867,1566725674350751746,NULL,'','8+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674728239105,1566725674648547330,NULL,'','月影黑','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674728239106,1566725674648547330,NULL,'','8+256G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674988285953,1566725674921177089,NULL,'','星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725674988285954,1566725674921177089,NULL,'','4+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675365773314,1566725675256721409,NULL,'','星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675365773315,1566725675256721409,NULL,'','6+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675680346114,1566725675617431553,NULL,'','星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725675680346115,1566725675617431553,NULL,'','8+128G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725676007501825,1566725675810369537,NULL,'','星耀金','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725676007501826,1566725675810369537,NULL,'','8+256G','2022-09-05 17:51:24','2022-09-05 17:51:24',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379323768834,1585908379193745410,NULL,'','','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379390877698,1585908379193745410,NULL,'','','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379525095426,1585908379193745410,NULL,'','','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379722227714,1585908379655118849,NULL,'','','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379785142273,1585908379655118849,NULL,'','','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908379919360002,1585908379655118849,NULL,'','','2022-10-28 16:16:37','2022-10-28 16:16:37',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499869843457,1585928499802734593,NULL,'','大','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499936952321,1585928499802734593,NULL,'','维保','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499999866882,1585928499802734593,NULL,'','红','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500264108034,1585928500264108033,NULL,'','大','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500331216898,1585928500264108033,NULL,'','维保','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);
INSERT INTO `sku_attr` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928500398325762,1585928500264108033,NULL,'','蓝','2022-10-28 17:36:34','2022-10-28 17:36:34',1,1,0);

--
-- Table structure for table `spu`
--

DROP TABLE IF EXISTS `spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品介绍',
  `main_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'spu主图url',
  `shelf_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上下架状态：enums[DOWN,下架,0;UP,上架,1]',
  `verify_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：enums[NO_CHECK,未审核,0;CHECK_PASS,审核通过,1;CHECK_NO_PASS,审核不通过,2]',
  `sales` int NOT NULL DEFAULT '0' COMMENT '销量',
  `show_price` int NOT NULL DEFAULT '0' COMMENT '默认展示价格（单位：分）',
  `unit` tinyint(1) DEFAULT '1' COMMENT '单位：enums[G,克,1;KG,千克,2]',
  `weight` int DEFAULT NULL COMMENT '商品重量，默认为克(g)',
  `brand_id` bigint NOT NULL COMMENT '品牌id，关联co_brand.id',
  `category_id` bigint NOT NULL COMMENT '分类id，关联co_category.id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_brand_id` (`brand_id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706962859971883010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='spu主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spu`
--

INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483184857089,'Redmi Note11 5G','XM001','','http://file.cloud.org:9000/default/5FFCQcW3yqvbo12iny1oNQ.jpeg',0,0,0,0,2,2,1523326203994103809,1523328341960876034,'2024-01-09 13:56:13','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672303931393,'Xiaomi MIX Fold 2','XM0000001','','/minio/ark/2024/01/product/4b68f72b-ba95-4f39-9c72-cf20e25e2691.pms_1692003915.92768559.jpg',1,0,0,999900,1,256,1523326203994103809,1566616161236848642,'2024-01-10 17:35:04','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566986790461059073,'小米电视6至尊版 55英寸','XM0000002','','/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png',0,0,0,99900,2,21,1523326203994103809,1566616909194498050,'2024-01-09 13:55:12','2022-09-06 11:08:59',1,1,0);
INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908375347568641,'红米1.0','MM9090','','',0,0,0,0,1,250,1523326203994103809,1566616161236848642,'2024-01-08 15:51:16','2022-10-28 16:16:36',1,1,0);
INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928498976456706,'红米3.0','MI3232','','/minio/ark/2024/01/product/918d762c-6636-49af-9cc4-c5e7c86baaca.pms_1701682022.1651733.png',1,0,0,99900,2,1,1523326203994103809,1566616909194498050,'2024-01-10 17:33:53','2022-10-28 17:36:34',1,1,0);
INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585930689908883458,'红米4.0','MI222333','','/minio/ark/2024/01/product/c2d9b925-32c9-495d-ab73-e98cf075b599.pms_1672037284.35878773.png',1,0,0,299900,2,1,1523326203994103809,1566616161236848642,'2024-01-09 15:24:36','2022-10-28 17:45:16',1,1,0);
INSERT INTO `spu` (`id`, `name`, `code`, `description`, `main_picture`, `shelf_status`, `verify_status`, `sales`, `show_price`, `unit`, `weight`, `brand_id`, `category_id`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706962859971883009,'Redmi K60123','XM000123','超轻薄好手感，前置仿生双主摄，小米Civi3到手价2499起','/minio/ark/2023/12/product/654a0f9a-bf40-4b7d-bafb-dfbbeab18b67.pms_1672037284.35878773.png',0,0,0,299900,2,540,1523326203994103809,1566616161236848642,'2024-01-08 15:21:59','2023-09-27 17:23:54',1,1,0);

--
-- Table structure for table `spu_attr`
--

DROP TABLE IF EXISTS `spu_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spu_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint NOT NULL COMMENT 'spuId，关联co_spu.id',
  `attr_id` bigint NOT NULL COMMENT '属性id',
  `attr_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `attr_value` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值（冗余）',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_spu_id` (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1745016328881221634 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='spu参数属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spu_attr`
--

INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484208267266,1523329483184857089,0,'','手机主机x1、电源适配器x1、插针x1、手机保护壳x1、说明书（含三包凭证）x1	','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484229238786,1523329483184857089,0,'','小米(mi)','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484229238787,1523329483184857089,0,'','Redmi Note11	','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484233433089,1523329483184857089,0,'','2021年','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484233433090,1523329483184857089,0,'','128GB','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484250210305,1523329483184857089,0,'','6.6英寸','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329484254404609,1523329483184857089,0,'','1600万像素','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333314,1566725672303931393,0,'','手机主机丨电源适配器丨USB Type-C 数据线丨Type-C to Audio 转接线|手机保护壳丨屏幕保护膜（出厂贴在手机上）丨卡针丨说明书（含三包凭证）','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333315,1566725672303931393,0,'','小米','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333316,1566725672303931393,0,'','小米 MIX Fold 2','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333317,1566725672303931393,0,'','小米','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333318,1566725672303931393,0,'','22061218C','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333319,1566725672303931393,0,'','小米 MIX Fold 2','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333320,1566725672303931393,0,'','512GB','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333321,1566725672303931393,0,'','8.02英寸','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333322,1566725672303931393,0,'','2000万像素','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333323,1566725672303931393,0,'','WIFI','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672744333324,1566725672303931393,0,'','WIFI','2022-09-05 17:51:23','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706943810537828356,1566986790461059073,0,'','支持蓝牙5.0','2023-09-27 16:08:13','2023-09-27 16:08:13',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986626,1706962859971883009,1706956185395572737,'','是','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986627,1706962859971883009,1706956206258040833,'','2022-12-27','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986628,1706962859971883009,1706956249597784066,'','是','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670408986629,1706962859971883009,1706956274843299841,'','23013RK75C','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095490,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095491,1706962859971883009,1706956857461485569,'','204g','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095492,1706962859971883009,1706956988785143809,'','不支持','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095493,1706962859971883009,1706957062483259393,'','16GB','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095494,1706962859971883009,1706957109094559745,'','120Hz','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095495,1706962859971883009,1706957149271797762,'','30W','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095496,1706962859971883009,1706957196965228546,'','Android','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670476095497,1706962859971883009,1706957244453138434,'','支持5G','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670539010050,1706962859971883009,1706957285632815106,'','Type-C','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1706966670539010051,1706962859971883009,1706957388594589698,'','1600万像素','2023-09-27 17:39:03','2023-09-27 17:39:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858151976962,1706962859971883009,1706956185395572737,'','是','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858160365569,1706962859971883009,1706956206258040833,'','2022-12-27','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858168754178,1706962859971883009,1706956249597784066,'','是','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858172948481,1706962859971883009,1706956274843299841,'','23013RK75C','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858177142786,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858198114306,1706962859971883009,1706956857461485569,'','204g','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858219085826,1706962859971883009,1706956988785143809,'','不支持','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858227474434,1706962859971883009,1706957062483259393,'','16GB','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858231668738,1706962859971883009,1706957109094559745,'','120Hz','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858240057345,1706962859971883009,1706957149271797762,'','30W','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858248445954,1706962859971883009,1706957196965228546,'','Android','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858261028865,1706962859971883009,1706957244453138434,'','支持5G','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858265223170,1706962859971883009,1706957285632815106,'','Type-C','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735135858269417474,1706962859971883009,1706957388594589698,'','1600万像素','2023-12-14 11:13:21','2023-12-14 11:13:21',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589973475329,1706962859971883009,1706956185395572737,'','是','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589981863937,1706962859971883009,1706956206258040833,'','2022-12-27','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589986058241,1706962859971883009,1706956249597784066,'','是','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589994446850,1706962859971883009,1706956274843299841,'','23013RK75C','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138589998641154,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590011224066,1706962859971883009,1706956857461485569,'','204g','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590019612673,1706962859971883009,1706956988785143809,'','不支持','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590028001281,1706962859971883009,1706957062483259393,'','16GB','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590032195586,1706962859971883009,1706957109094559745,'','120Hz','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590040584194,1706962859971883009,1706957149271797762,'','30W','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590048972801,1706962859971883009,1706957196965228546,'','Android','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590057361409,1706962859971883009,1706957244453138434,'','支持5G','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590061555714,1706962859971883009,1706957285632815106,'','Type-C','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735138590065750017,1706962859971883009,1706957388594589698,'','1600万像素','2023-12-14 11:24:12','2023-12-14 11:24:12',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619204657154,1706962859971883009,1706956185395572737,'','是','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619213045762,1706962859971883009,1706956206258040833,'','2022-12-27','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619221434370,1706962859971883009,1706956249597784066,'','是','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619225628673,1706962859971883009,1706956274843299841,'','23013RK75C','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619234017282,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619238211585,1706962859971883009,1706956857461485569,'','204g','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619242405889,1706962859971883009,1706956988785143809,'','不支持','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619246600194,1706962859971883009,1706957062483259393,'','16GB','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619250794497,1706962859971883009,1706957109094559745,'','120Hz','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619259183105,1706962859971883009,1706957149271797762,'','30W','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619263377410,1706962859971883009,1706957196965228546,'','Android','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619267571714,1706962859971883009,1706957244453138434,'','支持5G','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619271766018,1706962859971883009,1706957285632815106,'','Type-C','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735179619275960322,1706962859971883009,1706957388594589698,'','1600万像素','2023-12-14 14:07:14','2023-12-14 14:07:14',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124206583809,1706962859971883009,1706956185395572737,'','是','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124214972418,1706962859971883009,1706956206258040833,'','2022-12-27','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124223361026,1706962859971883009,1706956249597784066,'','是','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124227555330,1706962859971883009,1706956274843299841,'','23013RK75C','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124231749634,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124235943938,1706962859971883009,1706956857461485569,'','204g','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124240138242,1706962859971883009,1706956988785143809,'','不支持','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124244332545,1706962859971883009,1706957062483259393,'','16GB','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124244332546,1706962859971883009,1706957109094559745,'','120Hz','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124252721154,1706962859971883009,1706957149271797762,'','30W','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124256915457,1706962859971883009,1706957196965228546,'','Android','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124265304066,1706962859971883009,1706957244453138434,'','支持5G','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124269498369,1706962859971883009,1706957285632815106,'','Type-C','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735182124273692674,1706962859971883009,1706957388594589698,'','1600万像素','2023-12-14 14:17:11','2023-12-14 14:17:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292001918977,1706962859971883009,1706956185395572737,'','是','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292010307585,1706962859971883009,1706956206258040833,'','2022-12-27','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292018696193,1706962859971883009,1706956249597784066,'','是','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292027084802,1706962859971883009,1706956274843299841,'','23013RK75C','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292035473410,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292039667713,1706962859971883009,1706956857461485569,'','204g','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292043862018,1706962859971883009,1706956988785143809,'','不支持','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292043862019,1706962859971883009,1706957062483259393,'','16GB','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292043862020,1706962859971883009,1706957109094559745,'','120Hz','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292052250625,1706962859971883009,1706957149271797762,'','30W','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292052250626,1706962859971883009,1706957196965228546,'','Android','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292052250627,1706962859971883009,1706957244453138434,'','支持5G','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292060639233,1706962859971883009,1706957285632815106,'','Type-C','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735188292060639234,1706962859971883009,1706957388594589698,'','1600万像素','2023-12-14 14:41:42','2023-12-14 14:41:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298232225793,1706962859971883009,1706956185395572737,'','是','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298244808706,1706962859971883009,1706956206258040833,'','2022-12-27','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298265780226,1706962859971883009,1706956249597784066,'','是','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298282557442,1706962859971883009,1706956274843299841,'','23013RK75C','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298290946049,1706962859971883009,1706956293210157057,'','小米 Redmi K60','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298299334658,1706962859971883009,1706956857461485569,'','204g','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298311917569,1706962859971883009,1706956988785143809,'','不支持','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298316111873,1706962859971883009,1706957062483259393,'','16GB','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298320306177,1706962859971883009,1706957109094559745,'','120Hz','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298324500482,1706962859971883009,1706957149271797762,'','30W','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298328694786,1706962859971883009,1706957196965228546,'','Android','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298341277698,1706962859971883009,1706957244453138434,'','支持5G','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298353860609,1706962859971883009,1706957285632815106,'','Type-C','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1735189298358054913,1706962859971883009,1706957388594589698,'','1600万像素','2023-12-14 14:45:42','2023-12-14 14:45:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263173062658,1706962859971883009,1706956185395572737,'','AAA','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263177256961,1706962859971883009,1706956206258040833,'','CCC','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263181451266,1706962859971883009,1706956249597784066,'','SSS','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263189839874,1706962859971883009,1706956274843299841,'','DDD','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263194034178,1706962859971883009,1706956293210157057,'','SSS','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263202422785,1706962859971883009,1706956857461485569,'','22','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263206617089,1706962859971883009,1706956988785143809,'','WWW','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263210811394,1706962859971883009,1706957062483259393,'','WWW','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263219200001,1706962859971883009,1706957109094559745,'','DDSS','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263223394305,1706962859971883009,1706957149271797762,'','A','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768263227588609,1706962859971883009,1706957196965228546,'','S','2023-12-21 17:33:35','2023-12-21 17:33:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768354780856322,1706962859971883009,1706956185395572737,'','AAA','2023-12-21 17:33:57','2023-12-21 17:33:57',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768354785050626,1706962859971883009,1706956206258040833,'','CCC','2023-12-21 17:33:57','2023-12-21 17:33:57',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768354789244929,1706962859971883009,1706956249597784066,'','SSS','2023-12-21 17:33:57','2023-12-21 17:33:57',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768354793439234,1706962859971883009,1706956274843299841,'','DDD','2023-12-21 17:33:57','2023-12-21 17:33:57',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737768354793439235,1706962859971883009,1706956293210157057,'','DD','2023-12-21 17:33:57','2023-12-21 17:33:57',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737776615135428610,1706962859971883009,1706956185395572737,'','AA','2023-12-21 18:06:46','2023-12-21 18:06:46',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737776615148011522,1706962859971883009,1706956206258040833,'','SSS','2023-12-21 18:06:46','2023-12-21 18:06:46',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737776615156400130,1706962859971883009,1706956249597784066,'','DDS','2023-12-21 18:06:46','2023-12-21 18:06:46',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737776615168983042,1706962859971883009,1706956274843299841,'','SS','2023-12-21 18:06:46','2023-12-21 18:06:46',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1737776615185760257,1706962859971883009,1706956293210157057,'','S','2023-12-21 18:06:46','2023-12-21 18:06:46',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953025794049,1706962859971883009,1706956185395572737,'','aaa','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953038376962,1706962859971883009,1706956206258040833,'','1231','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953050959874,1706962859971883009,1706956249597784066,'','3213','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953055154178,1706962859971883009,1706956274843299841,'','213123','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953067737089,1706962859971883009,1706956293210157057,'','123123','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953076125697,1706962859971883009,1706956857461485569,'','32112','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953080320001,1706962859971883009,1706956988785143809,'','31232','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953101291521,1706962859971883009,1706957062483259393,'','32131','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953101291522,1706962859971883009,1706957109094559745,'','3123','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953176788994,1706962859971883009,1706957149271797762,'','31231','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278953193566210,1706962859971883009,1706957196965228546,'','31','2023-12-28 15:50:10','2023-12-28 15:50:10',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740295026190118914,1706962859971883009,1706956185395572737,'','123','2023-12-28 16:54:02','2023-12-28 16:54:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740295026198507522,1706962859971883009,1706956206258040833,'','2131','2023-12-28 16:54:02','2023-12-28 16:54:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740295026206896130,1706962859971883009,1706956274843299841,'','3213','2023-12-28 16:54:02','2023-12-28 16:54:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740295026211090434,1706962859971883009,1706956249597784066,'','123123','2023-12-28 16:54:02','2023-12-28 16:54:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740299177552834561,1706962859971883009,1706956185395572737,'','是','2023-12-28 17:10:32','2023-12-28 17:10:32',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740299177561223170,1706962859971883009,1706956206258040833,'','否','2023-12-28 17:10:32','2023-12-28 17:10:32',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740299177573806081,1706962859971883009,1706956274843299841,'','321312','2023-12-28 17:10:32','2023-12-28 17:10:32',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740299177586388993,1706962859971883009,1706956249597784066,'','993213','2023-12-28 17:10:32','2023-12-28 17:10:32',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740299177594777602,1706962859971883009,1706956293210157057,'','123123','2023-12-28 17:10:32','2023-12-28 17:10:32',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740307497504272386,1706962859971883009,1706956185395572737,'','是','2023-12-28 17:43:35','2023-12-28 17:43:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740307497533632513,1706962859971883009,1706956206258040833,'','否','2023-12-28 17:43:35','2023-12-28 17:43:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740307497546215426,1706962859971883009,1706956274843299841,'','321312','2023-12-28 17:43:35','2023-12-28 17:43:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740307497554604034,1706962859971883009,1706956249597784066,'','993213','2023-12-28 17:43:35','2023-12-28 17:43:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740307497567186946,1706962859971883009,1706956293210157057,'','123123','2023-12-28 17:43:35','2023-12-28 17:43:35',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740312532246130690,1706962859971883009,1706956185395572737,'','是','2023-12-28 18:03:36','2023-12-28 18:03:36',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740312532262907905,1706962859971883009,1706956206258040833,'','否','2023-12-28 18:03:36','2023-12-28 18:03:36',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740312532271296513,1706962859971883009,1706956274843299841,'','321312','2023-12-28 18:03:36','2023-12-28 18:03:36',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740312532279685122,1706962859971883009,1706956249597784066,'','993213','2023-12-28 18:03:36','2023-12-28 18:03:36',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740312532292268033,1706962859971883009,1706956293210157057,'','123123','2023-12-28 18:03:36','2023-12-28 18:03:36',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740314907421765634,1706962859971883009,1706956185395572737,'','是','2023-12-28 18:13:02','2023-12-28 18:13:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740314907455320066,1706962859971883009,1706956206258040833,'','否','2023-12-28 18:13:02','2023-12-28 18:13:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740314907472097282,1706962859971883009,1706956274843299841,'','321312','2023-12-28 18:13:02','2023-12-28 18:13:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740314907484680194,1706962859971883009,1706956249597784066,'','993213','2023-12-28 18:13:02','2023-12-28 18:13:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740314907497263106,1706962859971883009,1706956293210157057,'','123123','2023-12-28 18:13:02','2023-12-28 18:13:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315524013813761,1706962859971883009,1706956185395572737,'','是','2023-12-28 18:15:29','2023-12-28 18:15:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315524022202370,1706962859971883009,1706956206258040833,'','否','2023-12-28 18:15:29','2023-12-28 18:15:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315524030590977,1706962859971883009,1706956274843299841,'','321312','2023-12-28 18:15:29','2023-12-28 18:15:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315524034785282,1706962859971883009,1706956249597784066,'','993213','2023-12-28 18:15:29','2023-12-28 18:15:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315524068339714,1706962859971883009,1706956293210157057,'','123123','2023-12-28 18:15:29','2023-12-28 18:15:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315630884679681,1706962859971883009,1706956185395572737,'','是','2023-12-28 18:15:55','2023-12-28 18:15:55',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315630893068289,1706962859971883009,1706956206258040833,'','否','2023-12-28 18:15:55','2023-12-28 18:15:55',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315630897262594,1706962859971883009,1706956274843299841,'','321312','2023-12-28 18:15:55','2023-12-28 18:15:55',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315630901456897,1706962859971883009,1706956249597784066,'','993213','2023-12-28 18:15:55','2023-12-28 18:15:55',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740315630909845506,1706962859971883009,1706956293210157057,'','123123','2023-12-28 18:15:55','2023-12-28 18:15:55',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615723765761,1706962859971883009,1706956185395572737,'','是','2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615732154369,1706962859971883009,1706956206258040833,'','否','2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615732154370,1706962859971883009,1706956274843299841,'','321312','2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615740542977,1706962859971883009,1706956249597784066,'','993213','2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740734615748931585,1706962859971883009,1706956293210157057,'','123123','2023-12-29 22:00:48','2023-12-29 22:00:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742059629764997121,1706962859971883009,1706956185395572737,'','是','2024-01-02 13:45:56','2024-01-02 13:45:56',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742059629773385729,1706962859971883009,1706956206258040833,'','否','2024-01-02 13:45:56','2024-01-02 13:45:56',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742059629777580033,1706962859971883009,1706956274843299841,'','321312','2024-01-02 13:45:56','2024-01-02 13:45:56',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742059629781774338,1706962859971883009,1706956249597784066,'','993213','2024-01-02 13:45:56','2024-01-02 13:45:56',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742059629785968642,1706962859971883009,1706956293210157057,'','123123','2024-01-02 13:45:56','2024-01-02 13:45:56',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121551009460226,1706962859971883009,1706956185395572737,'','是','2024-01-02 17:51:59','2024-01-02 17:51:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121551017848834,1706962859971883009,1706956206258040833,'','否','2024-01-02 17:51:59','2024-01-02 17:51:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121551026237441,1706962859971883009,1706956274843299841,'','321312','2024-01-02 17:51:59','2024-01-02 17:51:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121551051403265,1706962859971883009,1706956249597784066,'','993213','2024-01-02 17:51:59','2024-01-02 17:51:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121551063986178,1706962859971883009,1706956293210157057,'','123123','2024-01-02 17:51:59','2024-01-02 17:51:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121814550163458,1706962859971883009,1706956185395572737,'','是','2024-01-02 17:53:02','2024-01-02 17:53:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121814550163459,1706962859971883009,1706956206258040833,'','否','2024-01-02 17:53:02','2024-01-02 17:53:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121814550163460,1706962859971883009,1706956274843299841,'','321312','2024-01-02 17:53:02','2024-01-02 17:53:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121814554357762,1706962859971883009,1706956249597784066,'','993213','2024-01-02 17:53:02','2024-01-02 17:53:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742121814562746369,1706962859971883009,1706956293210157057,'','123123','2024-01-02 17:53:02','2024-01-02 17:53:02',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370565868548097,1706962859971883009,1706956185395572737,'','是','2024-01-03 10:21:29','2024-01-03 10:21:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370565876936705,1706962859971883009,1706956206258040833,'','否','2024-01-03 10:21:29','2024-01-03 10:21:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370565881131009,1706962859971883009,1706956274843299841,'','321312','2024-01-03 10:21:29','2024-01-03 10:21:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370565889519617,1706962859971883009,1706956249597784066,'','993213','2024-01-03 10:21:29','2024-01-03 10:21:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370565897908225,1706962859971883009,1706956293210157057,'','123123','2024-01-03 10:21:29','2024-01-03 10:21:29',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370689357246466,1706962859971883009,1706956185395572737,'','是','2024-01-03 10:21:59','2024-01-03 10:21:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370689365635073,1706962859971883009,1706956206258040833,'','否','2024-01-03 10:21:59','2024-01-03 10:21:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370689369829378,1706962859971883009,1706956274843299841,'','321312','2024-01-03 10:21:59','2024-01-03 10:21:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370689374023682,1706962859971883009,1706956249597784066,'','993213','2024-01-03 10:21:59','2024-01-03 10:21:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742370689378217986,1706962859971883009,1706956293210157057,'','123123','2024-01-03 10:21:59','2024-01-03 10:21:59',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728319746049,1706962859971883009,1706956185395572737,'','是','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728323940353,1706962859971883009,1706956206258040833,'','否','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728328134657,1706962859971883009,1706956274843299841,'','321312','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728336523265,1706962859971883009,1706956249597784066,'','993213','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1742373728340717569,1706962859971883009,1706956293210157057,'','123123','2024-01-03 10:34:03','2024-01-03 10:34:03',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489563947010,1566986790461059073,1566985652697378818,'','直下式','2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489572335618,1566986790461059073,1566985744619745281,'','120Hz','2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489576529922,1566986790461059073,1566985820662476802,'','Cortex A73 四核','2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489580724226,1566986790461059073,1566985853843615745,'','4.5GB','2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489580724227,1566986790461059073,1566985899037241346,'','2.4GHz、5GHz双频WiFi 6','2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744267489584918530,1566986790461059073,1566985933401174017,'','支持蓝牙5.0','2024-01-08 15:59:11','2024-01-08 15:59:11',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744268374209769473,1566986790461059073,1566985652697378818,'','直下式','2024-01-08 16:02:42','2024-01-08 16:02:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744268374213963777,1566986790461059073,1566985744619745281,'','120Hz','2024-01-08 16:02:42','2024-01-08 16:02:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744268374218158081,1566986790461059073,1566985820662476802,'','Cortex A73 四核','2024-01-08 16:02:42','2024-01-08 16:02:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744268374222352385,1566986790461059073,1566985853843615745,'','4.5GB','2024-01-08 16:02:42','2024-01-08 16:02:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744268374226546690,1566986790461059073,1566985899037241346,'','2.4GHz、5GHz双频WiFi 6','2024-01-08 16:02:42','2024-01-08 16:02:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744268374234935298,1566986790461059073,1566985933401174017,'','支持蓝牙5.0','2024-01-08 16:02:42','2024-01-08 16:02:42',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291067961323522,1566986790461059073,1566985652697378818,'','直下式','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291067969712130,1566986790461059073,1566985744619745281,'','120Hz','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291067982295042,1566986790461059073,1566985820662476802,'','Cortex A73 四核','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291067990683650,1566986790461059073,1566985853843615745,'','4.5GB','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291067994877953,1566986790461059073,1566985899037241346,'','2.4GHz、5GHz双频WiFi 6','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744291068003266561,1566986790461059073,1566985933401174017,'','支持蓝牙5.0','2024-01-08 17:32:53','2024-01-08 17:32:53',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328830889985,1566725672303931393,1523327841215504386,'','手机主机丨电源适配器丨USB Type-C 数据线丨Type-C to Audio 转接线|手机保护壳丨屏幕保护膜（出厂贴在手机上）丨卡针丨说明书（含三包凭证）','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328847667201,1566725672303931393,1523327922828271617,'','小米','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328851861506,1566725672303931393,1523327948132507649,'','小米 MIX Fold 2','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328856055810,1566725672303931393,1523327992193671170,'','小米','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328860250114,1566725672303931393,1566623322197233666,'','22061218C','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328864444418,1566725672303931393,1566623410889986050,'','小米 MIX Fold 2','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328868638722,1566725672303931393,1523328053954797569,'','512GB','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328872833025,1566725672303931393,1523328096413736962,'','8.02英寸','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328877027329,1566725672303931393,1523328146703441922,'','2000万像素','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328877027330,1566725672303931393,1566624103143084034,'','WIFI','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);
INSERT INTO `spu_attr` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1745016328881221633,1566725672303931393,1566623458587611138,'','WIFI','2024-01-10 17:34:48','2024-01-10 17:34:48',1,1,0);

--
-- Table structure for table `spu_sales`
--

DROP TABLE IF EXISTS `spu_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spu_sales` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spu_id` bigint NOT NULL COMMENT 'spuId，关联co_spu.id',
  `freight_template_id` bigint NOT NULL DEFAULT '0' COMMENT '运费模版ID,关联freight_template.id',
  `pc_rich_text` text COLLATE utf8mb4_general_ci COMMENT 'PC端商品介绍富文本',
  `mobile_rich_text` text COLLATE utf8mb4_general_ci COMMENT '移动端商品介绍富文本',
  `param_data` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数属性JSON',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1740278952874799106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='spu销售属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spu_sales`
--

INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1523329483734310913,1523329483184857089,0,'<p>hello123</p>','','[{\"attrId\":\"1523327841215504386\",\"attrValue\":\"手机主机x1、电源适配器x1、插针x1、手机保护壳x1、说明书（含三包凭证）x1\\t\"},{\"attrId\":\"1523327922828271617\",\"attrValue\":\"小米(mi)\"},{\"attrId\":\"1523327948132507649\",\"attrValue\":\"Redmi Note11\\t\"},{\"attrId\":\"1523327992193671170\",\"attrValue\":\"2021年\"},{\"attrId\":\"1523328053954797569\",\"attrValue\":\"128GB\"},{\"attrId\":\"1523328096413736962\",\"attrValue\":\"6.6英寸\"},{\"attrId\":\"1523328146703441922\",\"attrValue\":\"1600万像素\"}]','2022-05-08 23:50:26','2022-05-08 23:50:26',1,1,0);
INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566725672366845954,1566725672303931393,0,'<p><br></p>','','[{\"attrId\":\"1523327841215504386\",\"attrValue\":\"手机主机丨电源适配器丨USB Type-C 数据线丨Type-C to Audio 转接线|手机保护壳丨屏幕保护膜（出厂贴在手机上）丨卡针丨说明书（含三包凭证）\"},{\"attrId\":\"1523327922828271617\",\"attrValue\":\"小米\"},{\"attrId\":\"1523327948132507649\",\"attrValue\":\"小米 MIX Fold 2\"},{\"attrId\":\"1523327992193671170\",\"attrValue\":\"小米\"},{\"attrId\":\"1566623322197233666\",\"attrValue\":\"22061218C\"},{\"attrId\":\"1566623410889986050\",\"attrValue\":\"小米 MIX Fold 2\"},{\"attrId\":\"1523328053954797569\",\"attrValue\":\"512GB\"},{\"attrId\":\"1523328096413736962\",\"attrValue\":\"8.02英寸\"},{\"attrId\":\"1523328146703441922\",\"attrValue\":\"2000万像素\"},{\"attrId\":\"1566624103143084034\",\"attrValue\":\"WIFI\"},{\"attrId\":\"1566623458587611138\",\"attrValue\":\"WIFI\"}]','2024-01-10 17:34:48','2022-09-05 17:51:23',1,1,0);
INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1566986790653997057,1566986790461059073,0,'<p><br></p>','','[{\"attrId\":\"1566985652697378818\",\"attrValue\":\"直下式\"},{\"attrId\":\"1566985744619745281\",\"attrValue\":\"120Hz\"},{\"attrId\":\"1566985820662476802\",\"attrValue\":\"Cortex A73 四核\"},{\"attrId\":\"1566985853843615745\",\"attrValue\":\"4.5GB\"},{\"attrId\":\"1566985899037241346\",\"attrValue\":\"2.4GHz、5GHz双频WiFi 6\"},{\"attrId\":\"1566985933401174017\",\"attrValue\":\"支持蓝牙5.0\"}]','2024-01-08 17:32:53','2022-09-06 11:08:59',1,1,0);
INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585908375754416130,1585908375347568641,0,'<p>hello</p>','','[]','2022-10-28 16:16:36','2022-10-28 16:16:36',1,1,0);
INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585928499081314305,1585928498976456706,0,'<p><br></p>','','[]','2024-01-08 15:56:54','2022-10-28 17:36:34',1,1,0);
INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1585930690022129666,1585930689908883458,0,'<p><br></p>','','[]','2024-01-08 16:01:08','2022-10-28 17:45:16',1,1,0);
INSERT INTO `spu_sales` (`id`, `spu_id`, `freight_template_id`, `pc_rich_text`, `mobile_rich_text`, `param_data`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1740278952874799105,1706962859971883009,0,'<p><br></p>','','[{\"attrId\":\"1706956185395572737\",\"attrValue\":\"是\"},{\"attrId\":\"1706956206258040833\",\"attrValue\":\"否\"},{\"attrId\":\"1706956274843299841\",\"attrValue\":\"321312\"},{\"attrId\":\"1706956249597784066\",\"attrValue\":\"993213\"},{\"attrId\":\"1706956293210157057\",\"attrValue\":\"123123\"}]','2024-01-03 10:34:03','2023-12-28 15:50:10',1,1,0);

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
  `biz_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务订单号',
  `pay_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付订单号',
  `req_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '通知请求体',
  `status` int DEFAULT NULL COMMENT '支付状态',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `biz_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务订单号',
  `pay_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方平台交易单号',
  `pay_type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付类型编码',
  `pay_type_id` tinyint DEFAULT NULL COMMENT '支付类型id',
  `amount` int DEFAULT NULL COMMENT '支付金额',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付单描述信息',
  `status` int DEFAULT NULL COMMENT '支付状态',
  `last_notify_time` datetime DEFAULT NULL COMMENT '最后一次支付结果通知时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1732698697939087363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order`
--

INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732066895314612226,'202312052350233','1732066857280663552',NULL,'ALIPAY',2,229900,'',1,NULL,'2023-12-05 23:58:23','2023-12-05 23:58:23',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732067388506042369,'202312052350233','1732067387302277120',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 00:00:20','2023-12-06 00:00:20',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236624390057986,'202312061112464','1732236623882547200',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 11:12:49','2023-12-06 11:12:49',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236752844812290,'202312061113168','1732236752563793920',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 11:13:20','2023-12-06 11:13:20',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326989168177154,'202312061711453','1732326988820049920',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 17:11:54','2023-12-06 17:11:54',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732403898484846593,'202312062217033','1732403898044444672',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 22:17:31','2023-12-06 22:17:31',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405084898258946,'202312062222110','1732405084654989312',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 22:22:13','2023-12-06 22:22:13',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405570305060866,'202312062224042','1732405569994682368',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 22:24:09','2023-12-06 22:24:09',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732413838259712002,'202312062256575','1732413837760589824',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-06 22:57:00','2023-12-06 22:57:00',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732649903981654017,'202312071431093','1732649902933078016',NULL,'ALIPAY',2,229900,'',1,NULL,'2023-12-07 14:35:03','2023-12-07 14:35:03',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732650035783462913,'202312071431093','1732650034885881856',NULL,'ALIPAY',2,229900,'',1,NULL,'2023-12-07 14:35:34','2023-12-07 14:35:34',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732651000720846850,'202312071431093','1732651000259473408',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-07 14:39:24','2023-12-07 14:39:24',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732696403520581634,'202312071739436','1732696402786578432',NULL,'ALIPAY',2,229900,'',3,NULL,'2023-12-07 17:39:49','2023-12-07 17:39:49',1,1,0);
INSERT INTO `pay_order` (`id`, `biz_trade_no`, `pay_trade_no`, `out_trade_no`, `pay_type_code`, `pay_type_id`, `amount`, `description`, `status`, `last_notify_time`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732698697939087362,'202312071748505','1732698697783898112',NULL,'ALIPAY',2,2299000,'',3,NULL,'2023-12-07 17:48:56','2023-12-07 17:48:56',1,1,0);

--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付类型名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付类型编号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付单描述信息',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--


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
  `sku_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` int NOT NULL DEFAULT '0' COMMENT 'SKU单价',
  `quantity` int NOT NULL DEFAULT '0' COMMENT '购买数量',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `pic_url` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '图片地址',
  `specs` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU规格属性JSON',
  `checked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否选中 enums[YES,是,1;NO,否,0]',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='购物车表';
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
  `trade_no` varchar(64) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '订单号',
  `order_type` int NOT NULL DEFAULT '1' COMMENT '订单类型 enums[SHOP,商城订单,1]',
  `order_channel` int NOT NULL DEFAULT '0' COMMENT '下单渠道 enums[PC,PC,1;APP,APP,2;MINI,小程序,3]',
  `order_status` int NOT NULL DEFAULT '1' COMMENT '订单状态 enums[PENDING_PAY,待支付,1;PENDING_DELIVER,待发货,2;PENDING_RECEIVE,待收货,3;SUCCESS,交易成功,4]',
  `pay_status` int NOT NULL DEFAULT '1' COMMENT '支付状态 enums[PENDING_PAY,待支付,1;PAYING,支付中,2;PAY_SUCCESS,支付成功,3;PAY_FAIL,支付失败,4]',
  `pay_type` tinyint DEFAULT NULL COMMENT '支付类型',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `freight_amount` int NOT NULL DEFAULT '0' COMMENT '运费金额',
  `pay_trade_no` varchar(128) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '支付交易单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `completion_time` datetime DEFAULT NULL COMMENT '完成时间',
  `buyer_remark` varchar(500) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '买家备注',
  `buyer_id` bigint NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(64) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '买家名称（冗余）',
  `seller_id` bigint NOT NULL COMMENT '卖家ID',
  `logistics_company` varchar(32) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '物流公司',
  `logistics_code` varchar(32) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '物流单号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx_trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order`
--

INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732064885076471809,'202312052350233',1,1,3,3,2,229900,229900,0,'1732067387302277120',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF88888','2023-12-06 22:13:46','2023-12-05 23:50:23',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236612632915970,'202312061112464',1,1,3,3,2,229900,229900,0,'1732236623882547200',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF00123','2023-12-06 22:13:22','2023-12-06 11:12:47',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236740307529730,'202312061113168',1,1,3,3,2,229900,229900,0,'1732236752563793920',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF01122','2023-12-06 16:21:48','2023-12-06 11:13:17',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326451432730625,'202312061709457',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-06 17:09:46','2023-12-06 17:09:46',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326953499308034,'202312061711453',1,1,3,3,2,229900,229900,0,'1732326988820049920',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','SF88888','2023-12-06 17:12:21','2023-12-06 17:11:45',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732403784629956610,'202312062217033',1,1,3,3,2,229900,229900,0,'1732403898044444672',NULL,NULL,NULL,NULL,'',1,'Admin',0,'sf','4423','2023-12-06 22:18:04','2023-12-06 22:17:03',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405075439595521,'202312062222110',1,1,3,3,2,229900,229900,0,'1732405084654989312',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','99999','2023-12-06 22:22:27','2023-12-06 22:22:11',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405550201253890,'202312062224042',1,1,3,3,2,229900,229900,0,'1732405569994682368',NULL,NULL,NULL,NULL,'',1,'Admin',0,'SF','A88888','2023-12-06 22:24:25','2023-12-06 22:24:04',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732413826448044033,'202312062256575',1,1,4,3,2,229900,229900,0,'1732413837760589824','2023-12-06 22:57:08','2023-12-06 22:57:49','2023-12-06 23:08:15',NULL,'',1,'Admin',0,'SF','SF9999123','2023-12-06 23:08:15','2023-12-06 22:56:58',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732629332975235074,'202312071313182',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 13:13:18','2023-12-07 13:13:18',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732643108927647746,'202312071408025',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 14:08:03','2023-12-07 14:08:03',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732645053448925186,'202312071415462',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 14:15:46','2023-12-07 14:15:46',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732648604527046657,'202312071429529',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-07 14:29:53','2023-12-07 14:29:53',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732648925269667841,'202312071431093',1,1,4,3,2,229900,229900,0,'1732651000259473408','2023-12-07 15:04:53','2023-12-07 15:05:12','2023-12-07 15:08:00',NULL,'',1,'Admin',0,'SF','123123123','2023-12-07 15:08:00','2023-12-07 14:31:10',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732696380694671361,'202312071739436',1,1,3,3,2,229900,229900,0,'1732696402786578432','2023-12-07 17:40:05','2023-12-07 17:40:29',NULL,NULL,'',1,'Admin',0,'SF','000123','2023-12-07 17:40:29','2023-12-07 17:39:44',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674635026433,'202312071748505',1,1,4,3,2,2299000,2299000,0,'1732698697783898112','2023-12-07 17:50:01','2023-12-07 17:50:54','2023-12-08 22:55:49',NULL,'',1,'Admin',0,'SF','SF9999','2023-12-08 22:55:49','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1734482803240284161,'202312121558199',1,1,1,1,NULL,229900,229900,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2023-12-12 15:58:20','2023-12-12 15:58:20',1,1,0);
INSERT INTO `od_order` (`id`, `trade_no`, `order_type`, `order_channel`, `order_status`, `pay_status`, `pay_type`, `expect_amount`, `actual_amount`, `freight_amount`, `pay_trade_no`, `pay_time`, `deliver_time`, `receive_time`, `completion_time`, `buyer_remark`, `buyer_id`, `buyer_name`, `seller_id`, `logistics_company`, `logistics_code`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744298862432563202,'202401081803496',1,1,1,1,NULL,199800,199800,0,'',NULL,NULL,NULL,NULL,'',1,'Admin',0,'','','2024-01-08 18:03:51','2024-01-08 18:03:51',1,1,0);

--
-- Table structure for table `od_order_item`
--

DROP TABLE IF EXISTS `od_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `od_order_item` (
  `id` bigint unsigned NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `trade_no` varchar(64) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '交易订单号',
  `sku_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '商品名称（冗余）',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `price` int NOT NULL DEFAULT '0' COMMENT 'SKU单价',
  `quantity` int NOT NULL DEFAULT '0' COMMENT '购买数量',
  `expect_amount` int NOT NULL DEFAULT '0' COMMENT '应付金额',
  `actual_amount` int NOT NULL DEFAULT '0' COMMENT '实付金额',
  `pic_url` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '图片地址',
  `specs` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU规格参数JSON',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order_item`
--

INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732064885105831938,1732064885076471809,'202312052350233','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-05 23:50:23','2023-12-05 23:50:23',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236612658081794,1732236612632915970,'202312061112464','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 11:12:47','2023-12-06 11:12:47',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236740336889858,1732236740307529730,'202312061113168','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 11:13:17','2023-12-06 11:13:17',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326451449507842,1732326451432730625,'202312061709457','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782404,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-06 17:09:46','2023-12-06 17:09:46',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326953516085250,1732326953499308034,'202312061711453','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782404,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-06 17:11:45','2023-12-06 17:11:45',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732403784650928129,1732403784629956610,'202312062217033','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:17:03','2023-12-06 22:17:03',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405075460567041,1732405075439595521,'202312062222110','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:22:11','2023-12-06 22:22:11',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405550222225409,1732405550201253890,'202312062224042','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:24:04','2023-12-06 22:24:04',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732413826464821249,1732413826448044033,'202312062256575','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-06 22:56:58','2023-12-06 22:56:58',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732629333029761026,1732629332975235074,'202312071313182','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-07 13:13:18','2023-12-07 13:13:18',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732643109049282561,1732643108927647746,'202312071408025','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-07 14:08:03','2023-12-07 14:08:03',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732645053474091010,1732645053448925186,'202312071415462','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658374,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 14:15:46','2023-12-07 14:15:46',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732648604548018177,1732648604527046657,'202312071429529','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860550696962,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 14:29:53','2023-12-07 14:29:53',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732648925408079874,1732648925269667841,'202312071431093','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860550696962,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 14:31:10','2023-12-07 14:31:10',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732696380724031490,1732696380694671361,'202312071739436','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658372,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-07 17:39:44','2023-12-07 17:39:44',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674790215682,1732698674635026433,'202312071748505','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860550696965,229900,5,1149500,1149500,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"无线充版本\"},{\"attrName\":\"颜色\",\"attrValue\":\"晴雪\"}]','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674840547329,1732698674635026433,'202312071748505','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860873658374,229900,3,689700,689700,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+512GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674865713153,1732698674635026433,'202312071748505','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860810743813,229900,2,459800,459800,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"16GB+1TB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"素皮晴蓝\"}]','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1734482803269644290,1734482803240284161,'202312121558199','Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航',1706962860487782403,229900,1,229900,229900,'http://minio.ark-dev.svc:9000/default/3140ce5e4d89f601 (1).jpg','[{\"attrName\":\"版本\",\"attrValue\":\"12GB+256GB\"},{\"attrName\":\"购买方式\",\"attrValue\":\"官方标配\"},{\"attrName\":\"颜色\",\"attrValue\":\"墨羽\"}]','2023-12-12 15:58:20','2023-12-12 15:58:20',1,1,0);
INSERT INTO `od_order_item` (`id`, `order_id`, `trade_no`, `sku_name`, `sku_id`, `price`, `quantity`, `expect_amount`, `actual_amount`, `pic_url`, `specs`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744298862726164481,1744298862432563202,'202401081803496','小米电视6至尊版 55英寸 标准版 WIFI6 灰色 55英寸',1706943810709794820,99900,2,199800,199800,'/minio/ark/2024/01/product/47421d7d-1607-4513-bff7-e6b6335c2ac9.pms_1690270971.0569483.png','[{\"attrName\":\"套装\",\"attrValue\":\"标准版\"},{\"attrName\":\"网络\",\"attrValue\":\"WIFI6\"},{\"attrName\":\"颜色\",\"attrValue\":\"灰色\"},{\"attrName\":\"尺寸\",\"attrValue\":\"55英寸\"}]','2024-01-08 18:03:51','2024-01-08 18:03:51',1,1,0);

--
-- Table structure for table `od_receive`
--

DROP TABLE IF EXISTS `od_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `od_receive` (
  `id` bigint unsigned NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `name` varchar(64) CHARACTER SET utf8mb3 DEFAULT '' COMMENT '收货人名称',
  `mobile` varchar(64) CHARACTER SET utf8mb3 DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8mb3 DEFAULT '' COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8mb3 DEFAULT '' COMMENT '城市',
  `district` varchar(64) CHARACTER SET utf8mb3 DEFAULT '' COMMENT '区',
  `street` varchar(128) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '街道',
  `address` varchar(256) CHARACTER SET utf8mb3 DEFAULT '' COMMENT '详细地址',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单收货信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_receive`
--

INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732064885130997762,1732064885076471809,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-05 23:50:23','2023-12-05 23:50:23',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236612679053313,1732236612632915970,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-06 11:12:47','2023-12-06 11:12:47',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732236740349472769,1732236740307529730,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-06 11:13:17','2023-12-06 11:13:17',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326451457896450,1732326451432730625,'陈嘉玮','18588888888','广东省','广州市','白云区','人民街道','文明路','2023-12-06 17:09:46','2023-12-06 17:09:46',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732326953528668162,1732326953499308034,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-06 17:11:45','2023-12-06 17:11:45',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732403784663511042,1732403784629956610,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-06 22:17:03','2023-12-06 22:17:03',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405075481538562,1732405075439595521,'','','','','','','','2023-12-06 22:22:11','2023-12-06 22:22:11',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732405550230614017,1732405550201253890,'','','','','','','','2023-12-06 22:24:04','2023-12-06 22:24:04',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732413826485792769,1732413826448044033,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-06 22:56:58','2023-12-06 22:56:58',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732629333088481282,1732629332975235074,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 13:13:18','2023-12-07 13:13:18',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732643109103808513,1732643108927647746,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:08:03','2023-12-07 14:08:03',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732645053486673922,1732645053448925186,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:15:46','2023-12-07 14:15:46',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732648604564795394,1732648604527046657,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:29:53','2023-12-07 14:29:53',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732648925424857090,1732648925269667841,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 14:31:10','2023-12-07 14:31:10',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732696380736614401,1732696380694671361,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 17:39:44','2023-12-07 17:39:44',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732698674882490370,1732698674635026433,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-07 17:48:51','2023-12-07 17:48:51',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1734482803290615809,1734482803240284161,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-12 15:58:20','2023-12-12 15:58:20',1,1,0);
INSERT INTO `od_receive` (`id`, `order_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1744298862759718914,1744298862432563202,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2024-01-08 18:03:51','2024-01-08 18:03:51',1,1,0);

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
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '收货人名称',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '城市',
  `district` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '区',
  `street` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '街道',
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '详细地址',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户收货信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_receive`
--

INSERT INTO `us_receive` (`id`, `user_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732064830898647041,1,'陈','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-05 23:50:11','2023-12-05 23:50:11',1,1,0);
INSERT INTO `us_receive` (`id`, `user_id`, `name`, `mobile`, `province`, `city`, `district`, `street`, `address`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1732064868529942530,1,'陈2','18588838383','广东省','深圳市','盐田区','沙头角街道','110号','2023-12-05 23:50:20','2023-12-05 23:50:20',1,1,0);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 22:21:25
