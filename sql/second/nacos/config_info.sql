INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (75, 'iam.yml', 'DEFAULT_GROUP', 'server:
  port: 8080
spring:
  application:
    name: iam
  datasource:
    url: jdbc:p6spy:mysql://mysql.ark.com:3306/iam?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
    username: root
    password: root
    name: defaultDataSource
    driver-class-name: com.p6spy.engine.spy.P6SpyDriver
ark:
  component:
    mq:
      rocketmq:
        enabled: true
        server: rocketmq.ark-dev.svc:9876
        producer:
          group: \'iam_pg\'', 'cc4d509adc74f8c02ba7d42fdf9c4c67', '2023-06-02 17:40:13', '2023-09-12 10:32:35', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (76, 'eop.yml', 'DEFAULT_GROUP', 'server:
  port: 8081
spring:
  application:
    name: eop
  datasource:
    druid:
      url: jdbc:mysql://gz-cynosdbmysql-grp-irl7x9ar.sql.tencentcdb.com:20716/eop?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
      username: kt_cloud8888
      password: Kt.cloud1234!@#$
      name: defaultDataSource
      driver-class-name: com.mysql.cj.jdbc.Driver
      initial-size: 10
      max-active: 100
      max-open-prepared-statements: 20
      max-pool-prepared-statement-per-connection-size: 20
      max-wait: 60000
      min-idle: 10
      pool-prepared-statements: true
      test-on-borrow: false
      test-on-return: false
      test-while-idle: true
  main:
    allow-bean-definition-overriding: true
biz-module:
  git:
    gitee:
      client-id: dc7f80b02163e4f76fbcffb03eff926566aaf19f2c51a0339391a599d60b32ba
      client-secret: b68bc45b2f30ee460e8dfa468242697f276b144778bfb9011e29ee4253e8d03d
      email: javischen9548@foxmail.com
      password: javis9548chen
      scope: "user_info projects pull_requests issues notes keys hook groups gists enterprises"
      access-token: 3814b82ee62c6d47511fd238879e2561
    github:
      authorization: Basic amF2aXNDaGVuOmdocF9xVWpzS1NVdHNBUUFRQ09zZEdkV1JOTERJbFFqQlgwbXJJa0s=
  generate:
    temp-dir:

mybatis-plus:
  global-config:
    db-config:
      logic-delete-field: is_deleted
      logic-not-delete-value: 0
', '944acfcc9184d160e2e85ab02fad7489', '2023-06-02 17:40:13', '2023-06-02 17:40:13', null, '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', null, null, 'yaml', null, '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (77, 'commodity.yml', 'DEFAULT_GROUP', 'server:
  port: 8083
  servlet:
    context-path: 
spring:
  application:
    name: commodity
  datasource:
    url: jdbc:p6spy:mysql://mysql.ark.com:3306/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
    username: root
    password: root
    name: defaultDataSource
    driver-class-name: com.p6spy.engine.spy.P6SpyDriver
  data:
    elasticsearch:
      repositories:
        enabled: true
  elasticsearch:
    uris: http://es-01:9200
    username: elastic
knife4j:
  enable: true
  production: false', '5e6ae5a19804b0abacaac49214feaf0d', '2023-06-02 17:40:13', '2023-10-10 17:19:01', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '8083', '', '', 'yaml', '', '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (78, 'gateway.yml', 'DEFAULT_GROUP', 'server:
  port: 8082
spring:
  cloud:
    gateway:
      globalcors:
        cors-configurations:
          \'[/**]\':
            # 设置允许的域名
            allowedOrigins:
              - "*"
            # 允许所有头信息
            allowedHeaders: "*"
            # 设置允许携带cookie
            # 为true时allowedOrigins不允许为* 会报错
            allowCredentials: false
            # 允许跨域请求的请求方式
            allowedMethods:
              - GET
              - POST
              - DELETE
              - PUT
      discovery:
        locator:
          enabled: true
          lower-case-service-id: true
      routes:
        - id: gateway
          uri: localhost:${server.port}
          predicates:
            - Path=/${spring.application.name}/**
        - id: iam
          uri: lb://iam
          predicates:
            - Path=/iam/**
        - id: eop
          uri: lb://eop
          predicates:
            - Path=/eop/**
        - id: commodity
          uri: lb://commodity
          predicates:
            - Path=/commodity/**
  application:
    name: gateway
ark:
  center:
    gateway:
      allow-list:
        - /auth/v1/login/*
        - /auth/v1/logout
        - /auth/v1/code/sms
        - /oss/v1/oss/upload
feign:
  okhttp:
    enabled: true', 'bb2c2178b83e9018389fd3850c033283', '2023-06-02 17:40:13', '2023-09-18 16:58:02', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (79, 'oss.yml', 'DEFAULT_GROUP', 'server:
  port: 8084
  servlet:
    context-path: 
spring:
  application:
    name: oss
  main:
    allow-bean-definition-overriding: true
  autoconfigure:
    exclude: org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration
ark:
  component:
    oss:
      minio:
        end-point: http://minio.ark-dev.svc:9000
        access-key: admin
        secret-key: admin123456
        enabled: true
      aliyun:
        enabled: false', '22aad5ca01c7b05c8fa0d9978288bd53', '2023-06-02 17:40:13', '2023-06-02 17:40:13', null, '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', null, null, 'yaml', null, '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (80, 'common.yml', 'DEFAULT_GROUP', 'spring:
  data:
    redis:
      host: redis.ark-dev.svc
      port: 6379', 'fda02afdc896b20a8def69b839287eba', '2023-06-02 17:40:13', '2023-09-18 13:59:42', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (81, 'pay.yml', 'DEFAULT_GROUP', 'server:
  port: 8086
  servlet:
    context-path: 
spring:
  application:
    name: pay
  datasource:
    url: jdbc:p6spy:mysql://mysql.ark.com:3306/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
    username: root
    password: root
    name: defaultDataSource
    driver-class-name: com.p6spy.engine.spy.P6SpyDriver
knife4j:
  enable: true
  production: false
ark:
  component:
    mq:
      rocketmq:
        producer:
          group: pg_pay
          enabled: true
        server: rocketmq.ark-dev.svc:9876', '71110b66e6f2e6b021002f73e94bf2a2', '2023-06-02 17:40:13', '2023-10-10 15:59:53', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (82, 'trade.yml', 'DEFAULT_GROUP', 'server:
  port: 8085
  servlet:
    context-path: 
spring:
  application:
    name: trade
  datasource:
    url: jdbc:p6spy:mysql://mysql.ark.com:3306/trade?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
    username: root
    password: root
    name: defaultDataSource
    driver-class-name: com.p6spy.engine.spy.P6SpyDriver
knife4j:
  enable: true
  production: false
ark:
  component:
    mq:
      rocketmq:
        producer:
          group: trade_group
        server: rocketmq.ark-dev.svc:9876', '3b447ce2d45bc53c79dc2f7925dd43e8', '2023-06-02 17:40:13', '2023-10-10 15:59:21', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (85, 'auth.yml', 'DEFAULT_GROUP', 'server:
  port: 8089
spring:
  application:
    name: auth
  datasource:
    url: jdbc:mysql://mysql.ark.com:3306/iam?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
    username: root
    password: root
    name: defaultDataSource
    driver-class-name: com.mysql.cj.jdbc.Driver
ark:
  component:
    mq:
      rocketmq:
        enabled: true
        server: rocketmq.ark-dev.svc:9876
        producer:
          group: \'auth_pg\'', '6984ba492a405ac7ad3dba8bc7929111', '2023-06-14 17:26:13', '2023-09-08 10:43:45', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
