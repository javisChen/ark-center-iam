insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (75, 173, 'iam.yml', 'DEFAULT_GROUP', '', 'server:
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
          group: ''iam_pg''', 'cc4d509adc74f8c02ba7d42fdf9c4c67', '2023-11-30 04:55:04', '2023-11-30 12:55:05', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (85, 174, 'auth.yml', 'DEFAULT_GROUP', '', 'server:
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
          group: ''auth_pg''', '6984ba492a405ac7ad3dba8bc7929111', '2023-11-30 04:55:14', '2023-11-30 12:55:15', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (85, 175, 'auth.yml', 'DEFAULT_GROUP', '', 'server:
  port: 8089
spring:
  application:
    name: auth
  datasource:
    url: jdbc:mysql://mysql:3306/iam?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
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
          group: ''auth_pg''', 'bf8f534f1be0d474fd4b678b6e0eb144', '2023-11-30 05:01:35', '2023-11-30 13:01:35', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (85, 176, 'auth.yml', 'DEFAULT_GROUP', '', 'server:
  port: 8089
spring:
  application:
    name: auth
  datasource:
    url: jdbc:mysql://mysql:3306/iam?useSSL=false&useUnicode=true&characterEncoding=UTF-8&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&serverTimezone=UTC&allowPublicKeyRetrieval=True
    username: root
    password: root
    name: defaultDataSource
    driver-class-name: com.mysql.cj.jdbc.Driver
ark:
  component:
    mq:
      rocketmq:
        enabled: true
        server: rocketmq:9876
        producer:
          group: ''auth_pg''', '8daabbd972d5ce5654e527483546f786', '2023-11-30 05:01:47', '2023-11-30 13:01:47', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (77, 177, 'commodity.yml', 'DEFAULT_GROUP', '', 'server:
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
  production: false', '5e6ae5a19804b0abacaac49214feaf0d', '2023-11-30 05:07:09', '2023-11-30 13:07:09', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (79, 178, 'oss.yml', 'DEFAULT_GROUP', '', 'server:
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
        enabled: false', '22aad5ca01c7b05c8fa0d9978288bd53', '2023-11-30 05:08:39', '2023-11-30 13:08:40', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (81, 179, 'pay.yml', 'DEFAULT_GROUP', '', 'server:
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
        server: rocketmq.ark-dev.svc:9876', '71110b66e6f2e6b021002f73e94bf2a2', '2023-11-30 05:08:59', '2023-11-30 13:08:59', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
insert into MY_TABLE (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) values (82, 180, 'trade.yml', 'DEFAULT_GROUP', '', 'server:
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
        server: rocketmq.ark-dev.svc:9876', '3b447ce2d45bc53c79dc2f7925dd43e8', '2023-11-30 05:09:12', '2023-11-30 13:09:12', 'nacos', '192.168.65.1', 'U', 'aaff0c75-80b1-4c85-ad3f-c625501368ba', '');
