package com.ark.center.iam.adapter.user.mq;

import com.alibaba.fastjson.JSON;
import com.ark.center.auth.client.mq.AuthMQConst;
import com.ark.center.auth.client.mq.logout.UserLogoutMQConst;
import com.ark.center.auth.client.mq.logout.UserLogoutMessage;
import com.ark.component.mq.MQType;
import com.ark.component.mq.core.annotations.MQMessageListener;
import com.ark.component.mq.core.processor.SimpleMessageHandler;
import com.ark.component.mq.core.support.ConsumeMode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@MQMessageListener(
        mq = MQType.ROCKET,
        consumeMode = ConsumeMode.CLUSTERING,
        topic = AuthMQConst.AUTH_TOPIC,
        tags = UserLogoutMQConst.USER_LOGOUT_EVENT_TAG,
        consumerGroup = "user_logout_cg"
)
@Component
@Slf4j
public class UserLogoutMessageHandler extends SimpleMessageHandler<UserLogoutMessage> {
    @Override
    protected void handleMessage(String msgId, String sendId, UserLogoutMessage body, Object o) {
        log.info("Received a user logout, msgId = {}, body = {}", msgId, JSON.toJSONString(body));
    }
}
