package com.ark.center.iam.application.api.event;

import com.ark.center.iam.client.api.event.ApiChangeEventDTO;
import com.ark.center.iam.client.contants.IamMQConst;
import com.ark.component.mq.MsgBody;
import com.ark.component.mq.integration.MessageTemplate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
    public void onApiChange(ApiChangeEvent event) {
        ApiChangeEventDTO eventDTO = new ApiChangeEventDTO();
        eventDTO.setApiId(event.getApiId());
        eventDTO.setChangeType(event.getChangeType());
        
        messageTemplate.asyncSend(
            IamMQConst.TOPIC_IAM, 
            IamMQConst.TAG_API_CHANGED, 
            MsgBody.of(eventDTO)
        );
        
        log.info("API变更事件已发送 - apiId: {}, changeType: {}", event.getApiId(), event.getChangeType());
    }
}
