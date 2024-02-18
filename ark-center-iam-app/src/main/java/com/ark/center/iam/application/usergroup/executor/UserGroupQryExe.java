package com.ark.center.iam.application.usergroup.executor;

import com.ark.center.iam.infra.usergroup.converter.UserGroupAppConverter;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDAO;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDO;
import com.ark.center.iam.model.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.model.usergroup.query.UserGroupQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGroupQryExe {

    private final UserGroupDAO userGroupDAO;
    private final UserGroupAppConverter userGroupAppConverter;
    public Page<UserGroupListTreeDTO> execute(UserGroupQuery query) {
        query.setPid(0L);
        Page<UserGroupDO> page = userGroupDAO.selectPages(query);
        List<UserGroupDO> records = page.getRecords();
        if (CollectionUtils.isEmpty(records)) {
            return new Page<>(page.getCurrent(), page.getSize(), page.getTotal());
        }
        List<UserGroupDO> childGroups = userGroupDAO.selectChildGroups();
        List<UserGroupListTreeDTO> vos = mergeGroups(records, childGroups);
        Page<UserGroupListTreeDTO> pageVo = new Page<>(page.getCurrent(), page.getSize(), page.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }

    private List<UserGroupListTreeDTO> mergeGroups(List<UserGroupDO> rootUserGroups, List<UserGroupDO> childUserGroups) {
        List<UserGroupListTreeDTO> dtoList = new ArrayList<>();
        for (UserGroupDO rootGroup : rootUserGroups) {
            UserGroupListTreeDTO dto = userGroupAppConverter.toUserGroupListTreeDTO(rootGroup);
            findChildren(dto, childUserGroups);
            dtoList.add(dto);
        }
        return dtoList;
    }

    private void findChildren(UserGroupListTreeDTO parent, List<UserGroupDO> list) {
        for (UserGroupDO group : list) {
            if (parent.getId().equals(group.getPid())) {
                UserGroupListTreeDTO current = userGroupAppConverter.toUserGroupListTreeDTO(group);
                parent.getChildren().add(current);
                findChildren(current, list);
            }
        }
    }
}
