package com.ark.center.iam.application.usergroup.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.center.iam.infra.usergroup.UserGroup;

import com.ark.center.iam.infra.user.assembler.UserAssembler;
import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import com.ark.center.iam.infra.usergroup.service.UserGroupTreeService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupQryExe {

    private final UserGroupService userGroupGateway;
    private final UserAssembler userAssembler;
    private final UserGroupTreeService userGroupTreeService;
    public List<Tree<Long>> execute(UserGroupQry qry) {
        qry.setParentId(0L);
        List<UserGroup> userGroups = userGroupGateway.selectPages(qry);
        List<UserGroupListTreeDTO> trees = userGroups.stream().map(userAssembler::toUserGroupListTreeDTO).toList();
        return userGroupTreeService.transformToTree(trees);
//        List<UserGroup> levelOneUserGroups = userGroups.getRecords();
//        List<UserGroup> anotherUserGroups = userGroupGateway.selectListWithoutRoot();
//        List<UserGroupListTreeDTO> vos = recursionUserGroups(levelOneUserGroups, anotherUserGroups);
//        Page<UserGroupListTreeDTO> pageVo = new Page<>(userGroups.getCurrent(), userGroups.getSize(), userGroups.getTotal());
//        pageVo.setRecords(vos);
//        return pageVo;
    }
//
//    private List<UserGroupListTreeDTO> recursionUserGroups(List<UserGroup> levelOneUserGroups, List<UserGroup> anotherUserGroups) {
//        List<UserGroupListTreeDTO> vos = CollectionUtil.newArrayList();
//        for (UserGroup item : levelOneUserGroups) {
//            UserGroupListTreeDTO dto = userAssembler.toUserGroupListTreeDTO(item);
//            findChildren(dto, anotherUserGroups);
//            vos.add(dto);
//        }
//        return vos;
//    }
//
//    private void findChildren(UserGroupListTreeDTO parent, List<UserGroup> list) {
//        for (UserGroup route : list) {
//            if (parent.getId().equals(route.getPid())) {
//                UserGroupListTreeDTO item = userAssembler.toUserGroupListTreeDTO(route);
//                parent.getChildren().add(item);
//                findChildren(item, list);
//            }
//        }
//    }
}
