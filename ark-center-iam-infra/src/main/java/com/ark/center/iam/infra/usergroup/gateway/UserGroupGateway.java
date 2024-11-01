//package com.ark.center.iam.infra.usergroup.gateway;
//
//import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
//import com.ark.center.iam.client.usergroup.query.UserGroupQry;
//import com.ark.center.iam.infra.usergroup.UserGroup;
//import com.ark.center.iam.infra.usergroup.vo.UserGroupVO;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//
//import java.util.List;
//
//public interface UserGroupGateway {
//    void insertUserGroupAndUserRelations(Long userId, List<Long> userGroupIds);
//
//    void deleteUserGroupAndUserRelationsByUserId(Long userId);
//
//    /**
//     * 查询用户所在的用户组（只获取用户直属的用户组）
//     *
//     * @param userId 用户id
//     */
//    List<Long> selectUserGroupIdsByUserId(Long userId);
//
//    /**
//     * 查询用户所在的用户组
//     *
//     * @param userId        用户id
//     * @param includeParent 是否包含父级用户组，如果为是的话，会把有继承父级的用户组也查询出来
//     */
//    List<Long> selectUserGroupIdsByUserId(Long userId, boolean includeParent);
//
//    List<UserGroupVO> selectUserGroupsByUserIds(List<Long> userIds);
//
//    void deleteUserGroupAndRoleRelationsByUserGroupId(Long roleId);
//
//    Page<UserGroup> selectPages(UserGroupQry qry);
//
//    List<UserGroup> selectListWithoutRoot();
//
//    List<UserGroupBaseDTO> selectList();
//
//    UserGroup selectById(Long id);
//
//    void insert(UserGroup userGroup);
//
//    void updateByUserGroupId(UserGroup userGroup);
//
//    void insertUserGroupAndRolesRelations(Long userGroupId, List<Long> roleIds);
//
//    List<UserGroup> selectSubUserGroups(String levelPath);
//
//    void logicDelete(List<Long> ids);
//}
