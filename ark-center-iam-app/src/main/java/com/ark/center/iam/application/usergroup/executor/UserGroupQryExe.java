package com.ark.center.iam.application.usergroup.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.gateway.UserGroupGateway;
import com.ark.center.iam.infra.user.assembler.UserAssembler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupQryExe {

    private final UserGroupGateway userGroupGateway;
    private final UserAssembler userAssembler;
    public Page<UserGroupListTreeDTO> execute(UserGroupQry qry) {
        qry.setPid(0L);
        Page<UserGroup> pageResult = userGroupGateway.selectPages(qry);
        List<UserGroup> levelOneUserGroups = pageResult.getRecords();
        List<UserGroup> anotherUserGroups = userGroupGateway.selectListWithoutRoot();
        List<UserGroupListTreeDTO> vos = recursionUserGroups(levelOneUserGroups, anotherUserGroups);
        Page<UserGroupListTreeDTO> pageVo = new Page<>(pageResult.getCurrent(), pageResult.getSize(), pageResult.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }

    private List<UserGroupListTreeDTO> recursionUserGroups(List<UserGroup> levelOneUserGroups, List<UserGroup> anotherUserGroups) {
        List<UserGroupListTreeDTO> vos = CollectionUtil.newArrayList();
        for (UserGroup item : levelOneUserGroups) {
            UserGroupListTreeDTO dto = userAssembler.toUserGroupListTreeDTO(item);
            findChildren(dto, anotherUserGroups);
            vos.add(dto);
        }
        return vos;
    }

    private void findChildren(UserGroupListTreeDTO parent, List<UserGroup> list) {
        for (UserGroup route : list) {
            if (parent.getId().equals(route.getPid())) {
                UserGroupListTreeDTO item = userAssembler.toUserGroupListTreeDTO(route);
                parent.getChildren().add(item);
                findChildren(item, list);
            }
        }
    }
}
