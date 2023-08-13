package com.ark.center.iam.application.role.event;

import com.ark.component.cache.CacheService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.ApplicationListener;

/**
 * 角色API权限变更事件监听器
 * @author JC
 */
@Slf4j
@RequiredArgsConstructor
public class RolePermissionEventListener implements ApplicationListener<RolePermissionChangedEvent> {

    private final CacheService cacheService;


    @Override
    public void onApplicationEvent(@NotNull RolePermissionChangedEvent event) {
        log.info("角色权限发生变更：Event = {}, ", event);
        // 写入或更新缓存


        // 推送变更MQ消息
    }
}
