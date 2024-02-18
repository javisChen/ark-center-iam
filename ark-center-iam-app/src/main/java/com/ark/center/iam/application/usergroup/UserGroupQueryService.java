package com.ark.center.iam.application.usergroup;

import com.ark.center.iam.application.usergroup.executor.UserGroupQryExe;
import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
import com.ark.center.iam.infra.usergroup.converter.UserGroupAppConverter;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDAO;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDO;
import com.ark.center.iam.model.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupTreeDTO;
import com.ark.center.iam.model.usergroup.query.UserGroupQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserGroupQueryService {

    private final UserGroupRepository userGroupRepository;
    private final UserGroupDAO userGroupDAO;
    private final UserGroupQryExe userGroupQryExe;
    private final UserGroupAppConverter userGroupAppConverter;

    public Page<UserGroupListTreeDTO> queryPage(UserGroupQuery qry) {
        return userGroupQryExe.execute(qry);
    }

    public List<UserGroupBaseDTO> queryAll() {
        List<UserGroupDO> records = userGroupDAO.selectList();
        return userGroupAppConverter.toBaseDTO(records);
    }

    public UserGroupDetailDTO queryDetails(Long id) {
        UserGroup userGroup = userGroupRepository.byId(id);
        return userGroupAppConverter.toUserGroupDetailsDTO(userGroup);
    }

    public List<UserGroupTreeDTO> queryTree(UserGroupQuery query) {
        List<UserGroupDO> list = userGroupDAO.selectList();
        return list.stream()
                .map(assembleUserGroupUserGroupTreeVO())
                .collect(Collectors.toList());
    }

    private Function<UserGroupDO, UserGroupTreeDTO> assembleUserGroupUserGroupTreeVO() {
        return item -> {
            UserGroupTreeDTO userGroupTreeVO = new UserGroupTreeDTO();
            userGroupTreeVO.setTitle(item.getName());
            userGroupTreeVO.setKey(String.valueOf(item.getId()));
            return userGroupTreeVO;
        };
    }

}
