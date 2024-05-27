## 目录

<!-- TOC -->
  * [目录](#目录)
  * [介绍](#介绍)
* [功能点](#功能点)
* [运行](#运行)
  * [Docker Build](#docker-build)
  * [Docker Run](#docker-run)
* [目录结构](#目录结构)
* [系统设计简述](#系统设计简述)
* [数据模型](#数据模型)
  * [ER图](#er图)
  * [表说明](#表说明)
<!-- TOC -->

## 介绍
用户中心

# 功能点

-[x] 应用管理
-[x] 用户管理
-[x] 用户组管理
-[x] 角色管理
-[x] 接口管理
-[x] 路由管理

# 运行

## Docker Build

```shell
docker build -f ./ark-center-iam-start/Dockerfile -t ark-center-iam:v1 ./ark-center-iam-start
```

## Docker Run

```shell
docker run -p 8080:8080 --name ark-center-iam -d \
-e NACOS_DISCOVERY_IP=172.24.80.20 \
-e DISCOVERY_SERVER_ADDR=172.24.80.20:8848 \
-e NACOS_CONFIG_SERVER_ADDR=172.24.80.20:8848 \
-e SYS_OPT=-DSpring.profiles.active=dev \
ark-center-iam:v1
```

# 目录结构

```
├── asserts         -- 项目资源（sql等）
├── ark-center-iam-auth    -- 认证模块
├── ark-center-iam-web     -- 权限系统运行模块
└── pom.xml

```

# 系统设计简述

# 数据模型

## ER图

![](asserts/ark-center-iam-er.png)

## 表说明

| 表名                      | 说明        |
|-------------------------|-----------|
| iam_user_group          | 用户组表      |
| iam_user_group_user_rel | 用户组与用户关联表 |
| iam_user_group_role_rel | 用户组与角色关联表 |
| iam_user                | 用户表       |
| iam_role                | 角色表       |
| iam_user_role_rel       | 用户角色关联表   |
| iam_permission          | 权限表       |
| iam_permission_role_rel | 角色与权限联表   |
| iam_menu               | 前端路由表     |
| iam_element             | 页面元素表     |
| iam_api                 | api表      |
| iam_application         | 应用表       |