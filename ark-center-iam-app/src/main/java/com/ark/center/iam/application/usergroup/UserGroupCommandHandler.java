package com.ark.center.iam.application.usergroup;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
import com.ark.center.iam.domain.usergroup.service.UserGroupDomainService;
import com.ark.center.iam.domain.usergroup.service.UserGroupFactory;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.domain.usergroup.vo.UserGroupType;
import com.ark.center.iam.model.usergroup.command.UserGroupCreateCommand;
import com.ark.center.iam.model.usergroup.command.UserGroupUpdateCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserGroupCommandHandler {

    private final UserGroupRepository userGroupRepository;
    private final UserGroupFactory userGroupFactory;
    private final UserGroupDomainService userGroupDomainService;

    @Transactional(rollbackFor = Throwable.class)
    public void createUserGroup(UserGroupCreateCommand command) {

        UserGroup parent = queryParent(command.getPid());

        UserGroup userGroup = userGroupFactory.create(command.getName(),
                InheritType.from(command.getInheritType()),
                UserGroupType.from(command.getType()),
                command.getRoleIds(), parent);

        userGroupRepository.saveAndPublishEvents(userGroup);
    }

    private UserGroup queryParent(Long pid) {
        return pid != null && pid > 0 ? userGroupRepository.byIdOrThrowError(pid, "上级用户组不存在") : null;
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateUserGroup(UserGroupUpdateCommand command) {

        UserGroup parent = queryParent(command.getPid());

        UserGroup userGroup = userGroupRepository.byIdOrThrowError(command.getId(), "用户组不存在");

        userGroupDomainService.update(userGroup, command.getName(),
                InheritType.from(command.getInheritType()),
                UserGroupType.from(command.getType()),
                command.getRoleIds(), parent);

        userGroupRepository.saveAndPublishEvents(userGroup);
    }

    public void delete(Long id) {

        UserGroup userGroup = userGroupRepository.byIdOrThrowError(id, "用户组不存在");

        userGroupRepository.deleteAndPublishEvents(userGroup);
    }
}
