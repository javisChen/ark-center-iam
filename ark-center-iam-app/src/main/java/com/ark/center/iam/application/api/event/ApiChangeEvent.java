package com.ark.center.iam.application.api.event;

import com.ark.center.iam.client.api.enums.ApiChangeType;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

@Getter
public class ApiChangeEvent extends ApplicationEvent {
    
    private final ApiChangeType changeType;
    private final Long apiId;
    
    public ApiChangeEvent(Object source, ApiChangeType changeType, Long apiId) {
        super(source);
        this.changeType = changeType;
        this.apiId = apiId;
    }
} 