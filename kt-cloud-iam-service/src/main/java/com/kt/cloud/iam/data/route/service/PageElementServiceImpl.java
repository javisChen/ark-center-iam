package com.kt.cloud.iam.data.route.service;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.extra.cglib.CglibUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kt.cloud.iam.data.permission.service.IPermissionService;
import com.kt.cloud.iam.data.route.dto.PageElementUpdateDTO;
import com.kt.cloud.iam.data.route.dto.RouteUpdateDTO;
import com.kt.cloud.iam.enums.DeletedEnums;
import com.kt.cloud.iam.enums.PermissionTypeEnums;
import com.kt.cloud.iam.dao.entity.IamPageElement;
import com.kt.cloud.iam.dao.mapper.IamPageElementMapper;
import com.kt.cloud.iam.data.route.vo.PageElementVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * <p>
 * 页面元素表 服务实现类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
public class PageElementServiceImpl extends ServiceImpl<IamPageElementMapper, IamPageElement>
        implements IPageElementService {

    @Autowired
    private IPermissionService iPermissionService;

    @Override
    @Transactional(rollbackFor = Exception.class, timeout = 20000)
    public void savePageElement(PageElementUpdateDTO dto) {
        IamPageElement pageElement = CglibUtil.copy(dto, IamPageElement.class);
        this.save(pageElement);
        iPermissionService.addPermission(pageElement.getId(), PermissionTypeEnums.PAGE_ELEMENT);
    }

    private List<IamPageElement> listPageElements(Wrapper<IamPageElement> queryWrapper) {
        return Optional.ofNullable(this.list(queryWrapper)).orElseGet(ArrayList::new);
    }

    @Override
    public void batchSavePageElement(Long routeId, List<RouteUpdateDTO.Element> elements) {
        if (CollectionUtil.isNotEmpty(elements)) {
            for (RouteUpdateDTO.Element item : elements) {
                PageElementUpdateDTO dto = new PageElementUpdateDTO();
                dto.setRouteId(routeId);
                dto.setName(item.getName());
                dto.setType(item.getType());
                this.savePageElement(dto);
            }
        }
    }

    @Override
    public List<PageElementVO> getPageElementVOSByRouteId(Long routeId) {
        return getPageElementsByRouteId(routeId).stream().map(this::assemblePageElementVO).collect(Collectors.toList());
    }

    @Override
    public List<IamPageElement> getPageElementsByRouteId(Long routeId) {
        LambdaQueryWrapper<IamPageElement> qw = new LambdaQueryWrapper<>();
        qw.eq(IamPageElement::getRouteId, routeId);
        qw.eq(IamPageElement::getIsDeleted, DeletedEnums.NOT.getCode());
        return listPageElements(qw);
    }

    @Override
    public void removePageElementByRouteId(Long routeId) {
        this.update(new LambdaUpdateWrapper<IamPageElement>()
                .eq(IamPageElement::getRouteId, routeId)
                .set(IamPageElement::getIsDeleted, DeletedEnums.YET.getCode())
        );
    }

    @Override
    public List<IamPageElement> listElementsByRouteId(Long routeId) {
        LambdaQueryWrapper<IamPageElement> qw = new LambdaQueryWrapper<>();
        qw.eq(IamPageElement::getRouteId, routeId);
        qw.eq(IamPageElement::getIsDeleted, DeletedEnums.NOT.getCode());
        return this.listPageElements(qw);
    }

    @Override
    public List<IamPageElement> getPageElementsByIds(List<Long> elementIds) {
        LambdaQueryWrapper<IamPageElement> qw = new LambdaQueryWrapper<>();
        qw.in(IamPageElement::getId, elementIds);
        qw.eq(IamPageElement::getIsDeleted, DeletedEnums.NOT.getCode());
        return this.listPageElements(qw);
    }

    private PageElementVO assemblePageElementVO(IamPageElement item) {
        PageElementVO vo = new PageElementVO();
        vo.setId(item.getId());
        vo.setRouteId(item.getRouteId());
        vo.setName(item.getName());
        vo.setType(item.getType());
        return vo;
    }
}
