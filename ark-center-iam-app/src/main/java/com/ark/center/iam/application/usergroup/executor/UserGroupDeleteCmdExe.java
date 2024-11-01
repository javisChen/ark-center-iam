package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.infra.usergroup.UserGroup;

import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupTreeService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupDeleteCmdExe {

    private final UserGroupService userGroupService;
    private final UserGroupTreeService userGroupTreeService;

    public void execute(Long id) {
        UserGroup userGroup = userGroupService.selectById(id);

        List<Long> removed = userGroupTreeService.removeNodeAndChildren(userGroup.getId());
        if (CollectionUtils.isEmpty(removed)) {
            return;
        }
        userGroupService.deleteByIds(removed);
    }
}
