package com.ark.center.iam.domain.menuhierarchy;

import com.ark.center.iam.domain.common.hierarchy.IdTree;
import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class MenuHierarchy extends AggregateRoot {

    private IdTree idTree;

}
