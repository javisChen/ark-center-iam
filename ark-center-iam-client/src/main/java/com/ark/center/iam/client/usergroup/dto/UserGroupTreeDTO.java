package com.ark.center.iam.client.usergroup.dto;


import lombok.Data;

import java.util.List;

@Data
public class UserGroupTreeDTO  {


    private String title;
    private String key;
    private List<ChildrenBean> children;

    @Data
    public static class ChildrenBean {
        private String title;
        private String key;
        private List<ChildrenBean> children;

    }
}
