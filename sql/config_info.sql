INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (75, 'iam.yml', 'DEFAULT_GROUP', 'server:
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
  security:
    allow-list:
      - /iam/v1/login/account
      - /iam/v1/logout
      - /iam/v1/kick
      - /iam/api/init
      - /iam/user/permission/check
      - /iam/alert/*
      - /iam/docker', 'bef9dddc5f16445b06aab1c648207cb5', '2023-06-02 17:40:13', '2023-06-14 15:03:20', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
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
  production: false', 'a566f3cabe7878879ba4fc7925346055', '2023-06-02 17:40:13', '2023-06-02 17:40:13', null, '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '8083', null, null, 'yaml', null, '');
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
logging:
  level:
    root: info
    org:
      springframework:
        cloud:
          gateway:
            filter:
              LoadBalancerClientFilter: trace
    com:
      kt:
        cloud:
          iam:
            api:
              access: debug
ark:
  center:
    gateway:
      allow-list:
        - /iam/v1/login/account
        - /iam/v1/logout
        - /iam/v1/user/permission/elements
        - /iam/v1/user/permission/routes
        - /commodity/v1/**
    feign:
      transmit-headers: X-Authorization, X-Trace-Id
feign:
  okhttp:
    enabled: true', '173d3b53b51ca9cbe3c3c6ec3c8258ee', '2023-06-02 17:40:13', '2023-06-06 16:24:30', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
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
      port: 6379', 'fda02afdc896b20a8def69b839287eba', '2023-06-02 17:40:13', '2023-06-02 17:40:13', null, '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', null, null, 'yaml', null, '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (81, 'pay.yml', 'DEFAULT_GROUP', 'server:
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
        server: rocketmq.ark-dev.svc:9876', '8bb002aa8632eb646700f598369df8bf', '2023-06-02 17:40:13', '2023-06-02 17:40:13', null, '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', null, null, 'yaml', null, '');
INSERT INTO nacos_config.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (82, 'trade.yml', 'DEFAULT_GROUP', 'server:
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
        server: rocketmq.ark-dev.svc:9876', '9defd7f2098894b5fbc14e5841f411e2', '2023-06-02 17:40:13', '2023-06-02 17:40:13', null, '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', null, null, 'yaml', null, '');
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
    driver-class-name: com.mysql.cj.jdbc.Driver', 'aaec9dd4fb1e162c1c2d0b623dcaa56f', '2023-06-14 17:26:13', '2023-06-14 17:26:38', 'nacos', '172.18.0.1', '', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '', '', '', 'yaml', '', '');
