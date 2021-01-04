truncate table upms_route;
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (2, '个人页', 'account', 'RouteView', 0, '2.', 1, '', 'user', 0, 1, 700, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (3, '结果页', 'result', 'PageView', 0, '3.', 1, '', 'check-circle-o', 0, 1, 500, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (4, '详情页', 'profile', 'RouteView', 0, '4.', 1, '', 'profile', 0, 1, 400, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (5, '列表页', 'list', 'RouteView', 0, '5.', 1, '', 'table', 0, 1, 300, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (6, '仪表盘', 'dashboard', 'RouteView', 0, '6.', 1, '', 'dashboard', 0, 1, 100, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (7, '异常页', 'exception', 'RouteView', 0, '7.', 1, '', 'warning', 0, 1, 600, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (8, '工作台', 'workplace', 'Workplace', 6, '6.8.', 2, '/dashboard/workplace', '', 0, 1, 102, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (9, '分析页', 'Analysis', 'Analysis', 6, '6.9.', 2, '/dashboard/analysis/:pageNo([1-9]\\\\d*)?', '', 0, 1, 101, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (13, '查询表格', 'table-list', 'TableList', 5, '5.13.', 2, '/list/table-list/:pageNo([1-9]\\\\d*)?', '', 0, 1, 0, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (14, '标准列表', 'basic-list', 'StandardList', 5, '5.14.', 2, '/list/basic-list', '', 0, 1, 0, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (15, '卡片列表', 'card', 'CardList', 5, '5.15.', 2, '/list/card', '', 0, 1, 0, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (16, '搜索列表', 'search', 'SearchLayout', 5, '5.16.', 2, '/list/search', '', 0, 1, 0, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (17, '基础详情页', 'basic', 'ProfileBasic', 4, '4.17.', 2, '/profile/basic', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (18, '高级详情页', 'advanced', 'ProfileAdvanced', 4, '4.18.', 2, '/profile/advanced', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (19, '成功', 'success', 'ResultSuccess', 3, '3.19.', 2, '/result/success', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (20, '失败', 'fail', 'ResultFail', 3, '3.20.', 2, '/result/fail', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (22, '404', '404', 'Exception404', 7, '7.22.', 2, '/exception/404', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (23, '500', '500', 'Exception500', 7, '7.23.', 2, '/exception/500', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (24, '个人中心', 'center', 'AccountCenter', 2, '2.24.', 2, '/account/center', '', 0, 1, 0, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (25, '个人设置', 'settings', 'AccountSettings', 2, '2.25.', 2, '/account/settings', '', 1, 1, 0, 1, '2020-12-24 16:02:53', '2021-01-04 22:56:19', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (26, '搜索列表（项目）', 'project', 'SearchProjects', 16, '5.16.26.', 2, '/list/search/project', '', 0, 1, 0, 1, '2020-12-24 16:03:23', '2020-12-24 16:03:23', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (27, '搜索列表（应用）', 'application', 'SearchApplications', 16, '5.16.27.', 2, '/list/search/application', '', 0, 1, 0, 1, '2020-12-24 16:03:23', '2020-12-24 16:03:23', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (28, '基本设置', 'BasicSettings', 'BasicSettings', 25, '2.25.28.', 3, '/account/settings/basic', '', 0, 2, 0, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (29, '安全设置', 'SecuritySettings', 'SecuritySettings', 25, '2.25.29.', 3, '/account/settings/security', '', 0, 2, 0, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (30, '个性化设置', 'CustomSettings', 'CustomSettings', 25, '2.25.30.', 3, '/account/settings/custom', '', 0, 2, 0, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (32, '新消息通知', 'NotificationSettings', 'NotificationSettings', 25, '2.25.32.', 3, '/account/settings/notification', '', 0, 2, 0, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (34, '搜索列表（文章）', 'article', 'SearchArticles', 16, '5.16.27.', 3, '/list/search/article', '', 0, 1, 0, 1, '2020-12-24 23:55:30', '2020-12-24 23:55:30', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (35, '其他组件', 'other', 'PageView', 0, '35.', 1, '', 'slack', 0, 1, 800, 1, '2020-12-25 17:23:07', '2020-12-25 17:23:07', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (36, 'IconSelector', 'TestIconSelect', 'EditList', 35, '35.36.', 2, '/other/icon-selector', 'tool', 0, 1, 810, 1, '2020-12-25 17:23:15', '2020-12-25 17:23:15', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (37, '业务布局', 'bizLayout', 'RouteView', 35, '35.37.', 2, '', 'layout', 0, 1, 820, 1, '2020-12-25 17:23:20', '2020-12-25 17:23:20', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (38, '树目录表格', 'TreeList', 'TreeList', 37, '35.37.38.', 3, '/other/list/tree-list', '', 0, 1, 821, 1, '2020-12-25 17:23:24', '2020-12-25 17:23:24', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (39, '内联编辑表格', 'EditList', 'EditList', 37, '35.37.39.', 3, '/other/list/edit-table', '', 0, 1, 822, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (40, '权限列表', 'PermissionList', 'PermissionList', 37, '35.37.40.', 3, '/other/list/system-permission', '', 0, 1, 823, 1, '2020-12-25 17:23:25', '2021-01-04 22:54:33', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (42, '角色列表', 'RoleList', 'RoleList', 37, '35.37.42.', 3, '/other/list/role-list', '', 0, 1, 825, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (43, '角色列表2', 'SystemRole', 'SystemRole', 37, '35.37.43.', 3, '/other/list/system-role', '', 0, 1, 826, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (44, '权限管理', 'permission', 'RouteView', 0, '44.', 1, '/permission', 'slack', 0, 1, 900, 1, '2020-12-25 17:41:40', '2021-01-02 22:57:31', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (45, '路由管理', 'permission:route', 'PermissionRoute', 44, '44.45.', 2, '/permission/route', '', 0, 1, 910, 1, '2020-12-25 17:41:45', '2021-01-03 16:18:16', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (57, '表单页', 'form', 'RouteView', 0, '57.', 1, '', 'form', 0, 1, 0, 1, '2020-12-29 17:17:56', '2021-01-03 16:29:31', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (58, '高级表单', 'advanced-form', 'AdvanceForm', 57, '57.58.', 2, '/form/advanced-form', '', 0, 1, 0, 1, '2020-12-29 17:19:17', '2020-12-29 17:19:17', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (59, '分步表单', 'step-form', 'StepForm', 57, '57.59.', 2, '/form/step-form', '', 0, 1, 0, 1, '2020-12-29 17:20:20', '2020-12-29 17:20:20', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (60, '基础表单', 'basic-form', 'BasicForm', 57, '57.60.', 2, '/form/base-form', '', 0, 1, 0, 1, '2020-12-29 17:21:08', '2020-12-29 17:21:08', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (70, '测试子路由', '3213', '', 69, '6.70.', 2, '', '', 0, 1, 0, 1, '2020-12-30 17:00:33', '2020-12-30 17:00:44', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (71, '用户管理', 'permission:user', 'PermissionUser', 44, '44.71.', 2, '/permission/user', '', 0, 1, 0, 1, '2021-01-02 22:57:49', '2021-01-02 22:57:49', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (72, '用户组管理', 'permission:usergroup', 'PermissionUserGroup', 44, '44.72.', 2, '/permission/usergroup', '', 0, 1, 0, 1, '2021-01-04 22:44:21', '2021-01-04 22:44:21', -1, -1);
INSERT INTO kt.upms_route (id, name, code, component, pid, level_path, level, path, icon, hide_children, type, sequence, status, gmt_create, gmt_modified, creator, modifier) VALUES (73, '账号绑定', 'BindingSettings', 'BindingSettings', 25, '2.25.73.', 3, '/account/settings/binding', '', 0, 1, 0, 1, '2021-01-04 22:57:11', '2021-01-04 23:13:44', -1, -1);

truncate table upms_permission;
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (1, 'FR00001', 'FRONT_ROUTE', 1, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (2, 'FR00002', 'FRONT_ROUTE', 2, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (3, 'FR00003', 'FRONT_ROUTE', 3, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (4, 'FR00004', 'FRONT_ROUTE', 4, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (5, 'FR00005', 'FRONT_ROUTE', 5, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (6, 'FR00006', 'FRONT_ROUTE', 6, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (7, 'FR00007', 'FRONT_ROUTE', 7, 1, '2020-12-24 15:49:19', '2020-12-24 15:49:19', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (8, 'FR00008', 'FRONT_ROUTE', 8, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (9, 'FR00009', 'FRONT_ROUTE', 9, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (10, 'FR00010', 'FRONT_ROUTE', 10, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (11, 'FR00011', 'FRONT_ROUTE', 11, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (12, 'FR00012', 'FRONT_ROUTE', 12, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (13, 'FR00013', 'FRONT_ROUTE', 13, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (14, 'FR00014', 'FRONT_ROUTE', 14, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (15, 'FR00015', 'FRONT_ROUTE', 15, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (16, 'FR00016', 'FRONT_ROUTE', 16, 1, '2020-12-24 15:58:43', '2020-12-24 15:58:43', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (17, 'FR00017', 'FRONT_ROUTE', 17, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (18, 'FR00018', 'FRONT_ROUTE', 18, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (19, 'FR00019', 'FRONT_ROUTE', 19, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (20, 'FR00020', 'FRONT_ROUTE', 20, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (21, 'FR00021', 'FRONT_ROUTE', 21, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (22, 'FR00022', 'FRONT_ROUTE', 22, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (23, 'FR00023', 'FRONT_ROUTE', 23, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (24, 'FR00024', 'FRONT_ROUTE', 24, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (25, 'FR00025', 'FRONT_ROUTE', 25, 1, '2020-12-24 16:02:53', '2020-12-24 16:02:53', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (26, 'FR00026', 'FRONT_ROUTE', 26, 1, '2020-12-24 16:03:23', '2020-12-24 16:03:23', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (27, 'FR00027', 'FRONT_ROUTE', 27, 1, '2020-12-24 16:03:23', '2020-12-24 16:03:23', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (28, 'FR00028', 'FRONT_ROUTE', 28, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (29, 'FR00029', 'FRONT_ROUTE', 29, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (30, 'FR00030', 'FRONT_ROUTE', 30, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (31, 'FR00031', 'FRONT_ROUTE', 31, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (32, 'FR00032', 'FRONT_ROUTE', 32, 1, '2020-12-24 16:13:50', '2020-12-24 16:13:50', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (33, 'FR00033', 'FRONT_ROUTE', 33, 1, '2020-12-24 18:28:38', '2020-12-24 18:28:38', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (34, 'FR00035', 'FRONT_ROUTE', 35, 1, '2020-12-25 17:23:07', '2020-12-25 17:23:07', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (35, 'FR00036', 'FRONT_ROUTE', 36, 1, '2020-12-25 17:23:15', '2020-12-25 17:23:15', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (36, 'FR00037', 'FRONT_ROUTE', 37, 1, '2020-12-25 17:23:20', '2020-12-25 17:23:20', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (37, 'FR00038', 'FRONT_ROUTE', 38, 1, '2020-12-25 17:23:24', '2020-12-25 17:23:24', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (38, 'FR00039', 'FRONT_ROUTE', 39, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (39, 'FR00040', 'FRONT_ROUTE', 40, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (40, 'FR00041', 'FRONT_ROUTE', 41, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (41, 'FR00042', 'FRONT_ROUTE', 42, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (42, 'FR00043', 'FRONT_ROUTE', 43, 1, '2020-12-25 17:23:25', '2020-12-25 17:23:25', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (43, 'FR00044', 'FRONT_ROUTE', 44, 1, '2020-12-25 17:41:40', '2020-12-25 17:41:40', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (44, 'FR00045', 'FRONT_ROUTE', 45, 1, '2020-12-25 17:41:45', '2020-12-25 17:41:45', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (45, 'FR00046', 'FRONT_ROUTE', 46, 1, '2020-12-29 14:52:49', '2020-12-29 14:52:49', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (46, 'FR00047', 'FRONT_ROUTE', 47, 1, '2020-12-29 15:51:28', '2020-12-29 15:51:28', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (47, 'FR00048', 'FRONT_ROUTE', 48, 1, '2020-12-29 15:52:58', '2020-12-29 15:52:58', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (48, 'FR00049', 'FRONT_ROUTE', 49, 1, '2020-12-29 16:34:36', '2020-12-29 16:34:36', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (49, 'FR00050', 'FRONT_ROUTE', 50, 1, '2020-12-29 16:58:00', '2020-12-29 16:58:00', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (50, 'FR00051', 'FRONT_ROUTE', 51, 1, '2020-12-29 16:58:45', '2020-12-29 16:58:45', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (51, 'FR00052', 'FRONT_ROUTE', 52, 1, '2020-12-29 17:01:27', '2020-12-29 17:01:27', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (52, 'FR00053', 'FRONT_ROUTE', 53, 1, '2020-12-29 17:01:31', '2020-12-29 17:01:31', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (53, 'FR00054', 'FRONT_ROUTE', 54, 1, '2020-12-29 17:05:29', '2020-12-29 17:05:29', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (54, 'FR00055', 'FRONT_ROUTE', 55, 1, '2020-12-29 17:05:41', '2020-12-29 17:05:41', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (55, 'FR00056', 'FRONT_ROUTE', 56, 1, '2020-12-29 17:05:50', '2020-12-29 17:05:50', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (56, 'FR00057', 'FRONT_ROUTE', 57, 1, '2020-12-29 17:17:56', '2020-12-29 17:17:56', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (57, 'FR00058', 'FRONT_ROUTE', 58, 1, '2020-12-29 17:19:17', '2020-12-29 17:19:17', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (58, 'FR00059', 'FRONT_ROUTE', 59, 1, '2020-12-29 17:20:20', '2020-12-29 17:20:20', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (59, 'FR00060', 'FRONT_ROUTE', 60, 1, '2020-12-29 17:21:08', '2020-12-29 17:21:08', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (60, 'FR00061', 'FRONT_ROUTE', 61, 1, '2020-12-29 17:36:25', '2020-12-29 17:36:25', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (61, 'FR00062', 'FRONT_ROUTE', 62, 1, '2020-12-29 17:36:40', '2020-12-29 17:36:40', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (62, 'FR00063', 'FRONT_ROUTE', 63, 1, '2020-12-29 17:36:49', '2020-12-29 17:36:49', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (63, 'FR00064', 'FRONT_ROUTE', 64, 1, '2020-12-29 18:11:17', '2020-12-29 18:11:17', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (64, 'FR00065', 'FRONT_ROUTE', 65, 1, '2020-12-29 18:11:57', '2020-12-29 18:11:57', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (65, 'FR00066', 'FRONT_ROUTE', 66, 1, '2020-12-29 18:30:10', '2020-12-29 18:30:10', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (66, 'FR00067', 'FRONT_ROUTE', 67, 1, '2020-12-30 16:37:49', '2020-12-30 16:37:49', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (67, 'FR00068', 'FRONT_ROUTE', 68, 1, '2020-12-30 16:40:51', '2020-12-30 16:40:51', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (68, 'FR00069', 'FRONT_ROUTE', 69, 1, '2020-12-30 17:00:20', '2020-12-30 17:00:20', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (69, 'FR00070', 'FRONT_ROUTE', 70, 1, '2020-12-30 17:00:33', '2020-12-30 17:00:33', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (70, 'FR00071', 'FRONT_ROUTE', 71, 1, '2021-01-02 22:57:49', '2021-01-02 22:57:49', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (71, 'FR00072', 'FRONT_ROUTE', 72, 1, '2021-01-04 22:44:21', '2021-01-04 22:44:21', -1, -1);
INSERT INTO kt.upms_permission (id, code, type, resource_id, status, gmt_create, gmt_modified, creator, modifier) VALUES (72, 'FR00073', 'FRONT_ROUTE', 73, 1, '2021-01-04 22:57:11', '2021-01-04 22:57:11', -1, -1);