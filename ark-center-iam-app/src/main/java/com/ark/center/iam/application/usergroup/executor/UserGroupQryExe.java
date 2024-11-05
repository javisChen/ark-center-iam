package com.ark.center.iam.application.usergroup.executor;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.client.usergroup.dto.UserGroupListHierarchyDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.center.iam.infra.usergroup.UserGroup;

import com.ark.center.iam.infra.user.assembler.UserAssembler;
import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupBizTreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupQryExe {

    private final UserGroupService userGroupGateway;
    private final UserAssembler userAssembler;
    private final UserGroupBizTreeService userGroupHierarchyService;
    public List<Tree<Long>> execute(UserGroupQry qry) {
//        qry.setParentId(0L);
        List<UserGroup> userGroups = userGroupGateway.selectPages(qry);
        List<UserGroupListHierarchyDTO> trees = userGroups.stream().map(userAssembler::toUserGroupListTreeDTO).toList();
        return userGroupHierarchyService.transformToTree(trees);
    }
}
