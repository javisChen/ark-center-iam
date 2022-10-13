package com.ark.center.iam.api.access.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class ApiAccessResponse {

    private UserResponse userResponse;

    public static ApiAccessResponse success() {
        return ApiAccessResponse.builder()
                .build();
    }

    public static ApiAccessResponse success(UserResponse userResponse) {
        return ApiAccessResponse.builder()
                .userResponse(userResponse)
                .build();
    }

}
