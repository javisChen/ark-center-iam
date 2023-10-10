INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (78, 164, 'gateway.yml', 'DEFAULT_GROUP', '', 'server:
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
        - /auth/v1/code/sms
feign:
  okhttp:
    enabled: true', 'a45545757ec4bc534ead7d943db8ee34', '2023-09-11 08:01:14', '2023-09-11 16:01:14', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (75, 165, 'iam.yml', 'DEFAULT_GROUP', '', 'server:
  port: 8080
spring:
  application:
    name: iam
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
          group: \'iam_pg\'', 'fc0d89e3069bd442da543bc5c7de8b83', '2023-09-12 02:32:34', '2023-09-12 10:32:35', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (77, 166, 'commodity.yml', 'DEFAULT_GROUP', '', 'server:
  port: 8083
  servlet:
    context-path: 
spring:
  application:
    name: commodity
  datasource:
    druid:
      url: jdbc:p6spy:mysql://mysql.ark.com:3306/commodity?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
      username: root
      password: root
      name: defaultDataSource
      driver-class-name: com.p6spy.engine.spy.P6SpyDriver
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
knife4j:
  enable: true
  production: false', 'a566f3cabe7878879ba4fc7925346055', '2023-09-12 03:07:16', '2023-09-12 11:07:16', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (77, 167, 'commodity.yml', 'DEFAULT_GROUP', '', 'server:
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
knife4j:
  enable: true
  production: false', '236a2bfe349e1c0a9c40d58e4c4db7ec', '2023-09-12 03:23:36', '2023-09-12 11:23:36', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (80, 168, 'common.yml', 'DEFAULT_GROUP', '', 'spring:
  data:
    redis:
      host: redis.ark-dev.svc
      port: 6379', 'fda02afdc896b20a8def69b839287eba', '2023-09-18 05:59:42', '2023-09-18 13:59:42', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (78, 169, 'gateway.yml', 'DEFAULT_GROUP', '', 'server:
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
feign:
  okhttp:
    enabled: true', '8d5fa53dd6d53c5a0f9b98818c3c35a2', '2023-09-18 08:58:01', '2023-09-18 16:58:02', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (82, 170, 'trade.yml', 'DEFAULT_GROUP', '', 'server:
  port: 8085
spring:
  application:
    name: trade
  datasource:
    druid:
      url: jdbc:mysql://mysql.ark.com:3306/trade?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
      username: root
      password: root
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

ark:
  component:
    mq:
      rocketmq:
        producer:
          group: trade_group
        server: rocketmq.ark-dev.svc:9876', '9defd7f2098894b5fbc14e5841f411e2', '2023-10-10 07:59:21', '2023-10-10 15:59:21', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (81, 171, 'pay.yml', 'DEFAULT_GROUP', '', 'server:
  port: 8086
spring:
  application:
    name: pay
  datasource:
    druid:
      url: jdbc:mysql://localhost:3306/pay?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
      username: root
      password: root
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
# mybatis
mybatis-plus:
  mapper-locations: classpath:mapper/*.xml

ark:
  component:
    mq:
      rocketmq:
        producer:
          group: pg_pay
          enabled: true
        server: rocketmq.ark-dev.svc:9876', '8bb002aa8632eb646700f598369df8bf', '2023-10-10 07:59:53', '2023-10-10 15:59:53', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
INSERT INTO nacos_config.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (77, 172, 'commodity.yml', 'DEFAULT_GROUP', '', 'server:
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
knife4j:
  enable: true
  production: false', '236a2bfe349e1c0a9c40d58e4c4db7ec', '2023-10-10 09:19:00', '2023-10-10 17:19:01', 'nacos', '172.18.0.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
