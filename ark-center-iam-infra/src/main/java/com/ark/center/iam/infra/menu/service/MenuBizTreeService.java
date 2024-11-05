package com.ark.center.iam.infra.menu.service;

import com.ark.component.tree.BizTreeService;
import com.ark.component.tree.TreeOperations;
import org.springframework.stereotype.Service;

@Service
public class MenuBizTreeService extends BizTreeService {

    private final static String BIZ_TYPE = "MENU";

    public MenuBizTreeService(TreeOperations treeOperations) {
        super(treeOperations);
    }

    @Override
    public String bizType() {
        return BIZ_TYPE;
    }

}
