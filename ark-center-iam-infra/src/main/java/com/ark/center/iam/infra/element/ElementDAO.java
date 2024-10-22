package com.ark.center.iam.infra.element;

import com.ark.center.iam.infra.menu.db.ElementMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ElementDAO extends ServiceImpl<ElementMapper, Element> {

}
