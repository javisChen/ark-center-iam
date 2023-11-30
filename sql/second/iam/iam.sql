-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_api`
--

DROP TABLE IF EXISTS `iam_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'API名称',
  `uri` varchar(128) NOT NULL DEFAULT '' COMMENT '接口地址',
  `method` varchar(10) NOT NULL DEFAULT '' COMMENT 'Http Method 1-GET 2-POST 3-PUT 4-DELETE 5-PATCH',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-已启用；2-已禁用；',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'api分类id，关联api_category.id',
  `auth_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权',
  `has_path_variable` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'url是否包含路径参数，例： /user/{userId}/api/{apiId} 0-不包含 1-包含',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_application_id_url_method` (`uri`,`application_id`,`method`),
  KEY `fk_upms_api_category_idx` (`category_id`),
  KEY `idx_application_id` (`application_id`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='api表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_api`
--

/*!40000 ALTER TABLE `iam_api` DISABLE KEYS */;
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (1, 1, '/iam/v1/api/category', '/iam/v1/api/category', 'PUT', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (2, 1, '/iam/v1/api/category', '/iam/v1/api/category', 'DELETE', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (3, 1, '/iam/v1/api/categories', '/iam/v1/api/categories', 'GET', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (4, 1, '/iam/v1/api/category', '/iam/v1/api/category', 'POST', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (5, 1, '/iam/v1/api/init', '/iam/v1/api/init', 'GET', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (6, 1, '/iam/v1/apis', '/iam/v1/apis', 'POST', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (7, 1, '/iam/v1/api/test', '/iam/v1/api/test', 'GET', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (8, 1, '/iam/v1/api', '/iam/v1/api', 'POST', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (9, 1, '/iam/v1/api', '/iam/v1/api', 'PUT', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (10, 1, '/iam/v1/api/{id}', '/iam/v1/api/{id}', 'DELETE', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (11, 1, '/iam/v1/api/cache', '/iam/v1/api/cache', 'PUT', 1, 5, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (12, 1, '/iam/v1/applications', '/iam/v1/applications', 'POST', 1, 4, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (13, 1, '/iam/v1/application', '/iam/v1/application', 'POST', 1, 4, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (14, 1, '/iam/v1/application', '/iam/v1/application', 'PUT', 1, 4, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (15, 1, '/iam/v1/auth/login', '/iam/v1/auth/login', 'POST', 1, 0, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (16, 1, '/iam/v1/roles/all', '/iam/v1/roles/all', 'GET', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (17, 1, '/iam/v1/role/status', '/iam/v1/role/status', 'PUT', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (18, 1, '/iam/v1/role', '/iam/v1/role', 'POST', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (19, 1, '/iam/v1/role/{id}', '/iam/v1/role/{id}', 'GET', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (20, 1, '/iam/v1/role', '/iam/v1/role', 'PUT', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (21, 1, '/iam/v1/roles', '/iam/v1/roles', 'POST', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (22, 1, '/iam/v1/role/permission/route', '/iam/v1/role/permission/route', 'POST', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (23, 1, '/iam/v1/role/permission/api', '/iam/v1/role/permission/api', 'POST', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (24, 1, '/iam/v1/role/permission/routes', '/iam/v1/role/permission/routes', 'GET', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (25, 1, '/iam/v1/role/permission/elements', '/iam/v1/role/permission/elements', 'GET', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (26, 1, '/iam/v1/role/permission/apis', '/iam/v1/role/permission/apis', 'GET', 1, 3, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (27, 1, '/iam/v1/route/status', '/iam/v1/route/status', 'PUT', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (28, 1, '/iam/v1/route/parent', '/iam/v1/route/parent', 'PUT', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (29, 1, '/iam/v1/route', '/iam/v1/route', 'POST', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (30, 1, '/iam/v1/route/{id}', '/iam/v1/route/{id}', 'GET', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (31, 1, '/iam/v1/route', '/iam/v1/route', 'PUT', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (32, 1, '/iam/v1/routes/init', '/iam/v1/routes/init', 'POST', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (33, 1, '/iam/v1/routes/all', '/iam/v1/routes/all', 'POST', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (34, 1, '/iam/v1/routes', '/iam/v1/routes', 'POST', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (35, 1, '/iam/v1/route/{id}', '/iam/v1/route/{id}', 'DELETE', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (36, 1, '/iam/v1/route/{routeId}/elements', '/iam/v1/route/{routeId}/elements', 'GET', 1, 6, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (37, 1, '/iam/v1/user', '/iam/v1/user', 'POST', 1, 1, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (38, 1, '/iam/v1/user/self', '/iam/v1/user/self', 'GET', 1, 1, 2, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (39, 1, '/iam/v1/user', '/iam/v1/user', 'PUT', 1, 1, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (40, 1, '/iam/v1/users', '/iam/v1/users', 'POST', 1, 1, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (41, 1, '/iam/v1/user/info', '/iam/v1/user/details', 'GET', 1, 1, 2, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (42, 1, '/iam/v1/user/self/routes', '/iam/v1/user/self/routes', 'GET', 1, 1, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (43, 1, '/iam/v1/user/self/elements', '/iam/v1/user/self/elements', 'GET', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (44, 1, '/iam/v1/usergroup/status', '/iam/v1/usergroup/status', 'PUT', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (45, 1, '/iam/v1/usergroup', '/iam/v1/usergroup', 'POST', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (46, 1, '/iam/v1/usergroup', '/iam/v1/usergroup', 'PUT', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (47, 1, '/iam/v1/usergroups/all', '/iam/v1/usergroups/all', 'GET', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (48, 1, '/iam/v1/usergroups', '/iam/v1/usergroups', 'POST', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
INSERT INTO iam.iam_api (id, application_id, name, uri, method, status, category_id, auth_type, has_path_variable, gmt_modified, gmt_create, creator, modifier, is_deleted) VALUES (49, 1, '/iam/v1/usergroups/tree', '/iam/v1/usergroups/tree', 'POST', 1, 2, 3, 0, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0);
/*!40000 ALTER TABLE `iam_api` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_api_category`
--

DROP TABLE IF EXISTS `iam_api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_api_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'API分类名称',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_name_application_id` (`application_id`,`name`,`is_deleted`),
  KEY `idx_application_id` (`application_id`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='Api分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_api_category`
--

/*!40000 ALTER TABLE `iam_api_category` DISABLE KEYS */;
INSERT INTO `iam_api_category` VALUES (1,1,'用户管理','2021-01-26 13:56:54','2021-01-26 13:56:54',0,0,0),(2,1,'用户组管理','2021-01-26 13:56:58','2021-01-26 13:56:58',0,0,0),(3,1,'角色管理','2021-01-26 13:57:19','2021-01-26 13:57:19',0,0,0),(4,1,'应用管理','2021-01-26 13:57:24','2021-01-26 13:57:24',0,0,0),(5,1,'接口管理','2021-01-26 13:57:29','2021-01-26 13:57:29',0,0,0),(6,1,'路由管理','2021-01-26 13:57:36','2021-01-26 13:57:36',0,0,0),(7,2,'订单管理','2021-01-26 14:41:03','2021-01-26 14:41:03',0,0,0),(8,1,'用户组管理','2021-01-26 14:41:17','2021-01-26 14:41:17',0,0,1),(9,1,'认证接口','2021-01-26 16:48:01','2021-01-26 16:48:01',0,0,1),(17,1,'认证管理','2021-01-27 11:00:34','2021-01-27 11:00:34',0,0,0);
/*!40000 ALTER TABLE `iam_api_category` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_application`
--

DROP TABLE IF EXISTS `iam_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_application` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-已上线；2-已下线；',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '应用类型 1-业务系统（前后端）2-纯后台服务',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`,`is_deleted`),
  UNIQUE KEY `uk_name` (`name`,`is_deleted`),
  KEY `uk_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_application`
--

/*!40000 ALTER TABLE `iam_application` DISABLE KEYS */;
INSERT INTO `iam_application` VALUES (1,'IAM','permission',1,1,'2021-01-25 15:29:20','2021-01-25 15:29:20',0,0,0),(2,'研发效能','eop',1,1,'2021-05-26 13:16:09','2021-05-26 13:16:09',0,0,0),(3,'商品中心','commodity',1,1,'2022-02-25 13:57:08','2022-02-25 13:57:08',0,0,0),(4,'订单中心','order',1,1,'2022-02-25 14:00:27','2022-02-25 14:00:27',0,0,0),(5,'支付中心','payment',1,1,'2022-02-25 14:12:28','2022-02-25 14:12:28',0,0,0),(6,'物流中心','logistics',1,1,'2022-02-25 14:13:15','2022-02-25 14:13:15',0,0,0),(7,'搜索中心','search',1,1,'2022-02-25 14:13:37','2022-02-25 14:13:37',0,0,0),(8,'消息中心','message',1,1,'2022-02-25 14:13:53','2022-02-25 14:13:53',0,0,0),(9,'网关服务','gateway',1,1,'2022-02-25 14:14:46','2022-02-25 14:14:46',0,0,0);
/*!40000 ALTER TABLE `iam_application` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_page_element`
--

DROP TABLE IF EXISTS `iam_page_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_page_element` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` bigint(20) unsigned NOT NULL COMMENT '所属菜单id，关联upms_menu.id',
  `name` varchar(45) NOT NULL COMMENT '元素名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '元素类型 1-按钮；2-层；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_is_deleted` (`is_deleted`),
  KEY `idx_route_id` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='页面元素表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_page_element`
--

/*!40000 ALTER TABLE `iam_page_element` DISABLE KEYS */;
INSERT INTO `iam_page_element` VALUES (1,76,'新增',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0),(2,76,'删除',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0),(3,76,'导出',1,'2022-02-16 14:47:25','2022-02-16 14:47:25',0,0,0);
/*!40000 ALTER TABLE `iam_page_element` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_permission`
--

DROP TABLE IF EXISTS `iam_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(45) NOT NULL COMMENT '权限编码',
  `type` varchar(25) NOT NULL COMMENT '权限类型 FRONT_ROUTE-前端路由；PAGE_ELEMENT-页面元素；PAGE-页面；FILE-文件；SER_API-内部服务API；OPEN_API-开放API',
  `resource_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '资源id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '权限状态 1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  UNIQUE KEY `uk_type_resource_id` (`type`,`resource_id`,`gmt_create`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1626224210581757955 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_permission`
--

/*!40000 ALTER TABLE `iam_permission` DISABLE KEYS */;
INSERT INTO `iam_permission` (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier, is_deleted)
VALUES (1, 'FR00001', 'FRONT_ROUTE', 1, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (2, 'FR00002', 'FRONT_ROUTE', 2, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (3, 'FR00003', 'FRONT_ROUTE', 3, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (4, 'FR00004', 'FRONT_ROUTE', 4, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (5, 'FR00005', 'FRONT_ROUTE', 5, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (6, 'FR00006', 'FRONT_ROUTE', 6, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (7, 'FR00007', 'FRONT_ROUTE', 7, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', 0, 0, 0),
       (8, 'FR00008', 'FRONT_ROUTE', 8, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (9, 'FR00009', 'FRONT_ROUTE', 9, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (10, 'FR00010', 'FRONT_ROUTE', 10, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (11, 'FR00011', 'FRONT_ROUTE', 11, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (12, 'FR00012', 'FRONT_ROUTE', 12, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (13, 'FR00013', 'FRONT_ROUTE', 13, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (14, 'FR00014', 'FRONT_ROUTE', 14, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (15, 'FR00015', 'FRONT_ROUTE', 15, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (16, 'FR00016', 'FRONT_ROUTE', 16, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', 0, 0, 0),
       (17, 'FR00017', 'FRONT_ROUTE', 17, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (18, 'FR00018', 'FRONT_ROUTE', 18, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (19, 'FR00019', 'FRONT_ROUTE', 19, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (20, 'FR00020', 'FRONT_ROUTE', 20, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (21, 'FR00021', 'FRONT_ROUTE', 21, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (22, 'FR00022', 'FRONT_ROUTE', 22, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (23, 'FR00023', 'FRONT_ROUTE', 23, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (24, 'FR00024', 'FRONT_ROUTE', 24, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (25, 'FR00025', 'FRONT_ROUTE', 25, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', 0, 0, 0),
       (26, 'FR00026', 'FRONT_ROUTE', 26, 1, '2020-12-24 16:03:23', '2020-12-24 16:03:23', 0, 0, 0),
       (27, 'FR00027', 'FRONT_ROUTE', 27, 1, '2020-12-24 16:03:23', '2020-12-24 16:03:23', 0, 0, 0),
       (28, 'FR00028', 'FRONT_ROUTE', 28, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', 0, 0, 0),
       (29, 'FR00029', 'FRONT_ROUTE', 29, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', 0, 0, 0),
       (30, 'FR00030', 'FRONT_ROUTE', 30, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', 0, 0, 0),
       (31, 'FR00031', 'FRONT_ROUTE', 31, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', 0, 0, 0),
       (32, 'FR00032', 'FRONT_ROUTE', 32, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', 0, 0, 0),
       (33, 'FR00033', 'FRONT_ROUTE', 33, 1, '2020-12-24 18:28:38', '2020-12-24 18:28:38', 0, 0, 0),
       (34, 'FR00035', 'FRONT_ROUTE', 35, 1, '2020-12-25 17:23:07', '2020-12-25 17:23:07', 0, 0, 0),
       (35, 'FR00036', 'FRONT_ROUTE', 36, 1, '2020-12-25 17:23:15', '2020-12-25 17:23:15', 0, 0, 0),
       (36, 'FR00037', 'FRONT_ROUTE', 37, 1, '2020-12-25 17:23:20', '2020-12-25 17:23:20', 0, 0, 0),
       (37, 'FR00038', 'FRONT_ROUTE', 38, 1, '2020-12-25 17:23:24', '2020-12-25 17:23:24', 0, 0, 0),
       (38, 'FR00039', 'FRONT_ROUTE', 39, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', 0, 0, 0),
       (39, 'FR00040', 'FRONT_ROUTE', 40, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', 0, 0, 0),
       (40, 'FR00041', 'FRONT_ROUTE', 41, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', 0, 0, 0),
       (41, 'FR00042', 'FRONT_ROUTE', 42, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', 0, 0, 0),
       (42, 'FR00043', 'FRONT_ROUTE', 43, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', 0, 0, 0),
       (43, 'FR00044', 'FRONT_ROUTE', 44, 1, '2020-12-25 17:41:40', '2020-12-25 17:41:40', 0, 0, 0),
       (44, 'FR00045', 'FRONT_ROUTE', 45, 1, '2020-12-25 17:41:45', '2020-12-25 17:41:45', 0, 0, 0),
       (45, 'FR00046', 'FRONT_ROUTE', 46, 1, '2020-12-29 14:52:49', '2020-12-29 14:52:49', 0, 0, 0),
       (46, 'FR00047', 'FRONT_ROUTE', 47, 1, '2020-12-29 15:51:28', '2020-12-29 15:51:28', 0, 0, 0),
       (47, 'FR00048', 'FRONT_ROUTE', 48, 1, '2020-12-29 15:52:58', '2020-12-29 15:52:58', 0, 0, 0),
       (48, 'FR00049', 'FRONT_ROUTE', 49, 1, '2020-12-29 16:34:36', '2020-12-29 16:34:36', 0, 0, 0),
       (49, 'FR00050', 'FRONT_ROUTE', 50, 1, '2020-12-29 16:58:00', '2020-12-29 16:58:00', 0, 0, 0),
       (50, 'FR00051', 'FRONT_ROUTE', 51, 1, '2020-12-29 16:58:45', '2020-12-29 16:58:45', 0, 0, 0),
       (51, 'FR00052', 'FRONT_ROUTE', 52, 1, '2020-12-29 17:01:27', '2020-12-29 17:01:27', 0, 0, 0),
       (52, 'FR00053', 'FRONT_ROUTE', 53, 1, '2020-12-29 17:01:31', '2020-12-29 17:01:31', 0, 0, 0),
       (53, 'FR00054', 'FRONT_ROUTE', 54, 1, '2020-12-29 17:05:29', '2020-12-29 17:05:29', 0, 0, 0),
       (54, 'FR00055', 'FRONT_ROUTE', 55, 1, '2020-12-29 17:05:41', '2020-12-29 17:05:41', 0, 0, 0),
       (55, 'FR00056', 'FRONT_ROUTE', 56, 1, '2020-12-29 17:05:50', '2020-12-29 17:05:50', 0, 0, 0),
       (56, 'FR00057', 'FRONT_ROUTE', 57, 1, '2020-12-29 17:17:56', '2020-12-29 17:17:56', 0, 0, 0),
       (57, 'FR00058', 'FRONT_ROUTE', 58, 1, '2020-12-29 17:19:17', '2020-12-29 17:19:17', 0, 0, 0),
       (58, 'FR00059', 'FRONT_ROUTE', 59, 1, '2020-12-29 17:20:20', '2020-12-29 17:20:20', 0, 0, 0),
       (59, 'FR00060', 'FRONT_ROUTE', 60, 1, '2020-12-29 17:21:08', '2020-12-29 17:21:08', 0, 0, 0),
       (60, 'FR00061', 'FRONT_ROUTE', 61, 1, '2020-12-29 17:36:25', '2020-12-29 17:36:25', 0, 0, 0),
       (61, 'FR00062', 'FRONT_ROUTE', 62, 1, '2020-12-29 17:36:40', '2020-12-29 17:36:40', 0, 0, 0),
       (62, 'FR00063', 'FRONT_ROUTE', 63, 1, '2020-12-29 17:36:49', '2020-12-29 17:36:49', 0, 0, 0),
       (63, 'FR00064', 'FRONT_ROUTE', 64, 1, '2020-12-29 18:11:17', '2020-12-29 18:11:17', 0, 0, 0),
       (64, 'FR00065', 'FRONT_ROUTE', 65, 1, '2020-12-29 18:11:57', '2020-12-29 18:11:57', 0, 0, 0),
       (65, 'FR00066', 'FRONT_ROUTE', 66, 1, '2020-12-29 18:30:10', '2020-12-29 18:30:10', 0, 0, 0),
       (66, 'FR00067', 'FRONT_ROUTE', 67, 1, '2020-12-30 16:37:49', '2020-12-30 16:37:49', 0, 0, 0),
       (67, 'FR00068', 'FRONT_ROUTE', 68, 1, '2020-12-30 16:40:51', '2020-12-30 16:40:51', 0, 0, 0),
       (68, 'FR00069', 'FRONT_ROUTE', 69, 1, '2020-12-30 17:00:20', '2020-12-30 17:00:20', 0, 0, 0),
       (69, 'FR00070', 'FRONT_ROUTE', 70, 1, '2020-12-30 17:00:33', '2020-12-30 17:00:33', 0, 0, 0),
       (70, 'FR00071', 'FRONT_ROUTE', 71, 1, '2021-01-02 22:57:49', '2021-01-02 22:57:49', 0, 0, 0),
       (71, 'FR00072', 'FRONT_ROUTE', 72, 1, '2021-01-04 22:44:21', '2021-01-04 22:44:21', 0, 0, 0),
       (72, 'FR00073', 'FRONT_ROUTE', 73, 1, '2021-01-04 22:57:11', '2021-01-04 22:57:11', 0, 0, 0),
       (73, 'FR00074', 'FRONT_ROUTE', 74, 1, '2021-01-07 10:33:37', '2021-01-07 10:33:37', 0, 0, 0),
       (74, 'FR00075', 'FRONT_ROUTE', 75, 1, '2021-01-07 10:33:37', '2021-01-07 10:33:37', 0, 0, 0),
       (75, 'FR00076', 'FRONT_ROUTE', 76, 1, '2021-01-07 10:33:37', '2021-01-07 10:33:37', 0, 0, 0),
       (76, 'FR00034', 'FRONT_ROUTE', 34, 1, '2021-01-07 10:33:37', '2021-01-07 10:33:37', 0, 0, 0),
       (77, 'IA00001', 'SER_API', 1, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (78, 'IA00002', 'SER_API', 2, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (79, 'IA00003', 'SER_API', 3, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (80, 'IA00004', 'SER_API', 4, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (81, 'IA00005', 'SER_API', 5, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (82, 'IA00006', 'SER_API', 6, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (83, 'IA00007', 'SER_API', 7, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (84, 'IA00008', 'SER_API', 8, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (85, 'IA00009', 'SER_API', 9, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (86, 'IA00010', 'SER_API', 10, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (87, 'IA00011', 'SER_API', 11, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (88, 'IA00012', 'SER_API', 12, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (89, 'IA00013', 'SER_API', 13, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (90, 'IA00014', 'SER_API', 14, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (91, 'IA00015', 'SER_API', 15, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (92, 'IA00016', 'SER_API', 16, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (93, 'IA00017', 'SER_API', 17, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (94, 'IA00018', 'SER_API', 18, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (95, 'IA00019', 'SER_API', 19, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (96, 'IA00020', 'SER_API', 20, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (97, 'IA00021', 'SER_API', 21, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (98, 'IA00022', 'SER_API', 22, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (99, 'IA00023', 'SER_API', 23, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (100, 'IA00024', 'SER_API', 24, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (101, 'IA00025', 'SER_API', 25, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (102, 'IA00026', 'SER_API', 26, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (103, 'IA00027', 'SER_API', 27, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (104, 'IA00028', 'SER_API', 28, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (105, 'IA00029', 'SER_API', 29, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (106, 'IA00030', 'SER_API', 30, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (107, 'IA00031', 'SER_API', 31, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (108, 'IA00032', 'SER_API', 32, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (109, 'IA00033', 'SER_API', 33, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (110, 'IA00034', 'SER_API', 34, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (111, 'IA00035', 'SER_API', 35, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (112, 'IA00036', 'SER_API', 36, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (113, 'IA00037', 'SER_API', 37, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (114, 'IA00038', 'SER_API', 38, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (115, 'IA00039', 'SER_API', 39, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (116, 'IA00040', 'SER_API', 40, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (117, 'IA00041', 'SER_API', 41, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (118, 'IA00042', 'SER_API', 42, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (119, 'IA00043', 'SER_API', 43, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (120, 'IA00044', 'SER_API', 44, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (121, 'IA00045', 'SER_API', 45, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (122, 'IA00046', 'SER_API', 46, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (123, 'IA00047', 'SER_API', 47, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (124, 'IA00048', 'SER_API', 48, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (125, 'IA00049', 'SER_API', 49, 1, '2021-01-26 15:13:19', '2021-01-26 15:13:19', 0, 0, 0),
       (126, 'FR000000077', 'FRONT_ROUTE', 77, 1, '2021-05-26 13:16:50', '2021-05-26 13:16:50', 0, 0, 0),
       (127, 'FR000000078', 'FRONT_ROUTE', 78, 1, '2021-05-26 13:23:11', '2021-05-26 13:23:11', 0, 0, 0),
       (128, 'PE000000001', 'PAGE_ELEMENT', 1, 1, '2022-02-16 14:47:25', '2022-02-16 14:47:25', 0, 0, 0),
       (129, 'PE000000002', 'PAGE_ELEMENT', 2, 1, '2022-02-16 14:47:25', '2022-02-16 14:47:25', 0, 0, 0),
       (130, 'PE000000003', 'PAGE_ELEMENT', 3, 1, '2022-02-16 14:47:25', '2022-02-16 14:47:25', 0, 0, 0),
       (1501071146942779393, 'FR1501071145118257154', 'FRONT_ROUTE', 1501071145118257154, 1, '2022-03-08 13:43:45',
        '2022-03-08 13:43:45', 1, 1, 0),
       (1501090429122985986, 'FR1501090428636446722', 'FRONT_ROUTE', 1501090428636446722, 1, '2022-03-08 15:00:22',
        '2022-03-08 15:00:22', 1, 1, 0),
       (1501091483138998273, 'FR1501091482874757122', 'FRONT_ROUTE', 1501091482874757122, 1, '2022-03-08 15:04:33',
        '2022-03-08 15:04:33', 1, 1, 0),
       (1501099263551946754, 'FR1501099262847303682', 'FRONT_ROUTE', 1501099262847303682, 1, '2022-03-08 15:35:28',
        '2022-03-08 15:35:28', 1, 1, 0),
       (1507770691097538561, 'FR1507770690745217026', 'FRONT_ROUTE', 1507770690745217026, 1, '2022-03-27 01:25:20',
        '2022-03-27 01:25:20', 1, 1, 0),
       (1514538324815577089, 'FR1514538324329037825', 'FRONT_ROUTE', 1514538324329037825, 1, '2022-04-14 17:37:30',
        '2022-04-14 17:37:30', 0, 0, 0),
       (1514907534288326657, 'FR1514907533453660161', 'FRONT_ROUTE', 1514907533453660161, 1, '2022-04-15 18:04:36',
        '2022-04-15 18:04:36', 0, 0, 1),
       (1515191968020099074, 'FR1515191685995098114', 'FRONT_ROUTE', 1515191685995098114, 1, '2022-04-16 12:54:53',
        '2022-04-16 12:54:53', 1, 1, 1),
       (1515193279763509250, 'FR1515193173177856002', 'FRONT_ROUTE', 1515193173177856002, 1, '2022-04-16 13:00:03',
        '2022-04-16 13:00:03', 1, 1, 1),
       (1515894903171252225, 'FR1515894902969925634', 'FRONT_ROUTE', 1515894902969925634, 1, '2022-04-18 11:28:04',
        '2022-04-18 11:28:04', 0, 0, 0),
       (1515899373326237697, 'FR1515899373154271234', 'FRONT_ROUTE', 1515899373154271234, 1, '2022-04-18 11:45:49',
        '2022-04-18 11:45:49', 0, 0, 0),
       (1557399233712144386, 'FR1557399233418543106', 'FRONT_ROUTE', 1557399233418543106, 1, '2022-08-11 00:11:27',
        '2022-08-11 00:11:27', 0, 0, 0),
       (1557401007294562306, 'FR1557401007147761665', 'FRONT_ROUTE', 1557401007147761665, 1, '2022-08-11 00:18:30',
        '2022-08-11 00:18:30', 0, 0, 0),
       (1626224210581757954, 'FR1626224210330099714', 'FRONT_ROUTE', 1626224210330099714, 1, '2023-02-16 22:17:20',
        '2023-02-16 22:17:20', 1, 1, 0);
/*!40000 ALTER TABLE `iam_permission` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_permission_role_rel`
--

DROP TABLE IF EXISTS `iam_permission_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_permission_role_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '权限id，关联upms_permission.id',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色id，关联upms_role.id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_permission_id_role_id` (`permission_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COMMENT='角色与权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_permission_role_rel`
--

/*!40000 ALTER TABLE `iam_permission_role_rel` DISABLE KEYS */;
INSERT INTO `iam_permission_role_rel` VALUES (44,1,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(45,2,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(46,3,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(47,4,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(48,5,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(49,6,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(50,7,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(51,8,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(52,9,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(53,10,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(54,11,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(55,12,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(56,13,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(57,14,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(58,15,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(59,16,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(60,17,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(61,18,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(62,19,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(63,20,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(64,21,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(65,22,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(66,23,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(67,24,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(68,25,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(69,26,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(70,27,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(71,28,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(72,29,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(73,30,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(74,31,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(75,32,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(76,33,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(77,34,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(78,35,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(79,36,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(80,37,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(81,38,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(82,39,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(83,40,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(84,41,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(85,42,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(86,43,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(87,70,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(88,71,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(89,73,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(90,75,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(91,76,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(92,44,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(93,56,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(94,57,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(95,58,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(96,59,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(97,74,1,'2021-01-21 15:33:51','2021-01-21 15:33:51',0,0),(98,77,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(99,78,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(100,79,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(101,80,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(102,81,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(103,82,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(104,83,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(105,84,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(106,85,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(107,86,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(108,87,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(109,88,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(110,89,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(111,90,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(112,91,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(113,92,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(114,93,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(115,94,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(116,95,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(117,96,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(118,97,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(119,98,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(120,99,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(121,100,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(122,101,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(123,102,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(124,103,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(125,104,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(126,105,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(127,106,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(128,107,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(129,108,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(130,109,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(131,110,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(132,111,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(133,112,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(134,113,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(135,114,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(136,115,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(137,116,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(138,117,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(139,118,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(140,119,1,'2021-01-21 15:49:19','2021-01-21 15:49:19',0,0),(141,43,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(142,75,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(143,74,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(144,73,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(145,71,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(146,70,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(147,44,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(148,4,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(149,17,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(150,18,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(151,2,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(152,24,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(153,25,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(154,28,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(155,29,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(156,30,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(157,32,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(158,72,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(159,7,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(160,22,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0),(161,23,2,'2022-02-21 17:39:58','2022-02-21 17:39:58',0,0);
/*!40000 ALTER TABLE `iam_permission_role_rel` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_role`
--

DROP TABLE IF EXISTS `iam_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(45) NOT NULL COMMENT '用户名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色编码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '角色状态 1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 1-表示删除；0-表示未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_role`
--

/*!40000 ALTER TABLE `iam_role` DISABLE KEYS */;
INSERT INTO `iam_role` VALUES (1,'超级管理员','',1,'2021-01-21 10:37:00','2021-01-21 10:37:00',0,0,0),(2,'后端','c9d4f55af376400285cb5fa21bf9aebc',1,'2022-02-21 17:31:21','2022-02-21 17:31:21',0,0,0);
/*!40000 ALTER TABLE `iam_role` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_route`
--

DROP TABLE IF EXISTS `iam_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_route` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `application_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用id，关联upms_application.id',
  `name` varchar(45) NOT NULL COMMENT '路由标题',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '路由编码',
  `component` varchar(64) NOT NULL DEFAULT '' COMMENT '组件名',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级路由id',
  `level_path` varchar(45) NOT NULL DEFAULT '' COMMENT '路由层级路径，例如：0.1.2 代表该菜单是三级路由，上级路由的id是1,再上级的路由id是0',
  `level` int(11) NOT NULL COMMENT '路由层级',
  `path` varchar(64) NOT NULL DEFAULT '' COMMENT '路由path',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `hide_children` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏子路由 0-否 1-是',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '路由类型 1：菜单路由 2：页面路由 3: 隐藏页面路由',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限状态 1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`,`application_id`),
  UNIQUE KEY `uk_code` (`code`,`is_deleted`),
  UNIQUE KEY `uk_name` (`name`,`is_deleted`),
  KEY `fk_idx_system_id` (`application_id`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1626224210330099715 DEFAULT CHARSET=utf8mb4 COMMENT='路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_route`
--

/*!40000 ALTER TABLE `iam_route` DISABLE KEYS */;
INSERT INTO `iam_route` VALUES (2,1,'个人页','account','RouteView',0,'2.',1,'','user',0,1,700,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0),(3,1,'结果页','result','PageView',0,'3.',1,'','check-circle-o',0,1,500,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0),(4,1,'详情页','profile','RouteView',0,'4.',1,'','profile',0,1,400,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0),(5,1,'列表页','list','RouteView',0,'5.',1,'','table',0,1,300,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0),(6,1,'仪表盘','dashboard','RouteView',0,'6.',1,'','dashboard',0,1,100,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0),(7,1,'异常页','exception','RouteView',0,'7.',1,'','warning',0,1,600,1,'2020-12-24 15:49:19','2020-12-24 15:49:19',0,0,0),(8,1,'工作台','workplace','Workplace',6,'6.8.',2,'/dashboard/workplace','',0,1,102,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0),(9,1,'分析页','Analysis','Analysis',6,'6.9.',2,'/dashboard/analysis/:pageNo([1-9]\\\\d*)?','',0,1,101,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0),(13,1,'查询表格','table-list','TableList',5,'5.13.',2,'/list/table-list/:pageNo([1-9]\\\\d*)?','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0),(14,1,'标准列表','basic-list','StandardList',5,'5.14.',2,'/list/basic-list','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0),(15,1,'卡片列表','card','CardList',5,'5.15.',2,'/list/card','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0),(16,1,'搜索列表','search','SearchLayout',5,'5.16.',2,'/list/search','',0,1,0,1,'2020-12-24 15:58:43','2020-12-24 15:58:43',0,0,0),(17,1,'基础详情页','basic','ProfileBasic',4,'4.17.',2,'/profile/basic','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(18,1,'高级详情页','advanced','ProfileAdvanced',4,'4.18.',2,'/profile/advanced','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(19,1,'成功','success','ResultSuccess',3,'3.19.',2,'/result/success','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(20,1,'失败','fail','ResultFail',3,'3.20.',2,'/result/fail','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(22,1,'404','404','Exception404',7,'7.22.',2,'/exception/404','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(23,1,'500','500','Exception500',7,'7.23.',2,'/exception/500','',0,1,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(24,1,'个人中心','center','AccountCenter',2,'2.24.',2,'/account/center','',0,2,0,1,'2020-12-24 16:02:53','2020-12-24 16:02:53',0,0,0),(25,1,'个人设置','settings','AccountSettings',2,'2.25.',2,'/account/settings','',1,1,0,1,'2020-12-24 16:02:53','2021-01-04 22:56:19',0,0,0),(26,1,'搜索列表（项目）','project','SearchProjects',16,'5.16.26.',2,'/list/search/project','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0),(27,1,'搜索列表（应用）','application','SearchApplications',16,'5.16.27.',2,'/list/search/application','',0,1,0,1,'2020-12-24 16:03:23','2020-12-24 16:03:23',0,0,0),(28,1,'基本设置','BasicSettings','BasicSettings',25,'2.25.28.',3,'/account/settings/basic','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0),(29,1,'安全设置','SecuritySettings','SecuritySettings',25,'2.25.29.',3,'/account/settings/security','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0),(30,1,'个性化设置','CustomSettings','CustomSettings',25,'2.25.30.',3,'/account/settings/custom','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0),(32,1,'新消息通知','NotificationSettings','NotificationSettings',25,'2.25.32.',3,'/account/settings/notification','',0,2,0,1,'2020-12-24 16:13:50','2020-12-24 16:13:50',0,0,0),(34,1,'搜索列表（文章）','article','SearchArticles',16,'5.16.27.',3,'/list/search/article','',0,1,0,1,'2020-12-24 23:55:30','2020-12-24 23:55:30',0,0,0),(35,1,'其他组件','other','PageView',0,'35.',1,'','slack',0,1,800,1,'2020-12-25 17:23:07','2020-12-25 17:23:07',0,0,0),(36,1,'IconSelector','TestIconSelect','EditList',35,'35.36.',2,'/other/icon-selector','tool',0,1,810,1,'2020-12-25 17:23:15','2020-12-25 17:23:15',0,0,0),(37,1,'业务布局','bizLayout','RouteView',35,'35.37.',2,'','layout',0,1,820,1,'2020-12-25 17:23:20','2020-12-25 17:23:20',0,0,0),(38,1,'树目录表格','TreeList','TreeList',37,'35.37.38.',3,'/other/list/tree-list','',0,1,821,1,'2020-12-25 17:23:24','2020-12-25 17:23:24',0,0,0),(39,1,'内联编辑表格','EditList','EditList',37,'35.37.39.',3,'/other/list/edit-table','',0,1,822,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0),(40,1,'权限列表','PermissionList','PermissionList',37,'35.37.40.',3,'/other/list/system-permission','',0,1,823,1,'2020-12-25 17:23:25','2021-01-04 22:54:33',0,0,0),(42,1,'角色列表','RoleList','RoleList',37,'35.37.42.',3,'/other/list/role-list','',0,1,825,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0),(43,1,'角色列表2','SystemRole','SystemRole',37,'35.37.43.',3,'/other/list/system-role','',0,1,826,1,'2020-12-25 17:23:25','2020-12-25 17:23:25',0,0,0),(44,1,'身份与访问','permission','RouteView',0,'44.',1,'/permission','slack',0,1,1,1,'2020-12-25 17:41:40','2021-01-02 22:57:31',0,0,0),(45,1,'路由管理','permission:route','PermissionRoute',44,'44.45.',2,'/permission/route','',0,2,910,1,'2020-12-25 17:41:45','2021-01-03 16:18:16',0,0,0),(57,1,'表单页','form','RouteView',0,'57.',1,'','form',0,1,2,1,'2020-12-29 17:17:56','2021-01-03 16:29:31',0,0,0),(58,1,'高级表单','advanced-form','AdvanceForm',57,'57.58.',2,'/form/advanced-form','',0,1,0,1,'2020-12-29 17:19:17','2020-12-29 17:19:17',0,0,0),(59,1,'分步表单','step-form','StepForm',57,'57.59.',2,'/form/step-form','',0,1,0,1,'2020-12-29 17:20:20','2020-12-29 17:20:20',0,0,0),(60,1,'基础表单','basic-form','BasicForm',57,'57.60.',2,'/form/base-form','',0,1,0,1,'2020-12-29 17:21:08','2020-12-29 17:21:08',0,0,0),(70,1,'测试子路由','3213','',69,'6.70.',2,'','',0,1,0,1,'2020-12-30 17:00:33','2020-12-30 17:00:44',0,0,0),(71,1,'用户管理','permission:user','PermissionUser',44,'44.71.',2,'/permission/user','',0,2,0,1,'2021-01-02 22:57:49','2021-01-02 22:57:49',0,0,0),(72,1,'用户组管理','permission:usergroup','PermissionUserGroup',44,'44.72.',2,'/permission/usergroup','',0,2,0,1,'2021-01-04 22:44:21','2021-01-04 22:44:21',0,0,0),(73,1,'账号绑定','BindingSettings','BindingSettings',25,'2.25.73.',3,'/account/settings/binding','',0,1,0,1,'2021-01-04 22:57:11','2021-01-04 23:13:44',0,0,0),(74,1,'角色管理','permission:role','PermissionRole',44,'44.74.',2,'/permission/role','',0,2,0,1,'2021-01-07 10:33:37','2021-01-07 10:33:37',0,0,0),(75,1,'应用管理','permission:application','PermissionApplication',44,'44.75.',2,'/permission/application','',0,2,0,1,'2021-01-21 10:28:58','2021-01-21 10:28:58',0,0,0),(76,1,'接口管理','permission:interface','PermissionApi',44,'44.76.',2,'/permission/interface','',0,2,0,1,'2021-01-21 10:29:32','2021-01-21 10:29:32',0,0,0),(77,2,'研发效能','cop','RouteView',0,'77.',1,'/cop','project',0,1,0,1,'2021-05-26 13:16:50','2021-05-26 13:16:50',0,0,0),(78,2,'代码工程','cop:code-project','CodeProject',77,'77.78.',2,'/cop/code-project','',0,1,0,1,'2021-05-26 13:23:11','2021-05-26 13:23:11',0,0,0),(1501071145118257154,3,'商品中心','commodity','RouteView',0,'1501071145118257154.',1,'','slack',0,1,0,1,'2022-03-08 13:43:44','2022-04-18 11:26:50',1,0,0),(1501090428636446722,3,'商品分类','commodity:category','CommodityCategory',1501071145118257154,'1501071145118257154.1501090428636446722.',2,'/commodity/category','',0,2,0,1,'2022-03-08 15:00:22','2022-03-08 15:34:58',1,1,0),(1501091482874757122,3,'商品属性','commodity:attr:template','CommodityAttrTemplate',1501071145118257154,'1501071145118257154.1501091482874757122.',2,'/commodity/attr/template','',0,2,0,1,'2022-03-08 15:04:33','2022-04-14 08:16:02',1,0,0),(1501099262847303682,3,'商品品牌','commodity:brand','CommodityBrand',1501071145118257154,'1501071145118257154.1501099262847303682.',2,'/commodity/brand','',0,2,0,1,'2022-03-08 15:35:28','2022-03-08 15:35:28',1,1,0),(1507770690745217026,3,'商品属性组','commodity:attr:group','CommodityAttrGroup',1501071145118257154,'1501071145118257154.1507770690745217026.',2,'/commodity/attr/group','',0,3,0,1,'2022-03-27 01:25:20','2022-04-14 07:46:08',1,0,0),(1514538324329037825,3,'商品规格属性','commodity:attr','CommodityAttr',1501071145118257154,'1501071145118257154.1514538324329037825.',2,'/commodity/attr','',0,3,0,1,'2022-04-14 17:37:30','2022-04-14 17:40:59',0,0,0),(1514907533453660161,3,'132','123','BasicLayout',0,'1514907533453660161.',1,'123','',0,1,0,1,'2022-04-15 18:04:36','2022-04-15 18:04:36',0,0,1514907533453660161),(1515191685995098114,3,'1','1','404',0,'1515191685995098114.',1,'1','1',0,1,0,1,'2022-04-16 12:54:46','2022-04-16 12:54:50',1,1,1515191685995098114),(1515193173177856002,3,'123','31','404',0,'1515193173177856002.',1,'','',0,1,0,1,'2022-04-16 12:59:38','2022-04-16 13:00:03',1,1,1515193173177856002),(1515894902969925634,3,'商品管理','commodity1:','Commodity',1501071145118257154,'1501071145118257154.1515894902969925634.',2,'/commodity','',0,2,0,1,'2022-04-18 11:28:03','2022-04-18 11:32:47',0,0,0),(1515899373154271234,3,'商品编辑表单','commodityForm','CommodityForm',1501071145118257154,'1501071145118257154.1515899373154271234.',2,'/commodity/form','',0,3,0,1,'2022-04-18 11:45:49','2022-04-18 11:52:31',0,0,0),(1557399233418543106,4,'订单中心','order','RouteView',0,'1557399233418543106.',1,'/order','slack',0,1,0,1,'2022-08-11 00:11:27','2022-08-11 00:12:02',0,0,0),(1557401007147761665,4,'订单管理','order:list','Order',1557399233418543106,'1557399233418543106.1557401007147761665.',2,'/order/list','slack',0,2,0,1,'2022-08-11 00:18:30','2022-08-11 00:25:26',0,0,0),(1626224210330099714,4,'订单详情','order:detail','OrderDetail',1557399233418543106,'1557399233418543106.1626224210330099714.',2,'/order/:id','',0,2,0,1,'2023-02-16 22:17:20','2023-02-16 22:17:20',1,1,0);
/*!40000 ALTER TABLE `iam_route` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_user`
--

DROP TABLE IF EXISTS `iam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL COMMENT '用户名',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `code` varchar(45) NOT NULL DEFAULT '' COMMENT '用户编码',
  `password` varchar(64) NOT NULL COMMENT '用户密码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态：1-已启用；2-已禁用；',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`,`is_deleted`),
  UNIQUE KEY `uk_mobile` (`mobile`,`is_deleted`),
  KEY `idx_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user`
--

/*!40000 ALTER TABLE `iam_user` DISABLE KEYS */;
INSERT INTO `iam_user` VALUES (1,'Admin','Admin','SuperAdmin','$2a$10$Za0yx5PAGKZIviKfDwP7uuWVjCPu2DswMDqAkv93H7Ia0FO6XlbKK',1,'2021-01-21 10:40:47','2021-12-20 22:41:27',0,0,0),(2,'Javis','18588686715','e5584ab9cda147c3956fe1b6af85f448','$2a$10$.VsAKjkii.rQMrs/k0YQMOjhyLPfAB3xvokULboT5kJtKZR8q7k7C',1,'2022-02-16 18:32:24','2022-02-21 18:00:54',0,0,0);
/*!40000 ALTER TABLE `iam_user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_user_group`
--

DROP TABLE IF EXISTS `iam_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_user_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父用户组id，关联id',
  `name` varchar(45) NOT NULL COMMENT '用户组名称',
  `level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '用户组层级',
  `level_path` varchar(45) NOT NULL DEFAULT '' COMMENT '部门层级',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户组类型 1-公司 2-部门',
  `inherit_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '继承类型 0-不继承 1-继承上级用户组 2-继承所有用户组',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户组状态：1-已启用；2-已禁用；',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_deleted` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识 0-表示未删除 大于0-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `idx_is_deleted` (`is_deleted`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_group`
--

/*!40000 ALTER TABLE `iam_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `iam_user_group` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_user_group_role_rel`
--

DROP TABLE IF EXISTS `iam_user_group_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_user_group_role_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_group_id` bigint(20) unsigned NOT NULL COMMENT '用户组id，关联upms_user_group.id',
  `role_id` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '角色id，关联upms_role.id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_group_id_role_id` (`user_group_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组与角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_group_role_rel`
--

/*!40000 ALTER TABLE `iam_user_group_role_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `iam_user_group_role_rel` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_user_group_user_rel`
--

DROP TABLE IF EXISTS `iam_user_group_user_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_user_group_user_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_group_id` bigint(20) unsigned NOT NULL COMMENT '用户组名称，关联upms_user_group.id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '用户id，关联upms_user_id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_group_id_user_id` (`user_group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组与用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_group_user_rel`
--

/*!40000 ALTER TABLE `iam_user_group_user_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `iam_user_group_user_rel` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: iam
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iam_user_role_rel`
--

DROP TABLE IF EXISTS `iam_user_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iam_user_role_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id，关联upms_role.id',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色id，关联upms_role.id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `modifier` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iam_user_role_rel`
--

/*!40000 ALTER TABLE `iam_user_role_rel` DISABLE KEYS */;
INSERT INTO `iam_user_role_rel` VALUES (1,1,1,'2021-01-21 10:40:47','2021-01-21 10:40:47',0,0),(2,2,2,'2022-02-21 18:00:54','2022-02-21 18:00:54',0,0);
/*!40000 ALTER TABLE `iam_user_role_rel` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:15:09

alter table iam_permission
    add application_id bigint default 1 not null comment '应用id' after id;

alter table iam_permission_role_rel
    drop key uk_permission_id_role_id;

drop index idx_is_deleted on iam_permission;

alter table iam_api
    drop key uk_application_id_url_method;

alter table iam_api
    add constraint uk_application_id_url_method
        unique (application_id, uri, method);

create index idx_role_id_permission_id
    on iam_permission_role_rel (role_id, permission_id);

alter table iam_user
    change mobile mobile char(11) not null comment '手机号码';

alter table iam_user
    drop key uk_phone;

alter table iam_user
    add constraint uk_mobile
        unique (mobile, is_deleted);
