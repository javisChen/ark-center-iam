package com.ark.center.iam.application.usergroup;

import com.ark.center.iam.application.usergroup.executor.UserGroupDeleteCmdExe;
import com.ark.center.iam.application.usergroup.executor.UserGroupQryExe;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupTreeDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.gateway.UserGroupGateway;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserGroupQueryService {

    private final UserGroupGateway userGroupGateway;
    private final UserGroupQryExe userGroupQryExe;
    private final UserGroupDeleteCmdExe userGroupDeleteCmdExe;
    private final UserGroupAssembler userGroupAssembler;

    public Page<UserGroupListTreeDTO> queryGroups(UserGroupQry qry) {
        return userGroupQryExe.execute(qry);
    }

    public List<UserGroupBaseDTO> queryListAll() {
        return userGroupGateway.selectList();
    }

    public UserGroupDetailDTO queryDetails(Long id) {
        UserGroup userGroup = userGroupGateway.selectById(id);
        return userGroupAssembler.toUserGroupDetailsDTO(userGroup);
    }

    public List<UserGroupTreeDTO> queryTree(UserGroupQry qry) {
        List<UserGroupBaseDTO> list = userGroupGateway.selectList();
        return list.stream().map(assembleUserGroupUserGroupTreeVO()).collect(Collectors.toList());
    }

    private Function<UserGroupBaseDTO, UserGroupTreeDTO> assembleUserGroupUserGroupTreeVO() {
        return item -> {
            UserGroupTreeDTO userGroupTreeVO = new UserGroupTreeDTO();
            userGroupTreeVO.setTitle(item.getName());
            userGroupTreeVO.setKey(String.valueOf(item.getId()));
            return userGroupTreeVO;
        };
    }

}
