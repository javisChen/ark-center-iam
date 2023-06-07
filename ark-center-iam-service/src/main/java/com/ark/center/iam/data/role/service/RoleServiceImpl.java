package com.ark.center.iam.data.role.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.cglib.CglibUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ark.center.iam.common.util.Assert;
import com.ark.center.iam.data.role.dto.*;
import com.ark.center.iam.enums.BizEnums;
import com.ark.center.iam.enums.DeletedEnums;
import com.ark.center.iam.enums.PermissionTypeEnums;
import com.ark.center.iam.enums.RoleStatusEnums;
import com.ark.center.iam.dao.entity.IamPermissionRoleRel;
import com.ark.center.iam.dao.mapper.IamPermissionRoleRelMapper;
import com.ark.center.iam.data.permission.service.IPermissionService;
import com.ark.center.iam.client.permission.vo.PermissionVO;
import com.ark.center.iam.data.role.converter.RoleBeanConverter;
import com.ark.center.iam.dao.entity.IamRole;
import com.ark.center.iam.dao.mapper.IamRoleMapper;
import com.ark.center.iam.data.role.vo.RoleBaseVO;
import com.ark.center.iam.data.role.vo.RoleListVO;
import com.ark.center.iam.dao.entity.IamUserRoleRel;
import com.ark.center.iam.dao.mapper.IamUserRoleRelMapper;
import com.ark.center.iam.dao.entity.IamUserGroupRoleRel;
import com.ark.center.iam.dao.mapper.IamUserGroupRoleRelMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
public class RoleServiceImpl extends ServiceImpl<IamRoleMapper, IamRole> implements IRoleService {

    @Autowired
    private IamPermissionRoleRelMapper iamPermissionRoleRelMapper;
    @Autowired
    private IamUserGroupRoleRelMapper iamUserGroupRoleRelMapper;
    @Autowired
    private IPermissionService iPermissionService;
    @Autowired
    private RoleBeanConverter beanConverter;
    @Autowired
    private IamUserRoleRelMapper iamUserRoleRelMapper;

    @Override
    public Page<RoleListVO> pageList(RoleQueryDTO params) {
        LambdaQueryWrapper<IamRole> queryWrapper = new LambdaQueryWrapper<IamRole>()
                .like(StrUtil.isNotBlank(params.getName()), IamRole::getName, params.getName());
        Page<IamRole> page = this.page(new Page<>(params.getCurrent(), params.getSize()), queryWrapper);

        List<RoleListVO> vos = page.getRecords().stream().map(beanConverter::convertToRoleListVO)
                .collect(Collectors.toList());
        Page<RoleListVO> pageVo = new Page<>(page.getCurrent(), page.getSize(), page.getTotal());
        pageVo.setRecords(vos);
        return pageVo;
    }

    @Override
    public void saveRole(RoleUpdateDTO dto) {
        long count = countRoleByName(dto.getName());
        Assert.isTrue(count > 0, BizEnums.ROLE_NAME_ALREADY_EXISTS);
        if (StringUtils.isNotBlank(dto.getCode())) {
            count = countRoleByCode(dto.getCode());
            Assert.isTrue(count > 0, BizEnums.ROLE_CODE_ALREADY_EXISTS);
        } else {
            dto.setCode(generateRoleCode());
        }
        IamRole role = beanConverter.convertToDO(dto);
        this.save(role);
    }

    private String generateRoleCode() {
        String code;
        do {
            code = IdUtil.fastSimpleUUID();
        } while (countRoleByCode(code) > 0);
        return code;
    }

    private long countRoleByName(String name) {
        LambdaQueryWrapper<IamRole> queryWrapper = new LambdaQueryWrapper<IamRole>()
                .eq(IamRole::getName, name);
        return this.count(queryWrapper);
    }

    private long countRoleByCode(String code) {
        LambdaQueryWrapper<IamRole> queryWrapper = new LambdaQueryWrapper<IamRole>()
                .eq(IamRole::getCode, code);
        return this.count(queryWrapper);
    }

    @Override
    public void updateRoleById(RoleUpdateDTO dto) {
        LambdaQueryWrapper<IamRole> queryWrapper = new LambdaQueryWrapper<IamRole>()
                .eq(IamRole::getName, dto.getName())
                .ne(IamRole::getId, dto.getId());
        long count = this.count(queryWrapper);
        Assert.isTrue(count > 0, BizEnums.ROLE_NAME_ALREADY_EXISTS);

        IamRole role = beanConverter.convertToDO(dto);
        this.updateById(role);
    }

    @Override
    public void updateStatus(RoleUpdateDTO dto) {
        updateStatus(dto, RoleStatusEnums.DISABLED);
    }

    @Override
    public List<Long> getRoleIdsByUserId(Long userId) {
        LambdaQueryWrapper<IamUserRoleRel> qw = new LambdaQueryWrapper<>();
        qw.eq(IamUserRoleRel::getUserId, userId);
        return iamUserRoleRelMapper.selectList(qw)
                .stream().map(IamUserRoleRel::getRoleId).collect(Collectors.toList());
    }

