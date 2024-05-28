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
-- Table structure for table `domain_event`
--

DROP TABLE IF EXISTS `domain_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_event` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `tenant_id` bigint unsigned NOT NULL COMMENT '租户ID，不能为空',
  `ar_id` bigint unsigned NOT NULL COMMENT '聚合根ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件类型（自定义）',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件状态（CREATED、PUBLISH_SUCCEED、PUBLISH_FAILED、CONSUME_SUCCEED、CONSUME_FAILED）',
  `published_count` int unsigned DEFAULT NULL COMMENT '已发布次数，无论成功与否',
  `consumed_count` int unsigned DEFAULT NULL COMMENT '已消费次数，无论成功与否',
  `event_data` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件数据',
  `triggered_by` bigint DEFAULT NULL COMMENT '触发事件的用户ID',
  `triggered_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '触发事件的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='领域事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_event`
--

INSERT INTO `domain_event` (`id`, `tenant_id`, `ar_id`, `type`, `status`, `published_count`, `consumed_count`, `event_data`, `triggered_by`, `triggered_at`) VALUES (1750076014991650817,1,1750076014991650816,'USER_CREATED','CREATED',0,0,'',1,'2024-01-24 16:40:11');

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
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_application_id_url_method` (`application_id`,`uri`,`method`),
  KEY `fk_upms_api_category_idx` (`category_id`),
  KEY `idx_application_id` (`application_id`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1795276284110860290 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='api表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_api`
--

INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,'/iam/v1/api/category','/iam/v1/api/category','PUT',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'/iam/v1/api/category','/iam/v1/api/category','DELETE',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'分页列表','/iam/v1/api/categories','GET',1,1701432390324854786,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'/iam/v1/api/category','/iam/v1/api/category','POST',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'/iam/v1/api/init','/iam/v1/api/init','GET',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'/iam/v1/apis','/iam/v1/apis','POST',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'/iam/v1/api/test','/iam/v1/api/test','GET',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'创建API','/iam/v1/api','POST',1,1701174623706116098,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'更新API','/iam/v1/api','PUT',1,1701174623706116098,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (10,1,'删除单个接口','/iam/v1/api/{id}','DELETE',1,1701174623706116098,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (11,1,'/iam/v1/api/cache','/iam/v1/api/cache','PUT',1,5,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (12,1,'查询应用列表','/iam/v1/applications','POST',1,4,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'/iam/v1/application','/iam/v1/application','POST',1,4,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'/iam/v1/application','/iam/v1/application','PUT',1,4,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'/iam/v1/auth/login','/iam/v1/auth/login','POST',1,0,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'全量查询','/iam/v1/roles/all','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'/iam/v1/role/status','/iam/v1/role/status','PUT',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'/iam/v1/role','/iam/v1/role','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'/iam/v1/role/{id}','/iam/v1/role/{id}','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'/iam/v1/role','/iam/v1/role','PUT',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (21,1,'/iam/v1/roles','/iam/v1/roles','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'/iam/v1/role/resourcePermission/route','/iam/v1/role/resourcePermission/route','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'/iam/v1/role/resourcePermission/api','/iam/v1/role/resourcePermission/api','POST',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'/iam/v1/role/resourcePermission/routes','/iam/v1/role/resourcePermission/routes','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'/iam/v1/role/resourcePermission/elements','/iam/v1/role/resourcePermission/elements','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'/iam/v1/role/resourcePermission/apis','/iam/v1/role/resourcePermission/apis','GET',1,3,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'/iam/v1/route/status','/iam/v1/route/status','PUT',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'/iam/v1/route/parent','/iam/v1/route/parent','PUT',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'/iam/v1/route','/iam/v1/route','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'/iam/v1/route/{id}','/iam/v1/route/{id}','GET',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (31,1,'/iam/v1/route','/iam/v1/route','PUT',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'/iam/v1/routes/init','/iam/v1/routes/init','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (33,1,'/iam/v1/routes/all','/iam/v1/routes/all','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'/iam/v1/routes','/iam/v1/routes','POST',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'/iam/v1/route/{id}','/iam/v1/route/{id}','DELETE',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'/iam/v1/route/{routeId}/elements','/iam/v1/route/{routeId}/elements','GET',1,6,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'/iam/v1/user','/iam/v1/user','POST',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'/iam/v1/user/self','/iam/v1/user/self','GET',1,1,2,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'/iam/v1/user','/iam/v1/user','PUT',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'/iam/v1/users','/iam/v1/users','POST',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (41,1,'用户详情','/iam/v1/user/details','GET',1,1,2,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'/iam/v1/user/self/routes','/iam/v1/user/self/routes','GET',1,1,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'/iam/v1/user/self/elements','/iam/v1/user/self/elements','GET',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'/iam/v1/usergroup/status','/iam/v1/usergroup/status','PUT',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'创建用户组','/iam/v1/usergroup','POST',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (46,1,'更新用户组','/iam/v1/usergroup','PUT',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (47,1,'查询用户组全量数据','/iam/v1/usergroups/all','GET',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (48,1,'查询用户组树结构列表','/iam/v1/usergroups','POST',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (49,1,'查询用户组树结构','/iam/v1/usergroups/tree','POST',1,2,3,0,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331501293570,1,'查询用户组详情','/iam/v1/usergroup','GET',1,2,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122690,1,'删除用户组','/iam/v1/usergroup','DELETE',1,2,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122692,1,'更新路由','/iam/v1/route/update','PUT',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037250,1,'更新应用','/iam/v1/application/update','PUT',1,4,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037252,1,'查询API详情','/iam/v1/api','GET',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951813,1,'更新分类','/iam/v1/api/category/update','PUT',1,1701432390324854786,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060676,1,'编辑用户','/iam/v1/user/update','POST',1,1,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060678,1,'创建用户','/iam/v1/user/create','POST',1,1,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975236,1,'创建路由','/iam/v1/route/create','POST',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975238,1,'更新角色','/iam/v1/role/update','POST',1,3,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975240,1,'角色路由授权','/iam/v1/role/resourcePermission/grant','POST',1,1701431351114797058,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084099,1,'/v1/role/resourcePermission/application/api','/iam/v1/role/resourcePermission/application/api','POST',1,1701431351114797058,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084103,1,'创建角色','/iam/v1/role/create','POST',1,3,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998661,1,'创建应用','/iam/v1/application/create','POST',1,4,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998663,1,'同步API','/iam/v1/api/sync','POST',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913219,1,'启用/禁用','/iam/v1/api/enable','POST',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913221,1,'新建分类','/iam/v1/api/category/create','POST',1,1701432390324854786,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913223,1,'分页查询用户信息','/iam/v1/users','GET',1,1,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936644,1,'查询路由详情','/iam/v1/route','GET',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936646,1,'获取路由的页面元素','/iam/v1/route/elements','GET',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936648,1,'分页查询','/iam/v1/roles','GET',1,3,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045509,1,'角色详情','/iam/v1/role','GET',1,3,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960069,1,'用户管理（内部调用） - 查询单个用户','/iam/v1/inner/users','GET',1,1701431351198683138,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960071,1,'用户管理（内部调用） - 查询用户是否具备API访问权限','/iam/v1/inner/users/has-api-resourcePermission','GET',1,1701431351198683138,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068930,1,'用户管理（内部调用） - 查询用户拥有的API权限','/iam/v1/inner/users/api-resourcePermission','GET',1,1701431351198683138,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068932,1,'查询所有Api','/iam/v1/inner/apis','GET',1,1701431351215460354,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068934,1,'API列表（全量）','/iam/v1/apis','GET',1,1701174623706116098,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177795,1,'删除用户','/iam/v1/user/delete','DELETE',1,1,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177797,1,'删除路由','/iam/v1/route/delete','DELETE',1,1701174623685144578,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898050,1,'删除角色','/iam/v1/role/delete','DELETE',1,3,3,0,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701432390475849729,1,'删除分类','/iam/v1/api/category/delete','DELETE',1,1701432390324854786,3,0,'2023-09-12 11:07:48','2023-09-12 11:07:48',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523692879874,3,'SKU-扣减库存','/commodity/v1/sku/stock/reduce','POST',1,1701471523453804546,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523747405825,3,'SKU-列表查询','/commodity/v1/sku/list','POST',1,1701471523453804546,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523818708993,3,'修改商品','/commodity/v1/brand/update','POST',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523860652033,3,'查询商品分页列表','/commodity/v1/brand/page','POST',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523881623553,3,'新建商品','/commodity/v1/brand/create','POST',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523919372290,3,'修改商品属性','/commodity/v1/attr/update','POST',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523940343810,3,'编辑属性模板','/commodity/v1/attr/template/update','POST',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523965509633,3,'查询属性模板分页列表','/commodity/v1/attr/template/page','POST',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523982286850,3,'创建属性模板','/commodity/v1/attr/template/create','POST',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524003258370,3,'查询商品属性分页列表','/commodity/v1/attr/page','POST',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524020035585,3,'修改商品属性组','/commodity/v1/attr/group/update','POST',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524036812802,3,'查询商品属性组分页列表','/commodity/v1/attr/group/page','POST',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524061978626,3,'创建商品属性组','/commodity/v1/attr/group/create','POST',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524116504578,3,'创建商品属性','/commodity/v1/attr/create','POST',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524141670401,3,'修改商品','/commodity/v1/admin/commodity/update','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524175224833,3,'查询分页列表','/commodity/v1/admin/commodity/search','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524192002049,3,'查询分页列表','/commodity/v1/admin/commodity/page','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524204584962,3,'创建商品','/commodity/v1/admin/commodity/create','POST',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524225556481,3,'修改商品类目','/commodity/v1/admin/category/update','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524246528001,3,'查询商品类目树形结构','/commodity/v1/admin/category/tree','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524263305217,3,'查询商品类目分页列表','/commodity/v1/admin/category/page','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524280082434,3,'创建商品类目','/commodity/v1/admin/category/create','POST',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524301053954,3,'查询商品详情','/commodity/v1/brand/info','GET',1,1701471523567050753,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524317831170,3,'查询属性模板详情','/commodity/v1/attr/template/info','GET',1,1701471523583827970,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524338802690,3,'查询商品属性详情','/commodity/v1/attr/info','GET',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524355579905,3,'查询商品属性组详情','/commodity/v1/attr/group/info','GET',1,1701471523604799489,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524376551426,3,'查询详情','/commodity/v1/admin/commodity/info','GET',1,1701471523621576706,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524393328642,3,'查询商品类目详情','/commodity/v1/admin/category/info','GET',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524410105857,3,'删除商品属性','/commodity/v1/attr','DELETE',1,1701471523575439361,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524422688769,3,'删除类目（包括其下所有子分类）','/commodity/v1/admin/category','DELETE',1,1701471523634159618,3,0,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276282886123522,1,'更新路由','/iam/v1/menus/update','PUT',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283074867202,1,'更新路由状态','/iam/v1/menus/status','PUT',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283141976066,1,'移动路由层级','/iam/v1/menus/parent','PUT',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283175530497,1,'角色路由授权','/iam/v1/role/permission/grant','POST',1,1701431351114797058,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283204890625,1,'/v1/role/permission/application/api','/iam/v1/role/permission/application/api','POST',1,1701431351114797058,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283238445057,1,'角色Api授权','/iam/v1/role/permission/api','POST',1,1701431351114797058,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283259416578,1,'查询路由详情','/iam/v1/menus','GET',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283318136833,1,'路由树形分页查询','/iam/v1/menus','POST',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283343302657,1,'创建路由','/iam/v1/menus/create','POST',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283364274177,1,'路由全量查询','/iam/v1/menus/all','POST',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283393634305,1,'用户管理（内部调用） - 查询单个用户','/iam/v1/users/user/simple','GET',1,1701431351198683138,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283427188737,1,'查询登录用户基本信息','/iam/v1/users/self','GET',1,1701431351181905921,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283464937474,1,'查询登录用户的菜单权限','/iam/v1/users/self/menus','GET',1,1701431351181905921,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283498491906,1,'查询登录用户的元素权限','/iam/v1/users/self/elements','GET',1,1701431351181905921,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283536240641,1,'用户管理（内部调用） - 查询用户是否具备API访问权限','/iam/v1/users/permission/has-api-permission','GET',1,1,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283632709634,1,'用户管理（内部调用） - 查询用户拥有的API权限','/iam/v1/users/permission/api-permission','GET',1,1,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283674652674,1,'用户管理（内部调用） - 查询用户是否具备API访问权限','/iam/v1/users/has-api-permission','GET',1,1701431351198683138,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283708207105,1,'用户管理（内部调用） - 查询用户拥有的API权限','/iam/v1/users/api-permission','GET',1,1701431351198683138,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283741761537,1,'用户管理（内部调用） - 查询单个用户','/iam/v1/user/simple','GET',1,1,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283771121665,1,'查询角色路由权限','/iam/v1/role/permission/menus','GET',1,1701431351114797058,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283800481794,1,'查询角色页面元素权限','/iam/v1/role/permission/elements','GET',1,1701431351114797058,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283838230529,1,'查询角色Api权限','/iam/v1/role/permission/apis','GET',1,1701431351114797058,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283880173569,1,'获取路由的页面元素','/iam/v1/menus/elements','GET',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276284064722945,1,'查询Api详情','/iam/v1/apis/details','GET',1,1701431351215460354,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276284094083073,1,'全量查询Api','/iam/v1/apis/all','GET',1,1701431351215460354,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_api` (`id`, `application_id`, `name`, `uri`, `method`, `status`, `category_id`, `auth_type`, `has_path_variable`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276284110860289,1,'删除路由','/iam/v1/menus/delete','DELETE',1,6,3,0,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);

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
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
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

INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,'用户管理','2021-01-26 13:56:54','2021-01-26 13:56:54',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'用户组管理','2021-01-26 13:56:58','2021-01-26 13:56:58',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'角色管理','2021-01-26 13:57:19','2021-01-26 13:57:19',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'应用管理','2021-01-26 13:57:24','2021-01-26 13:57:24',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'接口管理','2021-01-26 13:57:29','2021-01-26 13:57:29',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'路由管理','2021-01-26 13:57:36','2021-01-26 13:57:36',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,2,'订单管理','2021-01-26 14:41:03','2021-01-26 14:41:03',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'用户组管理','2021-01-26 14:41:17','2021-01-26 14:41:17',0,0,1);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'认证接口','2021-01-26 16:48:01','2021-01-26 16:48:01',0,0,1);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'认证管理','2021-01-27 11:00:34','2021-01-27 11:00:34',0,0,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701174623706116098,1,'API管理','2023-09-11 18:03:31','2023-09-11 18:03:31',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701174623727087617,1,'API类目管理','2023-09-11 18:03:31','2023-09-11 18:03:31',1,1,1701174623727087617);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924822900738,1,'role-resourcePermission-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924822900738);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924856455170,1,'user-self-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924856455170);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924873232386,1,'user-inner-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924873232386);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701176924885815298,1,'api-inner-controller','2023-09-11 18:12:40','2023-09-11 18:12:40',1,1,1701176924885815298);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351114797058,1,'角色权限管理','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351181905921,1,'登录用户相关接口','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351198683138,1,'用户接口（内部调用）','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701431351215460354,1,'Api接口（内部调用）','2023-09-12 11:03:40','2023-09-12 11:03:40',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701432390324854786,1,'API分类','2023-09-12 11:07:48','2023-09-12 11:07:48',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523453804546,3,'sku-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523567050753,3,'brand-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523575439361,3,'attr-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523583827970,3,'attr-template-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523604799489,3,'attr-group-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523621576706,3,'commodity-admin-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_api_category` (`id`, `application_id`, `name`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523634159618,3,'category-admin-controller','2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);

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
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
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

INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,'IAM','iam',1,1,'2024-05-28 09:59:50','2021-01-25 15:29:20',0,1,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,'研发效能','eop',1,1,'2021-05-26 13:16:09','2021-05-26 13:16:09',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,'商品中心','commodity',1,1,'2022-02-25 13:57:08','2022-02-25 13:57:08',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,'订单中心','order',1,1,'2022-02-25 14:00:27','2022-02-25 14:00:27',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,'支付中心','payment',1,1,'2022-02-25 14:12:28','2022-02-25 14:12:28',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,'物流中心','logistics',1,1,'2022-02-25 14:13:15','2022-02-25 14:13:15',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,'搜索中心','search',1,1,'2022-02-25 14:13:37','2022-02-25 14:13:37',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,'消息中心','message',1,1,'2022-02-25 14:13:53','2022-02-25 14:13:53',0,0,0);
INSERT INTO `iam_application` (`id`, `name`, `code`, `status`, `type`, `update_time`, `create_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,'网关服务','gateway',1,1,'2022-02-25 14:14:46','2022-02-25 14:14:46',0,0,0);

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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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

INSERT INTO `iam_element` (`id`, `route_id`, `name`, `type`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,76,'新增',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_element` (`id`, `route_id`, `name`, `type`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,76,'删除',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_element` (`id`, `route_id`, `name`, `type`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,76,'导出',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);

--
-- Table structure for table `iam_hierarchy`
--

DROP TABLE IF EXISTS `iam_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_hierarchy` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `application_id` bigint NOT NULL DEFAULT '0' COMMENT '应用id',
  `biz_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `biz_type` varchar(255) NOT NULL COMMENT '业务id',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '父级路由id',
  `level_path` varchar(45) NOT NULL DEFAULT '' COMMENT '层级路径，例如：0/1/2 代表该菜单是三级路由，上级路由的id是1,再上级的路由id是0',
  `level` int NOT NULL COMMENT '层级',
  `sequence` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_biz_type_biz_id` (`biz_type`,`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1767853053928058881 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='业务层级关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_hierarchy`
--

INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,2,'MENU',0,'2.',1,700,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,3,'MENU',0,'3.',1,500,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,4,'MENU',0,'4.',1,400,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,5,'MENU',0,'5.',1,300,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,6,'MENU',0,'6.',1,100,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,7,'MENU',0,'7.',1,600,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,8,'MENU',6,'6.8.',2,102,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,9,'MENU',6,'6.9.',2,101,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,13,'MENU',5,'5.13.',2,0,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (10,1,14,'MENU',5,'5.14.',2,0,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (11,1,15,'MENU',5,'5.15.',2,0,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (12,1,16,'MENU',5,'5.16.',2,0,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,17,'MENU',4,'4.17.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,18,'MENU',4,'4.18.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,19,'MENU',3,'3.19.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,20,'MENU',3,'3.20.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,22,'MENU',7,'7.22.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,23,'MENU',7,'7.23.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,24,'MENU',2,'2.24.',2,0,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,25,'MENU',2,'2.25.',2,0,'2020-12-24 16:02:53','2021-01-04 22:56:19',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (21,1,26,'MENU',16,'5.16.26.',2,0,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,27,'MENU',16,'5.16.27.',2,0,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,28,'MENU',25,'2.25.28.',3,0,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,29,'MENU',25,'2.25.29.',3,0,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,30,'MENU',25,'2.25.30.',3,0,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,32,'MENU',25,'2.25.32.',3,0,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,34,'MENU',16,'5.16.27.',3,0,'2020-12-24 23:55:30','2020-12-24 23:55:30',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,35,'MENU',0,'35.',1,800,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,36,'MENU',35,'35.36.',2,810,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,37,'MENU',35,'35.37.',2,820,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (31,1,38,'MENU',37,'35.37.38.',3,821,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,39,'MENU',37,'35.37.39.',3,822,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (33,1,40,'MENU',37,'35.37.40.',3,823,'2020-12-25 17:23:25','2021-01-04 22:54:33',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,42,'MENU',37,'35.37.42.',3,825,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,43,'MENU',37,'35.37.43.',3,826,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,44,'MENU',0,'44.',1,1,'2020-12-25 17:41:40','2021-01-02 22:57:31',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,45,'MENU',44,'44.45.',2,910,'2020-12-25 17:41:45','2021-01-03 16:18:16',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,57,'MENU',0,'57.',1,2,'2020-12-29 17:17:56','2021-01-03 16:29:31',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,58,'MENU',57,'57.58.',2,0,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,59,'MENU',57,'57.59.',2,0,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (41,1,60,'MENU',57,'57.60.',2,0,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,70,'MENU',69,'6.70.',2,0,'2020-12-30 17:00:33','2020-12-30 17:00:44',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,71,'MENU',44,'44.71.',2,0,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,72,'MENU',44,'44.72.',2,0,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,73,'MENU',25,'2.25.73.',3,0,'2021-01-04 22:57:11','2021-01-04 23:13:44',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (46,1,74,'MENU',44,'44.74.',2,0,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (47,1,75,'MENU',44,'44.75.',2,0,'2021-01-21 10:28:58','2021-01-21 10:28:58',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (48,1,76,'MENU',44,'44.76.',2,0,'2021-01-21 10:29:32','2021-01-21 10:29:32',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (49,2,77,'MENU',0,'77.',1,0,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (50,2,78,'MENU',77,'77.78.',2,0,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (51,3,1501071145118257154,'MENU',0,'1501071145118257154.',1,0,'2022-03-08 13:43:44','2022-04-18 11:26:50',1,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (52,3,1501090428636446722,'MENU',1501071145118257154,'1501071145118257154.1501090428636446722.',2,0,'2022-03-08 15:00:22','2022-03-08 15:34:58',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (53,3,1501091482874757122,'MENU',1501071145118257154,'1501071145118257154.1501091482874757122.',2,0,'2022-03-08 15:04:33','2022-04-14 08:16:02',1,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (54,3,1501099262847303682,'MENU',1501071145118257154,'1501071145118257154.1501099262847303682.',2,0,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (55,3,1507770690745217026,'MENU',1501071145118257154,'1501071145118257154.1507770690745217026.',2,0,'2022-03-27 01:25:20','2022-04-14 07:46:08',1,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (56,3,1514538324329037825,'MENU',1501071145118257154,'1501071145118257154.1514538324329037825.',2,0,'2022-04-14 17:37:30','2022-04-14 17:40:59',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (57,3,1514907533453660161,'MENU',0,'1514907533453660161.',1,0,'2022-04-15 18:04:36','2022-04-15 18:04:36',0,0,1514907533453660161);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (58,3,1515191685995098114,'MENU',0,'1515191685995098114.',1,0,'2022-04-16 12:54:46','2022-04-16 12:54:50',1,1,1515191685995098114);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (59,3,1515193173177856002,'MENU',0,'1515193173177856002.',1,0,'2022-04-16 12:59:38','2022-04-16 13:00:03',1,1,1515193173177856002);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (60,3,1515894902969925634,'MENU',1501071145118257154,'1501071145118257154.1515894902969925634.',2,0,'2022-04-18 11:28:03','2022-04-18 11:32:47',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (61,3,1515899373154271234,'MENU',1501071145118257154,'1501071145118257154.1515899373154271234.',2,0,'2022-04-18 11:45:49','2022-04-18 11:52:31',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (62,4,1557399233418543106,'MENU',0,'1557399233418543106.',1,0,'2022-08-11 00:11:27','2022-08-11 00:12:02',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (63,4,1557401007147761665,'MENU',1557399233418543106,'1557399233418543106.1557401007147761665.',2,0,'2022-08-11 00:18:30','2022-08-11 00:25:26',0,0,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (64,4,1626224210330099714,'MENU',1557399233418543106,'1557399233418543106.1626224210330099714.',2,0,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (65,1,1767121423635058688,'MENU',44,'',1,0,'2024-03-11 17:32:34','2024-03-11 18:01:19',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1767484616328392704,0,1767484616328392704,'MENU',0,'1767484616328392704/',1,0,'2024-03-12 17:36:05','2024-03-12 17:36:05',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1767491376616427520,0,1767491376616427520,'MENU',0,'1767491376616427520/',1,0,'2024-03-12 18:02:47','2024-03-12 18:02:47',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1767492286608429056,0,1767492286608429056,'MENU',0,'1767492286608429056/',1,0,'2024-03-12 18:07:39','2024-03-12 18:07:39',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1767739152934678528,0,1767739152934678528,'MENU',0,'1767739152934678528/',1,0,'2024-03-13 10:27:42','2024-03-13 10:27:42',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1767852927343964160,8,1767852927343964160,'MENU',0,'1767852927343964160/',1,0,'2024-03-13 17:59:48','2024-03-13 17:59:48',1,1,0);
INSERT INTO `iam_hierarchy` (`id`, `application_id`, `biz_id`, `biz_type`, `pid`, `level_path`, `level`, `sequence`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1767853053928058880,8,1767853053928058880,'MENU',1767852927343964160,'1767852927343964160/1767853053928058880/',2,0,'2024-03-13 17:59:48','2024-03-13 17:59:48',1,1,0);

--
-- Table structure for table `iam_menu`
--

DROP TABLE IF EXISTS `iam_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_menu` (
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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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
-- Dumping data for table `iam_menu`
--

INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'个人页','account','RouteView',0,'2.',1,'','user',0,1,700,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'结果页','result','PageView',0,'3.',1,'','check-circle-o',0,1,500,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'详情页','profile','RouteView',0,'4.',1,'','profile',0,1,400,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'列表页','list','RouteView',0,'5.',1,'','table',0,1,300,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'仪表盘','dashboard','RouteView',0,'6.',1,'','dashboard',0,1,100,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'异常页','exception','RouteView',0,'7.',1,'','warning',0,1,600,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'工作台','workplace','Workplace',6,'6.8.',2,'/dashboard/workplace','',0,1,102,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'分析页','Analysis','Analysis',6,'6.9.',2,'/dashboard/analysis/:pageNo([1-9]\\\\d*)?','',0,1,101,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'查询表格','table-list','TableList',5,'5.13.',2,'/list/table-list/:pageNo([1-9]\\\\d*)?','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'标准列表','basic-list','StandardList',5,'5.14.',2,'/list/basic-list','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'卡片列表','card','CardList',5,'5.15.',2,'/list/card','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'搜索列表','search','SearchLayout',5,'5.16.',2,'/list/search','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'基础详情页','basic','ProfileBasic',4,'4.17.',2,'/profile/basic','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'高级详情页','advanced','ProfileAdvanced',4,'4.18.',2,'/profile/advanced','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'成功','success','ResultSuccess',3,'3.19.',2,'/result/success','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'失败','fail','ResultFail',3,'3.20.',2,'/result/fail','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'404','404','Exception404',7,'7.22.',2,'/exception/404','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'500','500','Exception500',7,'7.23.',2,'/exception/500','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'个人中心','center','AccountCenter',2,'2.24.',2,'/account/center','',0,2,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'个人设置','settings','AccountSettings',2,'2.25.',2,'/account/settings','',1,1,0,1,'2020-12-24 16:02:53','2021-01-04 22:56:19',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'搜索列表（项目）','project','SearchProjects',16,'5.16.26.',2,'/list/search/project','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'搜索列表（应用）','application','SearchApplications',16,'5.16.27.',2,'/list/search/application','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'基本设置','BasicSettings','BasicSettings',25,'2.25.28.',3,'/account/settings/basic','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'安全设置','SecuritySettings','SecuritySettings',25,'2.25.29.',3,'/account/settings/security','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'个性化设置','CustomSettings','CustomSettings',25,'2.25.30.',3,'/account/settings/custom','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'新消息通知','NotificationSettings','NotificationSettings',25,'2.25.32.',3,'/account/settings/notification','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'搜索列表（文章）','article','SearchArticles',16,'5.16.27.',3,'/list/search/article','',0,1,0,1,'2020-12-24 23:55:30','2020-12-24 23:55:30',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'其他组件','other','PageView',0,'35.',1,'','slack',0,1,800,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'IconSelector','TestIconSelect','EditList',35,'35.36.',2,'/other/icon-selector','tool',0,1,810,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'业务布局','bizLayout','RouteView',35,'35.37.',2,'','layout',0,1,820,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'树目录表格','TreeList','TreeList',37,'35.37.38.',3,'/other/list/tree-list','',0,1,821,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'内联编辑表格','EditList','EditList',37,'35.37.39.',3,'/other/list/edit-table','',0,1,822,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'权限列表','PermissionList','PermissionList',37,'35.37.40.',3,'/other/list/system-resourcePermission','',0,1,823,1,'2020-12-25 17:23:25','2021-01-04 22:54:33',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'角色列表','RoleList','RoleList',37,'35.37.42.',3,'/other/list/role-list','',0,1,825,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'角色列表2','SystemRole','SystemRole',37,'35.37.43.',3,'/other/list/system-role','',0,1,826,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'身份与访问','resourcePermission','RouteView',0,'44.',1,'/resourcePermission','slack',0,1,1,1,'2020-12-25 17:41:40','2021-01-02 22:57:31',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'路由管理','resourcePermission:route','PermissionRoute',44,'44.45.',2,'/resourcePermission/route','',0,2,910,1,'2020-12-25 17:41:45','2021-01-03 16:18:16',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (57,1,'表单页','form','RouteView',0,'57.',1,'','form',0,1,2,1,'2020-12-29 17:17:56','2021-01-03 16:29:31',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (58,1,'高级表单','advanced-form','AdvanceForm',57,'57.58.',2,'/form/advanced-form','',0,1,0,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (59,1,'分步表单','step-form','StepForm',57,'57.59.',2,'/form/step-form','',0,1,0,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (60,1,'基础表单','basic-form','BasicForm',57,'57.60.',2,'/form/base-form','',0,1,0,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (70,1,'测试子路由','3213','',69,'6.70.',2,'','',0,1,0,1,'2020-12-30 17:00:33','2020-12-30 17:00:44',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (71,1,'用户管理','resourcePermission:user','PermissionUser',44,'44.71.',2,'/resourcePermission/user','',0,2,0,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (72,1,'用户组管理','resourcePermission:usergroup','PermissionUserGroup',44,'44.72.',2,'/resourcePermission/usergroup','',0,2,0,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (73,1,'账号绑定','BindingSettings','BindingSettings',25,'2.25.73.',3,'/account/settings/binding','',0,1,0,1,'2021-01-04 22:57:11','2021-01-04 23:13:44',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (74,1,'角色管理','resourcePermission:role','PermissionRole',44,'44.74.',2,'/resourcePermission/role','',0,2,0,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (75,1,'应用管理','resourcePermission:application','PermissionApplication',44,'44.75.',2,'/resourcePermission/application','',0,2,0,1,'2021-01-21 10:28:58','2021-01-21 10:28:58',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (76,1,'接口管理','resourcePermission:interface','PermissionApi',44,'44.76.',2,'/resourcePermission/interface','',0,2,0,1,'2021-01-21 10:29:32','2021-01-21 10:29:32',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (77,2,'研发效能','cop','RouteView',0,'77.',1,'/cop','project',0,1,0,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (78,2,'代码工程','cop:code-project','CodeProject',77,'77.78.',2,'/cop/code-project','',0,1,0,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501071145118257154,3,'商品中心','product','RouteView',0,'1501071145118257154.',1,'','slack',0,1,0,1,'2022-03-08 13:43:44','2022-04-18 11:26:50',1,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501090428636446722,3,'商品分类','product:category','GoodsCategory',1501071145118257154,'1501071145118257154.1501090428636446722.',2,'/goods/category','',0,2,0,1,'2022-03-08 15:00:22','2022-03-08 15:34:58',1,1,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501091482874757122,3,'商品属性','product:attr:template','GoodsAttrTemplate',1501071145118257154,'1501071145118257154.1501091482874757122.',2,'/goods/attr/template','',0,2,0,1,'2022-03-08 15:04:33','2022-04-14 08:16:02',1,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501099262847303682,3,'商品品牌','product:brand','GoodsBrand',1501071145118257154,'1501071145118257154.1501099262847303682.',2,'/goods/brand','',0,2,0,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1507770690745217026,3,'商品属性组','product:attr:group','GoodsAttrGroup',1501071145118257154,'1501071145118257154.1507770690745217026.',2,'/goods/attr/group','',0,3,0,1,'2022-03-27 01:25:20','2022-04-14 07:46:08',1,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1514538324329037825,3,'商品规格属性','product:attr','GoodsAttr',1501071145118257154,'1501071145118257154.1514538324329037825.',2,'/goods/attr','',0,3,0,1,'2022-04-14 17:37:30','2022-04-14 17:40:59',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1514907533453660161,3,'132','123','BasicLayout',0,'1514907533453660161.',1,'123','',0,1,0,1,'2022-04-15 18:04:36','2022-04-15 18:04:36',0,0,1514907533453660161);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515191685995098114,3,'1','1','404',0,'1515191685995098114.',1,'1','1',0,1,0,1,'2022-04-16 12:54:46','2022-04-16 12:54:50',1,1,1515191685995098114);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515193173177856002,3,'123','31','404',0,'1515193173177856002.',1,'','',0,1,0,1,'2022-04-16 12:59:38','2022-04-16 13:00:03',1,1,1515193173177856002);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515894902969925634,3,'商品管理','goods','Goods',1501071145118257154,'1501071145118257154.1515894902969925634.',2,'/goods','',0,2,0,1,'2022-04-18 11:28:03','2022-04-18 11:32:47',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515899373154271234,3,'商品编辑表单','goodsForm','GoodsForm',1501071145118257154,'1501071145118257154.1515899373154271234.',2,'/goods/form','',0,3,0,1,'2022-04-18 11:45:49','2022-04-18 11:52:31',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557399233418543106,4,'订单中心','order','RouteView',0,'1557399233418543106.',1,'/order','slack',0,1,0,1,'2022-08-11 00:11:27','2022-08-11 00:12:02',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557401007147761665,4,'订单管理','order:list','Order',1557399233418543106,'1557399233418543106.1557401007147761665.',2,'/order/list','slack',0,2,0,1,'2022-08-11 00:18:30','2022-08-11 00:25:26',0,0,0);
INSERT INTO `iam_menu` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1626224210330099714,4,'订单详情','order:detail','OrderDetail',1557399233418543106,'1557399233418543106.1626224210330099714.',2,'/order/:id','',0,2,0,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);

--
-- Table structure for table `iam_menu_bak`
--

DROP TABLE IF EXISTS `iam_menu_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_menu_bak` (
  `id` bigint unsigned DEFAULT NULL,
  `application_id` bigint unsigned DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `component` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  `level_path` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `path` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hide_children` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `creator` bigint unsigned DEFAULT NULL,
  `modifier` bigint unsigned DEFAULT NULL,
  `is_deleted` bigint unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_menu_bak`
--

INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'个人页','account','RouteView',0,'2.',1,'','user',0,1,700,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'结果页','result','PageView',0,'3.',1,'','check-circle-o',0,1,500,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'详情页','profile','RouteView',0,'4.',1,'','profile',0,1,400,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'列表页','list','RouteView',0,'5.',1,'','table',0,1,300,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'仪表盘','dashboard','RouteView',0,'6.',1,'','dashboard',0,1,100,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'异常页','exception','RouteView',0,'7.',1,'','warning',0,1,600,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'工作台','workplace','Workplace',6,'6.8.',2,'/dashboard/workplace','',0,1,102,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'分析页','Analysis','Analysis',6,'6.9.',2,'/dashboard/analysis/:pageNo([1-9]\\\\d*)?','',0,1,101,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'查询表格','table-list','TableList',5,'5.13.',2,'/list/table-list/:pageNo([1-9]\\\\d*)?','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'标准列表','basic-list','StandardList',5,'5.14.',2,'/list/basic-list','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'卡片列表','card','CardList',5,'5.15.',2,'/list/card','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'搜索列表','search','SearchLayout',5,'5.16.',2,'/list/search','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'基础详情页','basic','ProfileBasic',4,'4.17.',2,'/profile/basic','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'高级详情页','advanced','ProfileAdvanced',4,'4.18.',2,'/profile/advanced','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'成功','success','ResultSuccess',3,'3.19.',2,'/result/success','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'失败','fail','ResultFail',3,'3.20.',2,'/result/fail','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'404','404','Exception404',7,'7.22.',2,'/exception/404','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'500','500','Exception500',7,'7.23.',2,'/exception/500','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'个人中心','center','AccountCenter',2,'2.24.',2,'/account/center','',0,2,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'个人设置','settings','AccountSettings',2,'2.25.',2,'/account/settings','',1,1,0,1,'2020-12-24 16:02:53','2021-01-04 22:56:19',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'搜索列表（项目）','project','SearchProjects',16,'5.16.26.',2,'/list/search/project','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'搜索列表（应用）','application','SearchApplications',16,'5.16.27.',2,'/list/search/application','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'基本设置','BasicSettings','BasicSettings',25,'2.25.28.',3,'/account/settings/basic','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'安全设置','SecuritySettings','SecuritySettings',25,'2.25.29.',3,'/account/settings/security','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'个性化设置','CustomSettings','CustomSettings',25,'2.25.30.',3,'/account/settings/custom','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'新消息通知','NotificationSettings','NotificationSettings',25,'2.25.32.',3,'/account/settings/notification','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'搜索列表（文章）','article','SearchArticles',16,'5.16.27.',3,'/list/search/article','',0,1,0,1,'2020-12-24 23:55:30','2020-12-24 23:55:30',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'其他组件','other','PageView',0,'35.',1,'','slack',0,1,800,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'IconSelector','TestIconSelect','EditList',35,'35.36.',2,'/other/icon-selector','tool',0,1,810,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'业务布局','bizLayout','RouteView',35,'35.37.',2,'','layout',0,1,820,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'树目录表格','TreeList','TreeList',37,'35.37.38.',3,'/other/list/tree-list','',0,1,821,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'内联编辑表格','EditList','EditList',37,'35.37.39.',3,'/other/list/edit-table','',0,1,822,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'权限列表','PermissionList','PermissionList',37,'35.37.40.',3,'/other/list/system-resourcePermission','',0,1,823,1,'2020-12-25 17:23:25','2021-01-04 22:54:33',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'角色列表','RoleList','RoleList',37,'35.37.42.',3,'/other/list/role-list','',0,1,825,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'角色列表2','SystemRole','SystemRole',37,'35.37.43.',3,'/other/list/system-role','',0,1,826,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'IAM','iam','RouteView',0,'44.',1,'/iam','UserOutlined',0,1,1,1,'2020-12-25 17:41:40','2021-01-02 22:57:31',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'路由管理','iam:menu','PermissionRoute',44,'44.45.',2,'/iam/menu','MenuOutlined',0,2,910,1,'2020-12-25 17:41:45','2021-01-03 16:18:16',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (57,1,'表单页','form','RouteView',0,'57.',1,'','form',0,1,2,1,'2020-12-29 17:17:56','2021-01-03 16:29:31',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (58,1,'高级表单','advanced-form','AdvanceForm',57,'57.58.',2,'/form/advanced-form','',0,1,0,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (59,1,'分步表单','step-form','StepForm',57,'57.59.',2,'/form/step-form','',0,1,0,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (60,1,'基础表单','basic-form','BasicForm',57,'57.60.',2,'/form/base-form','',0,1,0,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (71,1,'用户管理','iam:user','PermissionUser',44,'44.71.',2,'/iam/user','UserAddOutlined',0,2,0,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (72,1,'用户组管理','iam:usergroup','PermissionUserGroup',44,'44.72.',2,'/iam/usergroup','UsergroupAddOutlined',0,2,0,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (73,1,'账号绑定','BindingSettings','BindingSettings',25,'2.25.73.',3,'/account/settings/binding','',0,1,0,1,'2021-01-04 22:57:11','2021-01-04 23:13:44',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (74,1,'角色管理','iam:role','PermissionRole',44,'44.74.',2,'/iam/role','UserOutlined',0,2,0,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (75,1,'应用管理','iam:application','/iam/application/PermissionApplication',44,'44.75.',2,'/iam/application','AppstoreOutlined',0,2,0,1,'2021-01-21 10:28:58','2021-01-21 10:28:58',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (76,1,'接口管理','iam:interface','PermissionApi',44,'44.76.',2,'/iam/interface','ApiOutlined',0,2,0,1,'2021-01-21 10:29:32','2021-01-21 10:29:32',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (77,2,'研发效能','cop','RouteView',0,'77.',1,'/cop','project',0,1,0,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (78,2,'代码工程','cop:code-project','CodeProject',77,'77.78.',2,'/cop/code-project','',0,1,0,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501071145118257154,3,'商品中心','product','RouteView',0,'1501071145118257154.',1,'/product','ShopOutlined',0,1,0,1,'2022-03-08 13:43:44','2022-04-18 11:26:50',1,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501090428636446722,3,'商品分类','product:category','GoodsCategory',1501071145118257154,'1501071145118257154.1501090428636446722.',2,'/goods/category','',0,2,0,1,'2022-03-08 15:00:22','2022-03-08 15:34:58',1,1,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501091482874757122,3,'商品属性','product:attr:template','GoodsAttrTemplate',1501071145118257154,'1501071145118257154.1501091482874757122.',2,'/goods/attr/template','',0,2,0,1,'2022-03-08 15:04:33','2022-04-14 08:16:02',1,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501099262847303682,3,'商品品牌','product:brand','GoodsBrand',1501071145118257154,'1501071145118257154.1501099262847303682.',2,'/goods/brand','',0,2,0,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1507770690745217026,3,'商品属性组','product:attr:group','GoodsAttrGroup',1501071145118257154,'1501071145118257154.1507770690745217026.',2,'/goods/attr/group','',0,3,0,1,'2022-03-27 01:25:20','2022-04-14 07:46:08',1,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1514538324329037825,3,'商品规格属性','product:attr','GoodsAttr',1501071145118257154,'1501071145118257154.1514538324329037825.',2,'/goods/attr','',0,3,0,1,'2022-04-14 17:37:30','2022-04-14 17:40:59',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515894902969925634,3,'商品管理','goods','Goods',1501071145118257154,'1501071145118257154.1515894902969925634.',2,'/goods','',0,2,0,1,'2022-04-18 11:28:03','2022-04-18 11:32:47',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515899373154271234,3,'商品编辑表单','goodsForm','GoodsForm',1501071145118257154,'1501071145118257154.1515899373154271234.',2,'/goods/form','',0,3,0,1,'2022-04-18 11:45:49','2022-04-18 11:52:31',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557399233418543106,4,'订单中心','order','RouteView',0,'1557399233418543106.',1,'/order','ShoppingTwotone',0,1,0,1,'2022-08-11 00:11:27','2022-08-11 00:12:02',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557401007147761665,4,'订单管理','order:list','Order',1557399233418543106,'1557399233418543106.1557401007147761665.',2,'/order/list','slack',0,2,0,1,'2022-08-11 00:18:30','2022-08-11 00:25:26',0,0,0);
INSERT INTO `iam_menu_bak` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1626224210330099714,4,'订单详情','order:detail','OrderDetail',1557399233418543106,'1557399233418543106.1626224210330099714.',2,'/order/:id','',0,2,0,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);

--
-- Table structure for table `iam_menu_element`
--

DROP TABLE IF EXISTS `iam_menu_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_menu_element` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` bigint unsigned NOT NULL COMMENT '所属菜单id，关联menu.id',
  `name` varchar(45) NOT NULL COMMENT '元素名称',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '元素类型 1-按钮；2-层；',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_is_deleted` (`is_deleted`),
  KEY `idx_route_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='页面元素表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_menu_element`
--

INSERT INTO `iam_menu_element` (`id`, `menu_id`, `name`, `type`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,76,'新增',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_menu_element` (`id`, `menu_id`, `name`, `type`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,76,'删除',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_menu_element` (`id`, `menu_id`, `name`, `type`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,76,'导出',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);

--
-- Table structure for table `iam_menu_v2`
--

DROP TABLE IF EXISTS `iam_menu_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iam_menu_v2` (
  `id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'id',
  `application_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路由标题',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '路由编码',
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组件名',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '父级路由id',
  `level_path` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '路由层级路径，例如：0.1.2 代表该菜单是三级路由，上级路由的id是1,再上级的路由id是0',
  `level` int NOT NULL COMMENT '路由层级',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '路由path',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图标',
  `hide_children` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏子路由 0-否 1-是',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '路由类型 1：菜单路由 2：页面路由 3: 隐藏页面路由',
  `sequence` int NOT NULL DEFAULT '0' COMMENT '排序序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限状态 1-已启用；2-已禁用；',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_menu_v2`
--

INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'个人页','account','RouteView',0,'2.',1,'','user',0,1,700,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'结果页','result','PageView',0,'3.',1,'','check-circle-o',0,1,500,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'详情页','profile','RouteView',0,'4.',1,'','profile',0,1,400,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'列表页','list','RouteView',0,'5.',1,'','table',0,1,300,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'仪表盘','dashboard','RouteView',0,'6.',1,'','dashboard',0,1,100,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'异常页','exception','RouteView',0,'7.',1,'','warning',0,1,600,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'工作台','workplace','Workplace',6,'6.8.',2,'/dashboard/workplace','',0,1,102,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'分析页','Analysis','Analysis',6,'6.9.',2,'/dashboard/analysis/:pageNo([1-9]\\\\d*)?','',0,1,101,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'查询表格','table-list','TableList',5,'5.13.',2,'/list/table-list/:pageNo([1-9]\\\\d*)?','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'标准列表','basic-list','StandardList',5,'5.14.',2,'/list/basic-list','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'卡片列表','card','CardList',5,'5.15.',2,'/list/card','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'搜索列表','search','SearchLayout',5,'5.16.',2,'/list/search','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'基础详情页','basic','ProfileBasic',4,'4.17.',2,'/profile/basic','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'高级详情页','advanced','ProfileAdvanced',4,'4.18.',2,'/profile/advanced','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'成功','success','ResultSuccess',3,'3.19.',2,'/result/success','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'失败','fail','ResultFail',3,'3.20.',2,'/result/fail','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'404','404','Exception404',7,'7.22.',2,'/exception/404','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'500','500','Exception500',7,'7.23.',2,'/exception/500','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'个人中心','center','AccountCenter',2,'2.24.',2,'/account/center','',0,2,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'个人设置','settings','AccountSettings',2,'2.25.',2,'/account/settings','',1,1,0,1,'2020-12-24 16:02:53','2021-01-04 22:56:19',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'搜索列表（项目）','project','SearchProjects',16,'5.16.26.',2,'/list/search/project','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'搜索列表（应用）','application','SearchApplications',16,'5.16.27.',2,'/list/search/application','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'基本设置','BasicSettings','BasicSettings',25,'2.25.28.',3,'/account/settings/basic','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'安全设置','SecuritySettings','SecuritySettings',25,'2.25.29.',3,'/account/settings/security','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'个性化设置','CustomSettings','CustomSettings',25,'2.25.30.',3,'/account/settings/custom','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'新消息通知','NotificationSettings','NotificationSettings',25,'2.25.32.',3,'/account/settings/notification','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'搜索列表（文章）','article','SearchArticles',16,'5.16.27.',3,'/list/search/article','',0,1,0,1,'2020-12-24 23:55:30','2020-12-24 23:55:30',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'其他组件','other','PageView',0,'35.',1,'','slack',0,1,800,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'IconSelector','TestIconSelect','EditList',35,'35.36.',2,'/other/icon-selector','tool',0,1,810,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'业务布局','bizLayout','RouteView',35,'35.37.',2,'','layout',0,1,820,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'树目录表格','TreeList','TreeList',37,'35.37.38.',3,'/other/list/tree-list','',0,1,821,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'内联编辑表格','EditList','EditList',37,'35.37.39.',3,'/other/list/edit-table','',0,1,822,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'权限列表','PermissionList','PermissionList',37,'35.37.40.',3,'/other/list/system-resourcePermission','',0,1,823,1,'2020-12-25 17:23:25','2021-01-04 22:54:33',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'角色列表','RoleList','RoleList',37,'35.37.42.',3,'/other/list/role-list','',0,1,825,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'角色列表2','SystemRole','SystemRole',37,'35.37.43.',3,'/other/list/system-role','',0,1,826,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'IAM','iam','RouteView',0,'44.',1,'/iam','UserOutlined',0,1,1,1,'2020-12-25 17:41:40','2021-01-02 22:57:31',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'路由管理','iam:menu','PermissionRoute',44,'44.45.',2,'/iam/menu','MenuOutlined',0,2,910,1,'2020-12-25 17:41:45','2021-01-03 16:18:16',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (57,1,'表单页','form','RouteView',0,'57.',1,'','form',0,1,2,1,'2020-12-29 17:17:56','2021-01-03 16:29:31',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (58,1,'高级表单','advanced-form','AdvanceForm',57,'57.58.',2,'/form/advanced-form','',0,1,0,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (59,1,'分步表单','step-form','StepForm',57,'57.59.',2,'/form/step-form','',0,1,0,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (60,1,'基础表单','basic-form','BasicForm',57,'57.60.',2,'/form/base-form','',0,1,0,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (71,1,'用户管理','iam:user','PermissionUser',44,'44.71.',2,'/iam/user','UserAddOutlined',0,2,0,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (72,1,'用户组管理','iam:usergroup','PermissionUserGroup',44,'44.72.',2,'/iam/usergroup','UsergroupAddOutlined',0,2,0,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (73,1,'账号绑定','BindingSettings','BindingSettings',25,'2.25.73.',3,'/account/settings/binding','',0,1,0,1,'2021-01-04 22:57:11','2021-01-04 23:13:44',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (74,1,'角色管理','iam:role','PermissionRole',44,'44.74.',2,'/iam/role','UserOutlined',0,2,0,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (75,1,'应用管理','iam:application','/iam/application/PermissionApplication',44,'44.75.',2,'/application','AppstoreOutlined',0,2,0,1,'2021-01-21 10:28:58','2021-01-21 10:28:58',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (76,1,'接口管理','iam:interface','PermissionApi',44,'44.76.',2,'/iam/interface','ApiOutlined',0,2,0,1,'2021-01-21 10:29:32','2021-01-21 10:29:32',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (77,2,'研发效能','cop','RouteView',0,'77.',1,'/cop','project',0,1,0,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (78,2,'代码工程','cop:code-project','CodeProject',77,'77.78.',2,'/cop/code-project','',0,1,0,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501071145118257154,3,'商品中心','product','RouteView',0,'1501071145118257154.',1,'/product','ShopOutlined',0,1,0,1,'2022-03-08 13:43:44','2022-04-18 11:26:50',1,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501090428636446722,3,'商品分类','product:category','GoodsCategory',1501071145118257154,'1501071145118257154.1501090428636446722.',2,'/goods/category','',0,2,0,1,'2022-03-08 15:00:22','2022-03-08 15:34:58',1,1,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501091482874757122,3,'商品属性','product:attr:template','GoodsAttrTemplate',1501071145118257154,'1501071145118257154.1501091482874757122.',2,'/goods/attr/template','',0,2,0,1,'2022-03-08 15:04:33','2022-04-14 08:16:02',1,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501099262847303682,3,'商品品牌','product:brand','GoodsBrand',1501071145118257154,'1501071145118257154.1501099262847303682.',2,'/goods/brand','',0,2,0,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1507770690745217026,3,'商品属性组','product:attr:group','GoodsAttrGroup',1501071145118257154,'1501071145118257154.1507770690745217026.',2,'/goods/attr/group','',0,3,0,1,'2022-03-27 01:25:20','2022-04-14 07:46:08',1,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1514538324329037825,3,'商品规格属性','product:attr','GoodsAttr',1501071145118257154,'1501071145118257154.1514538324329037825.',2,'/goods/attr','',0,3,0,1,'2022-04-14 17:37:30','2022-04-14 17:40:59',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515894902969925634,3,'商品管理','goods','Goods',1501071145118257154,'1501071145118257154.1515894902969925634.',2,'/goods','',0,2,0,1,'2022-04-18 11:28:03','2022-04-18 11:32:47',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515899373154271234,3,'商品编辑表单','goodsForm','GoodsForm',1501071145118257154,'1501071145118257154.1515899373154271234.',2,'/goods/form','',0,3,0,1,'2022-04-18 11:45:49','2022-04-18 11:52:31',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557399233418543106,4,'订单中心','order','RouteView',0,'1557399233418543106.',1,'/order','ShoppingTwotone',0,1,0,1,'2022-08-11 00:11:27','2022-08-11 00:12:02',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557401007147761665,4,'订单管理','order:list','Order',1557399233418543106,'1557399233418543106.1557401007147761665.',2,'/order/list','slack',0,2,0,1,'2022-08-11 00:18:30','2022-08-11 00:25:26',0,0,0);
INSERT INTO `iam_menu_v2` (`id`, `application_id`, `name`, `code`, `component`, `pid`, `level_path`, `level`, `path`, `icon`, `hide_children`, `type`, `sequence`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1626224210330099714,4,'订单详情','order:detail','OrderDetail',1557399233418543106,'1557399233418543106.1626224210330099714.',2,'/order/:id','',0,2,0,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);

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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  UNIQUE KEY `uk_type_resource_id` (`type`,`resource_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1795276284123443202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_permission`
--

INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,1,'FR00001','FRONT_ROUTE',1,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,1,'FR00002','FRONT_ROUTE',2,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (3,1,'FR00003','FRONT_ROUTE',3,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (4,1,'FR00004','FRONT_ROUTE',4,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (5,1,'FR00005','FRONT_ROUTE',5,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (6,1,'FR00006','FRONT_ROUTE',6,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (7,1,'FR00007','FRONT_ROUTE',7,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (8,1,'FR00008','FRONT_ROUTE',8,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (9,1,'FR00009','FRONT_ROUTE',9,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (10,1,'FR00010','FRONT_ROUTE',10,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (11,1,'FR00011','FRONT_ROUTE',11,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (12,1,'FR00012','FRONT_ROUTE',12,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (13,1,'FR00013','FRONT_ROUTE',13,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (14,1,'FR00014','FRONT_ROUTE',14,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (15,1,'FR00015','FRONT_ROUTE',15,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (16,1,'FR00016','FRONT_ROUTE',16,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (17,1,'FR00017','FRONT_ROUTE',17,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (18,1,'FR00018','FRONT_ROUTE',18,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (19,1,'FR00019','FRONT_ROUTE',19,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (20,1,'FR00020','FRONT_ROUTE',20,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (21,1,'FR00021','FRONT_ROUTE',21,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (22,1,'FR00022','FRONT_ROUTE',22,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (23,1,'FR00023','FRONT_ROUTE',23,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (24,1,'FR00024','FRONT_ROUTE',24,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (25,1,'FR00025','FRONT_ROUTE',25,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (26,1,'FR00026','FRONT_ROUTE',26,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (27,1,'FR00027','FRONT_ROUTE',27,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (28,1,'FR00028','FRONT_ROUTE',28,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (29,1,'FR00029','FRONT_ROUTE',29,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (30,1,'FR00030','FRONT_ROUTE',30,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (31,1,'FR00031','FRONT_ROUTE',31,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (32,1,'FR00032','FRONT_ROUTE',32,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (33,1,'FR00033','FRONT_ROUTE',33,1,'2020-12-24 18:28:38','2020-12-24 18:28:38',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (34,1,'FR00035','FRONT_ROUTE',35,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (35,1,'FR00036','FRONT_ROUTE',36,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (36,1,'FR00037','FRONT_ROUTE',37,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (37,1,'FR00038','FRONT_ROUTE',38,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (38,1,'FR00039','FRONT_ROUTE',39,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (39,1,'FR00040','FRONT_ROUTE',40,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (40,1,'FR00041','FRONT_ROUTE',41,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (41,1,'FR00042','FRONT_ROUTE',42,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (42,1,'FR00043','FRONT_ROUTE',43,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (43,1,'FR00044','FRONT_ROUTE',44,1,'2020-12-25 17:41:40','2020-12-25 17:41:40',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (44,1,'FR00045','FRONT_ROUTE',45,1,'2020-12-25 17:41:45','2020-12-25 17:41:45',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (45,1,'FR00046','FRONT_ROUTE',46,1,'2020-12-29 14:52:49','2020-12-29 14:52:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (46,1,'FR00047','FRONT_ROUTE',47,1,'2020-12-29 15:51:28','2020-12-29 15:51:28',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (47,1,'FR00048','FRONT_ROUTE',48,1,'2020-12-29 15:52:58','2020-12-29 15:52:58',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (48,1,'FR00049','FRONT_ROUTE',49,1,'2020-12-29 16:34:36','2020-12-29 16:34:36',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (49,1,'FR00050','FRONT_ROUTE',50,1,'2020-12-29 16:58:00','2020-12-29 16:58:00',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (50,1,'FR00051','FRONT_ROUTE',51,1,'2020-12-29 16:58:45','2020-12-29 16:58:45',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (51,1,'FR00052','FRONT_ROUTE',52,1,'2020-12-29 17:01:27','2020-12-29 17:01:27',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (52,1,'FR00053','FRONT_ROUTE',53,1,'2020-12-29 17:01:31','2020-12-29 17:01:31',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (53,1,'FR00054','FRONT_ROUTE',54,1,'2020-12-29 17:05:29','2020-12-29 17:05:29',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (54,1,'FR00055','FRONT_ROUTE',55,1,'2020-12-29 17:05:41','2020-12-29 17:05:41',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (55,1,'FR00056','FRONT_ROUTE',56,1,'2020-12-29 17:05:50','2020-12-29 17:05:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (56,1,'FR00057','FRONT_ROUTE',57,1,'2020-12-29 17:17:56','2020-12-29 17:17:56',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (57,1,'FR00058','FRONT_ROUTE',58,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (58,1,'FR00059','FRONT_ROUTE',59,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (59,1,'FR00060','FRONT_ROUTE',60,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (60,1,'FR00061','FRONT_ROUTE',61,1,'2020-12-29 17:36:25','2020-12-29 17:36:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (61,1,'FR00062','FRONT_ROUTE',62,1,'2020-12-29 17:36:40','2020-12-29 17:36:40',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (62,1,'FR00063','FRONT_ROUTE',63,1,'2020-12-29 17:36:49','2020-12-29 17:36:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (63,1,'FR00064','FRONT_ROUTE',64,1,'2020-12-29 18:11:17','2020-12-29 18:11:17',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (64,1,'FR00065','FRONT_ROUTE',65,1,'2020-12-29 18:11:57','2020-12-29 18:11:57',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (65,1,'FR00066','FRONT_ROUTE',66,1,'2020-12-29 18:30:10','2020-12-29 18:30:10',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (66,1,'FR00067','FRONT_ROUTE',67,1,'2020-12-30 16:37:49','2020-12-30 16:37:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (67,1,'FR00068','FRONT_ROUTE',68,1,'2020-12-30 16:40:51','2020-12-30 16:40:51',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (68,1,'FR00069','FRONT_ROUTE',69,1,'2020-12-30 17:00:20','2020-12-30 17:00:20',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (69,1,'FR00070','FRONT_ROUTE',70,1,'2020-12-30 17:00:33','2020-12-30 17:00:33',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (70,1,'FR00071','FRONT_ROUTE',71,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (71,1,'FR00072','FRONT_ROUTE',72,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (72,1,'FR00073','FRONT_ROUTE',73,1,'2021-01-04 22:57:11','2021-01-04 22:57:11',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (73,1,'FR00074','FRONT_ROUTE',74,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (74,1,'FR00075','FRONT_ROUTE',75,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (75,1,'FR00076','FRONT_ROUTE',76,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (76,1,'FR00034','FRONT_ROUTE',34,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (77,1,'IA00001','SER_API',1,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (78,1,'IA00002','SER_API',2,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (79,1,'IA00003','SER_API',3,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (80,1,'IA00004','SER_API',4,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (81,1,'IA00005','SER_API',5,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (82,1,'IA00006','SER_API',6,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (83,1,'IA00007','SER_API',7,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (84,1,'IA00008','SER_API',8,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (85,1,'IA00009','SER_API',9,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (86,1,'IA00010','SER_API',10,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (87,1,'IA00011','SER_API',11,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (88,1,'IA00012','SER_API',12,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (89,1,'IA00013','SER_API',13,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (90,1,'IA00014','SER_API',14,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (91,1,'IA00015','SER_API',15,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (92,1,'IA00016','SER_API',16,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (93,1,'IA00017','SER_API',17,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (94,1,'IA00018','SER_API',18,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (95,1,'IA00019','SER_API',19,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (96,1,'IA00020','SER_API',20,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (97,1,'IA00021','SER_API',21,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (98,1,'IA00022','SER_API',22,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (99,1,'IA00023','SER_API',23,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (100,1,'IA00024','SER_API',24,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (101,1,'IA00025','SER_API',25,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (102,1,'IA00026','SER_API',26,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (103,1,'IA00027','SER_API',27,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (104,1,'IA00028','SER_API',28,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (105,1,'IA00029','SER_API',29,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (106,1,'IA00030','SER_API',30,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (107,1,'IA00031','SER_API',31,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (108,1,'IA00032','SER_API',32,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (109,1,'IA00033','SER_API',33,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (110,1,'IA00034','SER_API',34,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (111,1,'IA00035','SER_API',35,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (112,1,'IA00036','SER_API',36,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (113,1,'IA00037','SER_API',37,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (114,1,'IA00038','SER_API',38,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (115,1,'IA00039','SER_API',39,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (116,1,'IA00040','SER_API',40,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (117,1,'IA00041','SER_API',41,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (118,1,'IA00042','SER_API',42,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (119,1,'IA00043','SER_API',43,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (120,1,'IA00044','SER_API',44,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (121,1,'IA00045','SER_API',45,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (122,1,'IA00046','SER_API',46,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (123,1,'IA00047','SER_API',47,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (124,1,'IA00048','SER_API',48,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (125,1,'IA00049','SER_API',49,1,'2021-01-26 15:13:19','2021-01-26 15:13:19',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (126,1,'FR000000077','FRONT_ROUTE',77,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (127,1,'FR000000078','FRONT_ROUTE',78,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (128,1,'PE000000001','PAGE_ELEMENT',1,1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (129,1,'PE000000002','PAGE_ELEMENT',2,1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (130,1,'PE000000003','PAGE_ELEMENT',3,1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501071146942779393,1,'FR1501071145118257154','FRONT_ROUTE',1501071145118257154,1,'2022-03-08 13:43:45','2022-03-08 13:43:45',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501090429122985986,1,'FR1501090428636446722','FRONT_ROUTE',1501090428636446722,1,'2022-03-08 15:00:22','2022-03-08 15:00:22',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501091483138998273,1,'FR1501091482874757122','FRONT_ROUTE',1501091482874757122,1,'2022-03-08 15:04:33','2022-03-08 15:04:33',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1501099263551946754,1,'FR1501099262847303682','FRONT_ROUTE',1501099262847303682,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1507770691097538561,1,'FR1507770690745217026','FRONT_ROUTE',1507770690745217026,1,'2022-03-27 01:25:20','2022-03-27 01:25:20',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1514538324815577089,1,'FR1514538324329037825','FRONT_ROUTE',1514538324329037825,1,'2022-04-14 17:37:30','2022-04-14 17:37:30',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1514907534288326657,1,'FR1514907533453660161','FRONT_ROUTE',1514907533453660161,1,'2022-04-15 18:04:36','2022-04-15 18:04:36',0,0,1);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515191968020099074,1,'FR1515191685995098114','FRONT_ROUTE',1515191685995098114,1,'2022-04-16 12:54:53','2022-04-16 12:54:53',1,1,1);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515193279763509250,1,'FR1515193173177856002','FRONT_ROUTE',1515193173177856002,1,'2022-04-16 13:00:03','2022-04-16 13:00:03',1,1,1);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515894903171252225,1,'FR1515894902969925634','FRONT_ROUTE',1515894902969925634,1,'2022-04-18 11:28:04','2022-04-18 11:28:04',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1515899373326237697,1,'FR1515899373154271234','FRONT_ROUTE',1515899373154271234,1,'2022-04-18 11:45:49','2022-04-18 11:45:49',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557399233712144386,1,'FR1557399233418543106','FRONT_ROUTE',1557399233418543106,1,'2022-08-11 00:11:27','2022-08-11 00:11:27',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1557401007294562306,1,'FR1557401007147761665','FRONT_ROUTE',1557401007147761665,1,'2022-08-11 00:18:30','2022-08-11 00:18:30',0,0,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1626224210581757954,1,'FR1626224210330099714','FRONT_ROUTE',1626224210330099714,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331564208129,1,'IA1701421331501293570','SER_API',1701421331501293570,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331564208131,1,'IA1701421331564208130','SER_API',1701421331564208130,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331564208133,1,'IA1701421331564208132','SER_API',1701421331564208132,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122691,1,'IA1701421331627122690','SER_API',1701421331627122690,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122693,1,'IA1701421331627122692','SER_API',1701421331627122692,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331627122695,1,'IA1701421331627122694','SER_API',1701421331627122694,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037249,1,'IA1701421331627122696','SER_API',1701421331627122696,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037251,1,'IA1701421331690037250','SER_API',1701421331690037250,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331690037253,1,'IA1701421331690037252','SER_API',1701421331690037252,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951810,1,'IA1701421331690037254','SER_API',1701421331690037254,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951812,1,'IA1701421331752951811','SER_API',1701421331752951811,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951814,1,'IA1701421331752951813','SER_API',1701421331752951813,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331752951816,1,'IA1701421331752951815','SER_API',1701421331752951815,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060675,1,'IA1701421331820060674','SER_API',1701421331820060674,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060677,1,'IA1701421331820060676','SER_API',1701421331820060676,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331820060679,1,'IA1701421331820060678','SER_API',1701421331820060678,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975233,1,'IA1701421331820060680','SER_API',1701421331820060680,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975235,1,'IA1701421331882975234','SER_API',1701421331882975234,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975237,1,'IA1701421331882975236','SER_API',1701421331882975236,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331882975239,1,'IA1701421331882975238','SER_API',1701421331882975238,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084098,1,'IA1701421331882975240','SER_API',1701421331882975240,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084100,1,'IA1701421331950084099','SER_API',1701421331950084099,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421331950084102,1,'IA1701421331950084101','SER_API',1701421331950084101,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998658,1,'IA1701421331950084103','SER_API',1701421331950084103,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998660,1,'IA1701421332012998659','SER_API',1701421332012998659,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332012998662,1,'IA1701421332012998661','SER_API',1701421332012998661,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913218,1,'IA1701421332012998663','SER_API',1701421332012998663,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913220,1,'IA1701421332075913219','SER_API',1701421332075913219,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913222,1,'IA1701421332075913221','SER_API',1701421332075913221,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332075913224,1,'IA1701421332075913223','SER_API',1701421332075913223,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022082,1,'IA1701421332143022081','SER_API',1701421332143022081,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022084,1,'IA1701421332143022083','SER_API',1701421332143022083,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022086,1,'IA1701421332143022085','SER_API',1701421332143022085,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332143022088,1,'IA1701421332143022087','SER_API',1701421332143022087,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936643,1,'IA1701421332205936642','SER_API',1701421332205936642,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936645,1,'IA1701421332205936644','SER_API',1701421332205936644,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332205936647,1,'IA1701421332205936646','SER_API',1701421332205936646,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045506,1,'IA1701421332205936648','SER_API',1701421332205936648,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045508,1,'IA1701421332273045507','SER_API',1701421332273045507,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045510,1,'IA1701421332273045509','SER_API',1701421332273045509,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332273045512,1,'IA1701421332273045511','SER_API',1701421332273045511,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960066,1,'IA1701421332335960065','SER_API',1701421332335960065,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960068,1,'IA1701421332335960067','SER_API',1701421332335960067,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332335960070,1,'IA1701421332335960069','SER_API',1701421332335960069,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068929,1,'IA1701421332335960071','SER_API',1701421332335960071,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068931,1,'IA1701421332403068930','SER_API',1701421332403068930,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068933,1,'IA1701421332403068932','SER_API',1701421332403068932,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332403068935,1,'IA1701421332403068934','SER_API',1701421332403068934,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177794,1,'IA1701421332470177793','SER_API',1701421332470177793,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177796,1,'IA1701421332470177795','SER_API',1701421332470177795,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332470177798,1,'IA1701421332470177797','SER_API',1701421332470177797,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898051,1,'IA1701421332528898050','SER_API',1701421332528898050,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898053,1,'IA1701421332528898052','SER_API',1701421332528898052,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701421332528898055,1,'IA1701421332528898054','SER_API',1701421332528898054,1,'2023-09-12 10:23:51','2023-09-12 10:23:51',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701432390509404161,1,'IA1701432390475849729','SER_API',1701432390475849729,1,'2023-09-12 11:07:48','2023-09-12 11:07:48',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523722240002,1,'IA1701471523692879874','SER_API',1701471523692879874,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523759988738,1,'IA1701471523747405825','SER_API',1701471523747405825,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523839680513,1,'IA1701471523818708993','SER_API',1701471523818708993,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523873234945,1,'IA1701471523860652033','SER_API',1701471523860652033,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523906789378,1,'IA1701471523881623553','SER_API',1701471523881623553,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523931955202,1,'IA1701471523919372290','SER_API',1701471523919372290,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523952926722,1,'IA1701471523940343810','SER_API',1701471523940343810,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523973898242,1,'IA1701471523965509633','SER_API',1701471523965509633,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471523994869762,1,'IA1701471523982286850','SER_API',1701471523982286850,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524011646978,1,'IA1701471524003258370','SER_API',1701471524003258370,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524032618498,1,'IA1701471524020035585','SER_API',1701471524020035585,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524045201409,1,'IA1701471524036812802','SER_API',1701471524036812802,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524099727361,1,'IA1701471524061978626','SER_API',1701471524061978626,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524129087489,1,'IA1701471524116504578','SER_API',1701471524116504578,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524162641921,1,'IA1701471524141670401','SER_API',1701471524141670401,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524183613441,1,'IA1701471524175224833','SER_API',1701471524175224833,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524196196353,1,'IA1701471524192002049','SER_API',1701471524192002049,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524212973569,1,'IA1701471524204584962','SER_API',1701471524204584962,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524238139393,1,'IA1701471524225556481','SER_API',1701471524225556481,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524254916610,1,'IA1701471524246528001','SER_API',1701471524246528001,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524271693825,1,'IA1701471524263305217','SER_API',1701471524263305217,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524292665345,1,'IA1701471524280082434','SER_API',1701471524280082434,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524309442561,1,'IA1701471524301053954','SER_API',1701471524301053954,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524326219777,1,'IA1701471524317831170','SER_API',1701471524317831170,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524347191298,1,'IA1701471524338802690','SER_API',1701471524338802690,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524368162817,1,'IA1701471524355579905','SER_API',1701471524355579905,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524384940034,1,'IA1701471524376551426','SER_API',1701471524376551426,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524401717250,1,'IA1701471524393328642','SER_API',1701471524393328642,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524418494465,1,'IA1701471524410105857','SER_API',1701471524410105857,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1701471524431077377,1,'IA1701471524422688769','SER_API',1701471524422688769,1,'2023-09-12 13:43:18','2023-09-12 13:43:18',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283028729858,1,'IA1795276282886123522','SER_API',1795276282886123522,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283121004545,1,'IA1795276283074867202','SER_API',1795276283074867202,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283162947586,1,'IA1795276283141976066','SER_API',1795276283141976066,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283188113410,1,'IA1795276283175530497','SER_API',1795276283175530497,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283225862146,1,'IA1795276283204890625','SER_API',1795276283204890625,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283251027969,1,'IA1795276283238445057','SER_API',1795276283238445057,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283301359618,1,'IA1795276283259416578','SER_API',1795276283259416578,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283326525442,1,'IA1795276283318136833','SER_API',1795276283318136833,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283355885569,1,'IA1795276283343302657','SER_API',1795276283343302657,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283376857090,1,'IA1795276283364274177','SER_API',1795276283364274177,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283410411522,1,'IA1795276283393634305','SER_API',1795276283393634305,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283448160257,1,'IA1795276283427188737','SER_API',1795276283427188737,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283485908993,1,'IA1795276283464937474','SER_API',1795276283464937474,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283523657730,1,'IA1795276283498491906','SER_API',1795276283498491906,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283553017857,1,'IA1795276283536240641','SER_API',1795276283536240641,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283653681154,1,'IA1795276283632709634','SER_API',1795276283632709634,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283691429889,1,'IA1795276283674652674','SER_API',1795276283674652674,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283724984322,1,'IA1795276283708207105','SER_API',1795276283708207105,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283758538754,1,'IA1795276283741761537','SER_API',1795276283741761537,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283783704578,1,'IA1795276283771121665','SER_API',1795276283771121665,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283821453313,1,'IA1795276283800481794','SER_API',1795276283800481794,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283863396353,1,'IA1795276283838230529','SER_API',1795276283838230529,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276283901145090,1,'IA1795276283880173569','SER_API',1795276283880173569,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276284077305857,1,'IA1795276284064722945','SER_API',1795276284064722945,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276284102471681,1,'IA1795276284094083073','SER_API',1795276284094083073,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);
INSERT INTO `iam_permission` (`id`, `application_id`, `code`, `type`, `resource_id`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1795276284123443201,1,'IA1795276284110860289','SER_API',1795276284110860289,1,'2024-05-28 10:09:55','2024-05-28 10:09:55',1,1,0);

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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_role_id_permission_id` (`role_id`,`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_permission_role_rel`
--

INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (44,1,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (45,2,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (46,3,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (47,4,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (48,5,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (49,6,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (50,7,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (51,8,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (52,9,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (53,10,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (54,11,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (55,12,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (56,13,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (57,14,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (58,15,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (59,16,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (60,17,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (61,18,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (62,19,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (63,20,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (64,21,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (65,22,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (66,23,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (67,24,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (68,25,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (69,26,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (70,27,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (71,28,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (72,29,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (73,30,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (74,31,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (75,32,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (76,33,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (77,34,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (78,35,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (79,36,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (80,37,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (81,38,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (82,39,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (83,40,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (84,41,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (85,42,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (86,43,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (87,70,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (88,71,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (89,73,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (90,75,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (91,76,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (92,44,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (93,56,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (94,57,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (95,58,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (96,59,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (97,74,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (98,77,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (99,78,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (100,79,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (101,80,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (102,81,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (103,82,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (104,83,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (105,84,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (106,85,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (107,86,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (108,87,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (109,88,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (110,89,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (111,90,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (112,91,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (113,92,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (114,93,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (115,94,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (116,95,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (117,96,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (118,97,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (119,98,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (120,99,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (121,100,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (122,101,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (123,102,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (124,103,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (125,104,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (126,105,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (127,106,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (128,107,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (129,108,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (130,109,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (131,110,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (132,111,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (133,112,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (134,113,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (135,114,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (136,115,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (137,116,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (138,117,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (139,118,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (140,119,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (141,43,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (142,75,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (143,74,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (144,73,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (145,71,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (146,70,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (147,44,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (148,4,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (149,17,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (150,18,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (151,2,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (152,24,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (153,25,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (154,28,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (155,29,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (156,30,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (157,32,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (158,72,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (159,7,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (160,22,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
INSERT INTO `iam_permission_role_rel` (`id`, `permission_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (161,23,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);

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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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

INSERT INTO `iam_role` (`id`, `name`, `code`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,'超级管理员','',1,'2021-01-21 10:37:00','2021-01-21 10:37:00',0,0,0);
INSERT INTO `iam_role` (`id`, `name`, `code`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,'后端','c9d4f55af376400285cb5fa21bf9aebc',1,'2022-02-21 17:31:21','2022-02-21 17:31:21',0,0,0);

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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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

INSERT INTO `iam_user` (`id`, `username`, `mobile`, `code`, `password`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (1,'Admin','Admin','SuperAdmin','$2a$10$Za0yx5PAGKZIviKfDwP7uuWVjCPu2DswMDqAkv93H7Ia0FO6XlbKK',1,'2021-01-21 10:40:47','2021-12-20 22:41:27',0,0,0);
INSERT INTO `iam_user` (`id`, `username`, `mobile`, `code`, `password`, `status`, `create_time`, `update_time`, `creator`, `modifier`, `is_deleted`) VALUES (2,'Javis','18588686715','e5584ab9cda147c3956fe1b6af85f448','$2a$10$.VsAKjkii.rQMrs/k0YQMOjhyLPfAB3xvokULboT5kJtKZR8q7k7C',1,'2022-02-16 18:32:24','2022-02-21 18:00:54',0,0,0);

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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
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
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_role_rel`
--

INSERT INTO `iam_user_role_rel` (`id`, `user_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (1,1,1,'2021-01-21 10:40:47','2021-01-21 10:40:47',0,0);
INSERT INTO `iam_user_role_rel` (`id`, `user_id`, `role_id`, `create_time`, `update_time`, `creator`, `modifier`) VALUES (2,2,2,'2022-02-21 18:00:54','2022-02-21 18:00:54',0,0);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 17:34:33
