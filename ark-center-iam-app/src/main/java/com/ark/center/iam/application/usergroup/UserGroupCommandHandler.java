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
public class UserGroupCommandHandler {

    private final UserGroupCreateCmdExe userGroupCreateCmdExe;
    private final UserGroupUpdateCmdExe userGroupUpdateCmdExe;
    private final UserGroupDeleteCmdExe userGroupDeleteCmdExe;

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
