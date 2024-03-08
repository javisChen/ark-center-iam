package com.ark.center.iam.infra.menuhierarchy.repository.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class HierarchyDAO extends ServiceImpl<HierarchyMapper, HierarchyDO> {

}
