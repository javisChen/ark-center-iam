package com.ark.center.iam.application.usergroup;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.usergroup.executor.UserGroupQryExe;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.center.iam.infra.usergroup.UserGroup;

import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupBizTreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserGroupQueryService {

    private final UserGroupService userGroupService;
    private final UserGroupQryExe userGroupQryExe;
    private final UserGroupBizTreeService userGroupHierarchyService;
    private final UserGroupAssembler userGroupAssembler;

    public List<Tree<Long>> queryGroups(UserGroupQry qry) {
        return userGroupQryExe.execute(qry);
    }

    public List<UserGroupBaseDTO> queryListAll() {
        List<UserGroupBaseDTO> userGroupBaseDTOS = userGroupService.selectList();
        userGroupHierarchyService.populateNodeParams(userGroupBaseDTOS);
        return userGroupBaseDTOS;
    }

    public UserGroupDetailDTO queryDetails(Long id) {
        UserGroup userGroup = userGroupService.selectById(id);
        UserGroupDetailDTO userGroupDetailsDTO = userGroupAssembler.toUserGroupDetailsDTO(userGroup);
        userGroupHierarchyService.populateNodeParams(userGroupDetailsDTO);
        return userGroupDetailsDTO;
    }

    public List<Tree<Long>> queryTree(UserGroupQry qry) {
        List<UserGroupBaseDTO> list = userGroupService.selectList();
        return userGroupHierarchyService.transformToTree(list);


    }

}