    @Override
    public List<Long> getRoleIdsByUserGroupIds(List<Long> userGroupIds) {
        if (CollectionUtils.isEmpty(userGroupIds)) {
            return CollectionUtil.newArrayList();
        }
        return iamUserGroupRoleRelMapper.selectRoleIdsByUserGroupIds(userGroupIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class, timeout = 20000)
    public void updateRoleRoutePermissions(RoleRoutePermissionUpdateDTO dto) {
        Long roleId = dto.getRoleId();
        List<Long> toRemoveIds = CollectionUtil.newArrayList(dto.getToRemoveRoutePermissionIds());
        toRemoveIds.addAll(dto.getToRemoveElementPermissionIds());
        iPermissionService.removeRolePermission(roleId, toRemoveIds);

        List<Long> toAddIds = CollectionUtil.newArrayList(dto.getToAddRoutePermissionIds());
        toAddIds.addAll(dto.getToAddElementPermissionIds());
        iPermissionService.batchSaveRolePermissionRel(roleId, toAddIds);
    }

    @Override
    public List<PermissionVO> getRoleRoutePermissionById(Long roleId, Long applicationId) {
        return iPermissionService.getRolePermissionVos(applicationId, roleId, PermissionTypeEnums.FRONT_ROUTE.getType());
    }

    @Override
    public List<PermissionVO> getRoleElementPermissionById(Long roleId, Long applicationId) {
        return iPermissionService.getRolePermissionVos(applicationId, roleId, PermissionTypeEnums.PAGE_ELEMENT.getType());
    }

    @Override
    public List<PermissionVO> getRoleApiPermissionById(Long roleId, Long applicationId) {
        return iPermissionService.getRolePermissionVos(applicationId, roleId, PermissionTypeEnums.SER_API.getType());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateRoleApiPermissions(RoleApiPermissionUpdateDTO dto) {
        Long roleId = dto.getRoleId();
        iPermissionService.removeRolePermission(roleId, dto.getToRemoveApiPermissionIds());
        iPermissionService.batchSaveRolePermissionRel(roleId, dto.getToAddApiPermissionIds());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void removeRoleById(Long id) {
        LambdaUpdateWrapper<IamRole> qw = new LambdaUpdateWrapper<>();
        qw.eq(IamRole::getId, id);
        qw.eq(IamRole::getIsDeleted, DeletedEnums.NOT.getCode());
        qw.set(IamRole::getIsDeleted, id);
        this.update(qw);

        // 移除用户与角色关联关系
        removeUserRoleRelByRoleId(id);
        // 移除用户组与角色关联关系
        removeUserGroupRoleRelByRoleId(id);
        // 角色与权限的关系
        removePermissionRoleRelByRoleId(id);
    }

    @Override
    public List<String> getRoleNamesByUserGroupId(Long userGroupId) {
        return iamPermissionRoleRelMapper.selectRoleNamesByUserGroupId(userGroupId);
    }

    @Override
    public List<Long> getRoleIdsByUserGroupId(Long userGroupId) {
        return iamPermissionRoleRelMapper.selectRoleIdsByUserGroupId(userGroupId);
    }

    @Override
    public void updateRoleApiPermissions(RoleApplicationApiPermissionUpdateDTO dto) {

    }

    private void removePermissionRoleRelByRoleId(Long roleId) {
        LambdaUpdateWrapper<IamPermissionRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(IamPermissionRoleRel::getRoleId, roleId);
        iamPermissionRoleRelMapper.delete(qw);
    }

    private void removeUserGroupRoleRelByRoleId(Long roleId) {
        LambdaUpdateWrapper<IamUserGroupRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(IamUserGroupRoleRel::getRoleId, roleId);
        iamUserGroupRoleRelMapper.delete(qw);
    }

    private void removeUserRoleRelByRoleId(Long roleId) {
        LambdaUpdateWrapper<IamUserRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(IamUserRoleRel::getRoleId, roleId);
        iamUserRoleRelMapper.delete(qw);
    }

    @Override
    public void removeUserRoleRelByUserId(Long userId) {
        LambdaUpdateWrapper<IamUserRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(IamUserRoleRel::getUserId, userId);
        iamUserRoleRelMapper.delete(qw);
    }

    @Override
    public List<RoleListVO> listAllVos() {
        return this.list().stream().map(beanConverter::convertToRoleListVO).collect(Collectors.toList());
    }

    @Override
    public List<String> getRoleNamesByUserId(Long userId) {
        return iamPermissionRoleRelMapper.selectRoleNamesByUserId(userId);
    }

    @Override
    public RoleBaseVO getRoleVoById(String id) {
        IamRole role = getRoleById(id);
        return CglibUtil.copy(role, RoleBaseVO.class);
    }

    private IamRole getRoleById(String id) {
        return Optional.ofNullable(this.getById(id)).orElseGet(IamRole::new);
    }

    private void updateStatus(RoleUpdateDTO dto, RoleStatusEnums statusEnum) {
        this.update(new LambdaUpdateWrapper<IamRole>()
                .eq(IamRole::getStatus, dto.getId())
                .set(IamRole::getStatus, statusEnum.getValue()));
    }
}
