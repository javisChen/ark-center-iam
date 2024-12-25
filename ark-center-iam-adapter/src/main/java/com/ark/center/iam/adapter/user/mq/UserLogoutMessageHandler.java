package com.ark.center.iam.adapter.user.mq;

import com.alibaba.fastjson.JSON;
import com.ark.center.auth.client.mq.AuthConst;
import com.ark.center.auth.client.mq.logout.UserLogoutMQConst;
import com.ark.center.auth.client.mq.logout.UserLogoutMessage;
import com.ark.center.iam.application.user.UserCommandHandler;
import com.ark.component.mq.MQType;
import com.ark.component.mq.core.annotations.MQMessageListener;
import com.ark.component.mq.core.processor.SimpleMessageHandler;
import com.ark.component.mq.core.support.ConsumeMode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@MQMessageListener(
        mq = MQType.ROCKET,
        consumeMode = ConsumeMode.CLUSTERING,
        topic = AuthConst.TOPIC_AUTH,
        tags = UserLogoutMQConst.USER_LOGOUT_EVENT_TAG,
        consumerGroup = "user_logout_cg"
)
@Component
@Slf4j
@RequiredArgsConstructor
public class UserLogoutMessageHandler extends SimpleMessageHandler<UserLogoutMessage> {

    private final UserCommandHandler userCommandHandler;

    @Override
    protected void handleMessage(String msgId, String sendId, UserLogoutMessage body, Object o) {
        log.info("Received a user logout, msgId = {}, body = {}", msgId, JSON.toJSONString(body));
        userCommandHandler.emptyCache(body.getUserId());
    }
}
