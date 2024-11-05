package com.ark.center.iam.infra.usergroup.service;

import com.ark.component.tree.BizTreeService;
import com.ark.component.tree.TreeOperations;
import org.springframework.stereotype.Service;

@Service
public class UserGroupBizTreeService extends BizTreeService {

    private final static String BIZ_TYPE = "USER_GROUP";

    public UserGroupBizTreeService(TreeOperations treeOperations) {
        super(treeOperations);
    }

    @Override
    public String bizType() {
        return BIZ_TYPE;
    }

}
