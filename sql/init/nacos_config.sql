-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `config_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (10,'iam-dev.yml','DEFAULT_GROUP','server:\n  port: 8080\nspring:\n  application:\n    name: iam\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/iam?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\nark:\n  security:\n    allow-list:\n      - /iam/auth/login\n      - /iam/auth/logout\n      - /iam/auth/kick\n      - /iam/api/init\n      - /iam/user/permission/check\n      - /iam/alert/*\n      - /iam/docker\n\nlogging:\n  level:\n    root: info','0dfd489470ff3dce0fd1c18ba0c05a9f','2022-02-25 15:49:07','2022-10-20 16:17:53','nacos','172.18.0.1','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','',''),(11,'eop-dev.yml','DEFAULT_GROUP','server:\n  port: 8081\nspring:\n  application:\n    name: eop\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/eop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\nbiz-module:\n  git:\n    gitee:\n      client-id: dc7f80b02163e4f76fbcffb03eff926566aaf19f2c51a0339391a599d60b32ba\n      client-secret: b68bc45b2f30ee460e8dfa468242697f276b144778bfb9011e29ee4253e8d03d\n      email: javischen9548@foxmail.com\n      password: javis9548chen\n      scope: \"user_info projects pull_requests issues notes keys hook groups gists enterprises\"\n      access-token: 3814b82ee62c6d47511fd238879e2561\n    github:\n      authorization: Basic amF2aXNDaGVuOmdocF9xVWpzS1NVdHNBUUFRQ09zZEdkV1JOTERJbFFqQlgwbXJJa0s=\n  generate:\n    temp-dir:\n\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: is_deleted\n      logic-not-delete-value: 0\n','944acfcc9184d160e2e85ab02fad7489','2022-02-25 15:52:58','2022-08-08 15:49:39','nacos','0:0:0:0:0:0:0:1','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','',''),(17,'commodity-dev.yml','DEFAULT_GROUP','server:\n  port: 8083\n  servlet:\n    context-path: \nspring:\n  application:\n    name: commodity\n  datasource:\n    druid:\n      url: jdbc:p6spy:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.p6spy.engine.spy.P6SpyDriver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\nknife4j:\n  enable: true\n  production: false','a90087ea0b0906e05dafddafa06578a1','2022-02-26 09:46:04','2022-09-06 18:04:26','nacos','172.18.0.1','','aaff0c75-80b1-4c85-ad3f-c625501368ba','8083','','','yaml','',''),(18,'gateway-dev.yml','DEFAULT_GROUP','server:\n  port: 8082\nspring:\n  cloud:\n    gateway:\n      globalcors:\n        cors-configurations:\n          \'[/**]\':\n            # 设置允许的域名\n            allowedOrigins:\n              - \"*\"\n            # 允许所有头信息\n            allowedHeaders: \"*\"\n            # 设置允许携带cookie\n            # 为true时allowedOrigins不允许为* 会报错\n            allowCredentials: false\n            # 允许跨域请求的请求方式\n            allowedMethods:\n              - GET\n              - POST\n              - DELETE\n              - PUT\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: gateway\n          uri: localhost:${server.port}\n          predicates:\n            - Path=/${spring.application.name}/**\n        - id: iam\n          uri: lb://iam\n          predicates:\n            - Path=/iam/**\n        - id: eop\n          uri: lb://eop\n          predicates:\n            - Path=/eop/**\n        - id: commodity\n          uri: lb://commodity\n          predicates:\n            - Path=/commodity/**\n  application:\n    name: gateway\n  main:\n    allow-bean-definition-overriding: true\nlogging:\n  level:\n    root: info\n    org:\n      springframework:\n        cloud:\n          gateway:\n            filter:\n              LoadBalancerClientFilter: trace\n    com:\n      kt:\n        cloud:\n          iam:\n            api:\n              access: debug\nark:\n  center:\n    gateway:\n      allow-list:\n        - /iam/login/account\n        - /iam/logout\n        - /iam/user/permission/elements\n        - /iam/user/permission/routes\n        - /commodity/**\n    feign:\n      transmit-headers: X-Authorization, X-Trace-Id\nfeign:\n  okhttp:\n    enabled: true','f870b92f70c8e04759ff4ab7225980f6','2022-02-26 09:46:24','2022-10-20 16:37:45','nacos','172.18.0.1','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','',''),(25,'oss-dev.yml','DEFAULT_GROUP','server:\n  port: 8084\n  servlet:\n    context-path: \nspring:\n  application:\n    name: oss\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration\nark:\n  component:\n    oss:\n      minio:\n        end-point: http://minio.ark-dev.svc:9000\n        access-key: admin\n        secret-key: admin123456\n        enabled: true\n      aliyun:\n        enabled: false','22aad5ca01c7b05c8fa0d9978288bd53','2022-02-28 04:47:37','2023-01-31 17:52:34','nacos','192.168.65.4','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','',''),(33,'common-dev.yml','DEFAULT_GROUP','spring:\n  redis:\n    host: redis.ark-dev.svc\n    port: 6379','4170708250f1bc0b4bf9a1619d126d4c','2022-03-08 05:33:22','2023-01-31 10:15:59','nacos','192.168.65.3','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','',''),(50,'pay-dev.yml','DEFAULT_GROUP','server:\n  port: 8086\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: true\n        server: rocketmq.ark-dev.svc:9876','a4682e63f39776520c39e253521c7d16','2022-08-11 06:09:13','2023-02-01 21:41:02','nacos','192.168.65.4','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','',''),(70,'trade-dev.yml','DEFAULT_GROUP','server:\n  port: 8085\nspring:\n  application:\n    name: trade\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/trade?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: trade_group\n        server: rocketmq.ark-dev.svc:9876','56c9415927efa9d87934cc3346741410','2023-02-02 14:01:27','2023-02-09 19:06:46','nacos','172.18.0.1','','aaff0c75-80b1-4c85-ad3f-c625501368ba','','','','yaml','','');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `config_info_aggr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `config_info_beta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `config_info_tag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `config_tags_relation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `group_capacity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `his_config_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (33,86,'common-dev.yml','DEFAULT_GROUP','','spring:\n  redis:\n    host: redis.cloud.org\n    port: 6379','d52351ddb937a4b0a4eb57007d6103ca','2023-01-31 10:15:29','2023-01-31 10:15:29','nacos','192.168.65.3','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(33,87,'common-dev.yml','DEFAULT_GROUP','','spring:\n  redis:\n    host: redis.ark.com\n    port: 6379','6eaed3e83dbac1f4478c4cbda5351f21','2023-01-31 10:15:58','2023-01-31 10:15:59','nacos','192.168.65.3','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(25,88,'oss-dev.yml','DEFAULT_GROUP','','server:\n  port: 8084\n  servlet:\n    context-path: \nspring:\n  application:\n    name: oss\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration\nark:\n  component:\n    oss:\n      minio:\n        end-point: http://file.cloud.org:9000\n        access-key: admin\n        secret-key: admin123456\n        enabled: true\n      aliyun:\n        enabled: false','6439284f218f9075bb01a4ab863e2015','2023-01-31 17:42:20','2023-01-31 17:42:20','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(25,89,'oss-dev.yml','DEFAULT_GROUP','','server:\n  port: 8084\n  servlet:\n    context-path: \nspring:\n  application:\n    name: oss\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration\nark:\n  component:\n    oss:\n      minio:\n        end-point: minio.ark-dev:9000\n        access-key: admin\n        secret-key: admin123456\n        enabled: true\n      aliyun:\n        enabled: false','434f79b7b2b6a4f2374250bd4ef95033','2023-01-31 17:47:54','2023-01-31 17:47:54','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(25,90,'oss-dev.yml','DEFAULT_GROUP','','server:\n  port: 8084\n  servlet:\n    context-path: \nspring:\n  application:\n    name: oss\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration\nark:\n  component:\n    oss:\n      minio:\n        end-point: minio.ark-dev.svc:9000\n        access-key: admin\n        secret-key: admin123456\n        enabled: true\n      aliyun:\n        enabled: false','0298e74d8beecf670d542cd5314c0505','2023-01-31 17:52:34','2023-01-31 17:52:34','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(48,91,'order-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: order\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        server: rocket.cloud.org:9876','17e4c7a2388acb97b20a6d51dd080581','2023-01-31 18:25:01','2023-01-31 18:25:02','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(48,92,'order-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: order\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        server: rockqtmq.ark-dev.svc:9876','b0cbae9742ce09d5f0040a12409fd8d7','2023-01-31 18:25:36','2023-01-31 18:25:37','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,93,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8086\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n        server: localhost:9876','d66b8fdf195d1d48f1928f162628b458','2023-01-31 18:33:28','2023-01-31 18:33:28','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,94,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8086\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n        server: rocketmq.ark-dev.svc:9876','91d1c47853de7ef7a7ff1288fcd88b3f','2023-02-01 09:32:37','2023-02-01 09:32:38','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,95,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8086\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          enabled: true\n          group: pg_pay\n        server: rocketmq.ark-dev.svc:9876','0374411d4f9db80c32c994b5b53e7894','2023-02-01 21:37:29','2023-02-01 21:37:29','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,96,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8086\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          enabled: true\n          group: pg_pay\n        server: rocketmq.ark-dev.svc:9876\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: true\n        server: rocketmq.ark-dev.svc:9876','fff2491ac60e2d90f72a223f8f6b4fe2','2023-02-01 21:37:40','2023-02-01 21:37:41','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,97,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8086\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: true\n        server: rocketmq.ark-dev.svc:9876','a4682e63f39776520c39e253521c7d16','2023-02-01 21:38:02','2023-02-01 21:38:02','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,98,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8807\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: true\n        server: rocketmq.ark-dev.svc:9876','1e681fcb7c4de9faf6b339e9801700d1','2023-02-01 21:38:33','2023-02-01 21:38:33','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,99,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8806\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: true\n        server: rocketmq.ark-dev.svc:9876','7fc8a759d648f9e90085a6532d050a94','2023-02-01 21:38:38','2023-02-01 21:38:39','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,100,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8806\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: false\n        server: rocketmq.ark-dev.svc:9876','1906113fb44b9fd44a9124ae7d4f14bb','2023-02-01 21:38:47','2023-02-01 21:38:48','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,101,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8806\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: false\n        server: rocketmq.ark-dev.svc:9876','1906113fb44b9fd44a9124ae7d4f14bb','2023-02-01 21:39:14','2023-02-01 21:39:15','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,102,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8806\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n        server: rocketmq.ark-dev.svc:9876','c7a67ed8057c2434d3153d78667561fc','2023-02-01 21:39:40','2023-02-01 21:39:40','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(50,103,'pay-dev.yml','DEFAULT_GROUP','','server:\n  port: 8806\nspring:\n  application:\n    name: pay\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n  main:\n    allow-bean-definition-overriding: true\n# mybatis\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: pg_pay\n          enabled: true\n        server: rocketmq.ark-dev.svc:9876','7fc8a759d648f9e90085a6532d050a94','2023-02-01 21:41:02','2023-02-01 21:41:02','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(48,104,'order-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: order\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        server: rocketmq.ark-dev.svc:9876','f8e3db7b148ed8098657a84055c1dfa9','2023-02-02 14:01:09','2023-02-02 14:01:09','nacos','192.168.65.4','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(0,105,'trade-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: trade\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        server: rocketmq.ark-dev.svc:9876','e9fe11bc4221ed05f9e30be7ea3ab866','2023-02-02 14:01:26','2023-02-02 14:01:27',NULL,'192.168.65.4','I','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(48,106,'order-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: trade\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        server: rocketmq.ark-dev.svc:9876','e9fe11bc4221ed05f9e30be7ea3ab866','2023-02-02 14:01:31','2023-02-02 14:01:31',NULL,'192.168.65.4','D','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(70,107,'trade-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: trade\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        server: rocketmq.ark-dev.svc:9876','e9fe11bc4221ed05f9e30be7ea3ab866','2023-02-09 00:16:45','2023-02-09 00:16:45','nacos','172.21.0.1','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(70,108,'trade-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: trade\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/order?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: \"trade_group\"\n        server: rocketmq.ark-dev.svc:9876','96fb86aa60be6f063b2bfa3ccb59ed0b','2023-02-09 18:05:05','2023-02-09 18:05:04','nacos','172.18.0.1','U','aaff0c75-80b1-4c85-ad3f-c625501368ba',''),(70,109,'trade-dev.yml','DEFAULT_GROUP','','server:\n  port: 8085\nspring:\n  application:\n    name: trade\n  datasource:\n    druid:\n      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/trade?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True\n      username: kt_cloud8888\n      password: Kt.cloud1234!@#$\n      name: defaultDataSource\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 10\n      max-active: 100\n      max-open-prepared-statements: 20\n      max-pool-prepared-statement-per-connection-size: 20\n      max-wait: 60000\n      min-idle: 10\n      pool-prepared-statements: true\n      test-on-borrow: false\n      test-on-return: false\n      test-while-idle: true\n\nark:\n  component:\n    mq:\n      rocketmq:\n        producer:\n          group: trade_group\n        server: rocketmq.ark-dev.svc:9876','56c9415927efa9d87934cc3346741410','2023-02-09 19:06:47','2023-02-09 19:06:46','nacos','172.18.0.1','U','aaff0c75-80b1-4c85-ad3f-c625501368ba','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `tenant_capacity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `tenant_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
INSERT INTO `tenant_info` VALUES (1,'1','aaff0c75-80b1-4c85-ad3f-c625501368ba','dev','开发环境','nacos',1645783278240,1645783278240),(2,'1','74ac3a8d-d15e-4f1b-a5cd-112f438c975d','sit','系统集成测试环境','nacos',1645783291848,1645783291848);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.235.44.39    Database: nacos_config
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
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$V749LJiYy1tUGVDG7Mu/R.g1uqrm9FFF.iLAP78LWqcyManu/N60y',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 18:12:08
