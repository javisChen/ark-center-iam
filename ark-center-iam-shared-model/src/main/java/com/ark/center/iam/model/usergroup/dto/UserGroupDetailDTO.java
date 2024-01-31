package com.ark.center.iam.model.usergroup.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGroupDetailDTO extends UserGroupBaseDTO  {

    private List<Long> roleIds;

}
