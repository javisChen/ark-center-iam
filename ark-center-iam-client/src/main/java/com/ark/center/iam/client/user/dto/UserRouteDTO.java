package com.ark.center.iam.client.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRouteDTO  {

    private String name;
    private Long parentId;
    private Long id;
    private Meta meta;
    private String component;
    private String redirect;
    private String path;

    @Data
    public static class Meta {
        private String icon;
        private String title;
        private Boolean show;
        private Boolean hideChildren;

    }

}
