//package com.ark.center.iam.application.usergroup.executor;
//
//import cn.hutool.core.util.StrUtil;
//import com.ark.center.iam.model.usergroup.command.UserGroupCmd;
//import com.ark.center.iam.domain.usergroup.UserGroup;
//import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
//import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
//import com.ark.center.iam.domain.usergroup.service.UserGroupCheckService;
//import com.ark.center.iam.infra.usergroup.converter.UserGroupDomainConverter;
//import com.ark.component.exception.ExceptionFactory;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Component;
//
//import java.util.List;
//
//public class UserGroupCreateCmdExe {
//
//    private final UserGroupDomainConverter userGroupDomainConverter;
//    private final UserGroupRepository userGroupRepository;
//    private final UserGroupCheckService userGroupCheckService;
//    private final UserGroupAssignService userGroupAssignService;
//
//    public void execute(UserGroupCmd cmd) {
//
//        userGroupCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());
//
//        UserGroup userGroup = userGroupDomainConverter.convertToDO(cmd);
//
//        UserGroup parentRoute = null;
//        if (userGroup.isFirstLevel()) {
//            userGroup.setLevel(UserGroup.FIRST_LEVEL);
//        } else {
//            parentRoute = userGroupRepository.selectById(userGroup.getPid());
//            if (parentRoute == null) {
//                throw ExceptionFactory.userException("父级用户组不存在");
//            }
//            userGroup.setLevel(parentRoute.getLevel() + 1);
//        }
//        userGroupRepository.insert(userGroup);
//
//        // 新增完路由记录后再更新层级信息
//        updateLevelPath(userGroup, parentRoute);
//
//        assignRoleUserGroup(userGroup.getId(), cmd.getRoleIds());
//    }
//
//    private void updateLevelPath(UserGroup userGroup, UserGroup parentRoute) {
//        Long userGroupId = userGroup.getId();
//        String levelPath = userGroup.isFirstLevel()
//                ? userGroupId + StrUtil.DOT
//                : parentRoute.getLevelPath() + userGroupId + StrUtil.DOT;
//        UserGroup entity = new UserGroup();
//        entity.setId(userGroupId);
//        entity.setLevelPath(levelPath);
//        userGroupRepository.updateByUserGroupId(entity);
//    }
//
//
//    private void assignRoleUserGroup(Long userGroupId, List<Long> roleIds) {
//        userGroupAssignService.assignUserGroupsToRoles(userGroupId, roleIds);
//    }
//
//}
