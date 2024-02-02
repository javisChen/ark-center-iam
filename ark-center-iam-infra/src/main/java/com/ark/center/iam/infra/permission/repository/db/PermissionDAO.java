package com.ark.center.iam.infra.permission.repository.db;

import com.ark.center.iam.domain.permission.Permission;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
public class PermissionDAO extends ServiceImpl<PermissionMapper, Permission> {
}
