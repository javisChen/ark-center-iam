package com.ark.center.iam.model.user.dto;

import cn.hutool.core.lang.tree.TreeNode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserMenuDTO extends TreeNode<Long> {

    private String name;
    private Meta meta;
    private String component;
    private String redirect;
    private String path;
    private List<UserMenuDTO> children;

    @Data
    public static class Meta {
        private String icon;
        private String title;
        private Boolean show;
        private Boolean hideChildren;

    }

}
