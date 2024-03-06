package com.ruoyi.project.homework.commentslike.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 点赞对象 comments_like
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-27
 */
public class CommentsLike extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 被点赞内容ID */
    @Excel(name = "被点赞内容ID")
    private Long likedId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setLikedId(Long likedId)
    {
        this.likedId = likedId;
    }

    public Long getLikedId()
    {
        return likedId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("likedId", getLikedId())
            .toString();
    }
}
