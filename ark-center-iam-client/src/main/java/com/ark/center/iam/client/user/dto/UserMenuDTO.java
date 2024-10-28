package com.ark.center.iam.client.user.dto;

import com.ark.component.tree.dto.TreeDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserMenuDTO extends TreeDTO<Long> {

    private String name;
//    private Long parentId;
//    private Long id;
    private Meta meta;
    private String component;
    private String component2;
    private String redirect;
    private String path;
    private String path2;

    @Data
    public static class Meta {
        private String icon;
        private String title;
        private Boolean show;
        private Boolean hideChildren;

    }

}
