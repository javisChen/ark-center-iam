package com.ark.center.iam.domain.permission;


import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import static lombok.AccessLevel.PRIVATE;

/**
 * <p>
 * 权限表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Getter
@EqualsAndHashCode(callSuper = true)
@Builder
@AllArgsConstructor(access = PRIVATE)
public class ResourcePermission extends AggregateRoot {

    @TableField("application_id")
    private Long applicationId;

    /**
     * 权限类型 FRONT_ROUTE-前端路由；PAGE_ELEMENT-页面元素；FILE-文件；INTERNAL_API-内部服务API；OPEN_API-开放API
     */
    @TableField("type")
    private PermissionType type;

    /**
     * 权限编码
     */
    @TableField("code")
    private String code;

    /**
     * 权限编码
     */
    @TableField("resource_id")
    private Long resourceId;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private EnableDisableStatus status;


    private ResourcePermission(PermissionType type, Long applicationId, Long resourceId) {
        this.applicationId = applicationId;
        this.type = type;
        this.resourceId = resourceId;
        this.code = generatePermissionCode(type.getTag(), resourceId);
        this.status = EnableDisableStatus.ENABLED;
    }

    public static ResourcePermission of(PermissionType type, Long applicationId, Long resourceId) {
        return new ResourcePermission(type, applicationId, resourceId);
    }

    /**
     * 生成权限编码
     * 规则：类型首字母+资源id（十位，不足左补0） EXAMPLE：P0000000001
     */
    private String generatePermissionCode(String tag, long id) {
        return tag + StringUtils.leftPad(String.valueOf(id), 9, "0");
    }
}
