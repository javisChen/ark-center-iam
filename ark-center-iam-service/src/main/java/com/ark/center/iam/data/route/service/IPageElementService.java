package com.ark.center.iam.data.route.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamPageElement;
import com.ark.center.iam.client.route.dto.PageElementUpdateDTO;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.dto.PageElementVO;

import java.util.List;

/**
 * <p>
 * 页面元素表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IPageElementService extends IService<IamPageElement> {

    void savePageElement(PageElementUpdateDTO dto);

    void batchSavePageElement(Long routeId, List<RouteCmd.Element> elements);

    List<PageElementVO> getPageElementVOSByRouteId(Long id);

    List<IamPageElement> getPageElementsByRouteId(Long routeId);

    void removePageElementByRouteId(Long routeId);

    List<IamPageElement> listElementsByRouteId(Long routeId);

    List<IamPageElement> getPageElementsByIds(List<Long> elementIds);
}
