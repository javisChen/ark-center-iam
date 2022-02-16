package com.kt.cloud.iam.data.usergroup.converter;

import com.kt.cloud.iam.data.role.service.IRoleService;
import com.kt.cloud.iam.data.usergroup.dto.UserGroupUpdateDTO;
import com.kt.cloud.iam.dao.entity.IamUserGroup;
import com.kt.cloud.iam.data.usergroup.vo.UserGroupDetailVO;
import com.kt.cloud.iam.data.usergroup.vo.UserGroupListTreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class UserGroupBeanConverter {

    @Autowired
    private IRoleService iRoleService;

    public UserGroupListTreeVO convertToUserGroupListTreeVO(IamUserGroup item) {
        UserGroupListTreeVO vo = new UserGroupListTreeVO();
        vo.setId(item.getId());
        vo.setPid(item.getPid());
        vo.setName(item.getName());
        vo.setStatus(item.getStatus());
        vo.setCreateTime(item.getGmtCreate());
        vo.setUpdateTime(item.getGmtModified());
        vo.setInheritType(item.getInheritType());
        vo.setType(item.getType());
        vo.setChildren(new ArrayList<>());
        vo.setRoles(iRoleService.getRoleNamesByUserGroupId(item.getId()));
        return vo;
    }

    public IamUserGroup convertToDO(UserGroupUpdateDTO dto) {
        IamUserGroup iamUserGroup = new IamUserGroup();
        iamUserGroup.setId(dto.getId());
        iamUserGroup.setName(dto.getName());
        iamUserGroup.setPid(dto.getPid());
        iamUserGroup.setInheritType(dto.getInheritType());
        iamUserGroup.setType(dto.getType());
        iamUserGroup.setPid(dto.getPid());
        return iamUserGroup;
    }

    public UserGroupDetailVO convertToUserGroupDetailVO(IamUserGroup userGroup) {
        UserGroupDetailVO vo = new UserGroupDetailVO();
        vo.setId(userGroup.getId());
        vo.setPid(userGroup.getPid());
        vo.setName(userGroup.getName());
        vo.setStatus(userGroup.getStatus());
        vo.setLevel(userGroup.getLevel());
        vo.setRoleIds(iRoleService.getRoleIdsByUserGroupId(userGroup.getId()));
        vo.setInheritType(userGroup.getInheritType());
        vo.setType(userGroup.getType());
        vo.setLevelPath(userGroup.getLevelPath());
        return vo;
    }
}
