package com.ark.center.iam.domain.usergroup.service;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.domain.usergroup.vo.UserGroupType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserGroupFactory {

    private final UserGroupChecker userGroupChecker;

    public UserGroup create(String name, InheritType inheritType, UserGroupType type, List<Long> roleIds, UserGroup parent) {

        userGroupChecker.ensureNameNotExists(name);

        return new UserGroup(name, inheritType, type, roleIds, parent);
    }

}
