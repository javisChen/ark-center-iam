package com.ark.center.iam.domain.usergroup;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户组表
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("iam_user_group")
public class UserGroup extends BaseEntity {

    public final static Long DEFAULT_PID = 0L;
    public final static Integer FIRST_LEVEL = 1;
    

    /**
     * 用户组名称
     */
    @TableField("name")
    private String name;

    /**
     * 用户组名称
     */
    @TableField("pid")
    private Long pid;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("status")
    private Integer status;

    /**
     * 状态 1-已启用；2-已禁用；
     */
    @TableField("level")
    private Integer level;

    @TableField("level_path")
    private String levelPath;

    /**
     * 继承类型 0-不继承 1-继承上级用户组 2-继承所有用户组
     */
    @TableField("inherit_type")
    private Integer inheritType;

    /**
     * 用户组类型 1-公司 2-部门
     */
    @TableField("type")
    private Integer type;

    @TableField(value = "is_deleted")
    @TableLogic
    private Long isDeleted;

    public boolean isFirstLevel() {
        return DEFAULT_PID.equals(this.pid) || FIRST_LEVEL.equals(this.getLevel());
    }

}
