package com.ark.center.iam.application.api.event;

import com.ark.center.iam.client.api.dto.ApiChangedDTO;
import com.ark.center.iam.client.contants.IamMQConst;
import com.ark.component.mq.MsgBody;
import com.ark.component.mq.integration.MessageTemplate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * 角色API权限变更事件监听器
 * @author JC
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class ApiEventListener {

    private final MessageTemplate messageTemplate;

    @EventListener
    public void onApplicationEvent(@NotNull ApiCreatedEvent event) {
        publishMQ(IamMQConst.EVENT_CREATED);
    }
    @EventListener
    public void onApplicationEvent(@NotNull ApiChangedEvent event) {
        publishMQ(IamMQConst.EVENT_CHANGED);
    }
    @EventListener
    public void onApplicationEvent(@NotNull ApiDeletedEvent event) {
        publishMQ(IamMQConst.EVENT_DELETED);
    }

    private void publishMQ(String event) {
        ApiChangedDTO dto = new ApiChangedDTO();
        dto.setEvent(event);
        messageTemplate.asyncSend(IamMQConst.TOPIC_IAM, IamMQConst.TAG_API_CHANGED, MsgBody.of(dto));
        log.info("Api变更消息已发送");
    }

}
