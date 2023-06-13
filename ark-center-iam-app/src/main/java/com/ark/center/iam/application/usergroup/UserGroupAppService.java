package com.ark.center.iam.application.usergroup;

import com.ark.center.iam.application.usergroup.executor.UserGroupCreateCmdExe;
import com.ark.center.iam.application.usergroup.executor.UserGroupDeleteCmdExe;
import com.ark.center.iam.application.usergroup.executor.UserGroupQryExe;
import com.ark.center.iam.application.usergroup.executor.UserGroupUpdateCmdExe;
import com.ark.center.iam.client.usergroup.command.UserGroupCmd;
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
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserGroupAppService {

    private final UserGroupGateway userGroupGateway;
    private final UserGroupQryExe userGroupQryExe;
    private final UserGroupCreateCmdExe userGroupCreateCmdExe;
    private final UserGroupUpdateCmdExe userGroupUpdateCmdExe;
    private final UserGroupDeleteCmdExe userGroupDeleteCmdExe;
    private final UserGroupAssembler userGroupAssembler;

    public Page<UserGroupListTreeDTO> queryPage(UserGroupQry qry) {
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

    @Transactional(rollbackFor = Throwable.class)
    public void createUserGroup(UserGroupCmd userGroupUpdateDTO) {
        userGroupCreateCmdExe.execute(userGroupUpdateDTO);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateUserGroup(UserGroupCmd cmd) {
        userGroupUpdateCmdExe.execute(cmd);
    }

    public void removeUserGroup(Long id) {
        userGroupDeleteCmdExe.execute(id);
    }
}
