package com.ark.center.iam.client.usergroup.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGroupListHierarchyDTO extends UserGroupBaseDTO  {

    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private List<UserGroupListHierarchyDTO> children;
    private List<String> roles;

}
