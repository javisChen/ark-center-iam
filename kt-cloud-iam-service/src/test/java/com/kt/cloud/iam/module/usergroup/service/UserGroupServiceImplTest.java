package com.kt.cloud.iam.module.usergroup.service;

import com.kt.cloud.iam.enums.UserGroupInheritTypeEnums;
import com.kt.cloud.iam.dao.entity.IamUserGroup;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class UserGroupServiceImplTest {

    private UserGroupServiceImpl userGroupService = new UserGroupServiceImpl();

    @Test
    public void filterUserGroupParentIds() {
        List<IamUserGroup> userGroups = new ArrayList<>();
        IamUserGroup iamUserGroupA = new IamUserGroup();
        iamUserGroupA.setId(1L);
        iamUserGroupA.setPid(0L);
        iamUserGroupA.setInheritType(UserGroupInheritTypeEnums.INHERIT_PARENT.getValue());
        iamUserGroupA.setLevel(1);
        iamUserGroupA.setLevelPath("1.");
        IamUserGroup iamUserGroupB = new IamUserGroup();
        iamUserGroupB.setId(2L);
        iamUserGroupB.setPid(1L);
        iamUserGroupB.setInheritType(UserGroupInheritTypeEnums.NO_INHERIT.getValue());
        iamUserGroupB.setLevel(2);
        iamUserGroupB.setLevelPath("1.2.4.6");
        IamUserGroup iamUserGroupC = new IamUserGroup();
        iamUserGroupC.setId(3L);
        iamUserGroupC.setPid(2L);
        iamUserGroupC.setInheritType(UserGroupInheritTypeEnums.INHERIT_ALL.getValue());
        iamUserGroupC.setLevel(3);
        iamUserGroupC.setLevelPath("1.2.3.");
        userGroups.add(iamUserGroupA);
        userGroups.add(iamUserGroupB);
        userGroups.add(iamUserGroupC);
        Set<Long> longs = userGroupService.filterUserGroupParentIds(userGroups);
        System.out.println(longs);

    }
}