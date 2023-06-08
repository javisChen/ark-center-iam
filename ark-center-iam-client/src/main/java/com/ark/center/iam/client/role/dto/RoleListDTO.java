package com.ark.center.iam.client.role.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@EqualsAndHashCode(callSuper = true)
@Data
public class RoleListDTO extends RoleBaseDTO {

    private LocalDateTime createTime;
    private LocalDateTime updateTime;

}
