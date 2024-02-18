package com.ark.center.iam.domain.usergroup.service;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.domain.usergroup.vo.UserGroupType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserGroupDomainService {

    private final UserGroupChecker userGroupChecker;

    public void update(UserGroup userGroup,
                       String name,
                       InheritType inheritType,
                       UserGroupType type,
                       List<Long> roleIds,
                       UserGroup parent) {

        Long userGroupId = userGroup.getId();

        userGroupChecker.ensureNameNotExists(userGroupId, name);

        userGroup.update(name, inheritType, type, roleIds, parent);
    }
}
