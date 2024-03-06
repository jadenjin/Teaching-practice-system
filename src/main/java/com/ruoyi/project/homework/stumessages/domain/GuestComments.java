package com.ruoyi.project.homework.stumessages.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.List;

/**
 * 【请填写功能名称】对象 guest_comments
 *
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
public class GuestComments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 留言ID */
    @Excel(name = "留言ID")
    private Long guestId;

    /** 留言内容 */
    @Excel(name = "留言内容")
    private String content;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String userName;

    /** 点赞 */
    @Excel(name = "点赞")
    private Long like;

    /**
     * 用户头像
     */
    private String userImg;

    /** 回复表 */
    private List<ReplayComments> replayCommentsList;

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
    public void setGuestId(Long guestId)
    {
        this.guestId = guestId;
    }

    public Long getGuestId()
    {
        return guestId;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setLike(Long like)
    {
        this.like = like;
    }

    public Long getLike()
    {
        return like;
    }
    public List<ReplayComments> getReplayCommentsList() {
        return replayCommentsList;
    }

    public void setReplayCommentsList(List<ReplayComments> replayCommentsList) {
        this.replayCommentsList = replayCommentsList;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    //    public GuestComments(Long userId, Long guestId, String content, String userName) {
//        this.userId = userId;
//        this.guestId = guestId;
//        this.content = content;
//        this.userName = userName;
//    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("guestId", getGuestId())
                .append("content", getContent())
                .append("createTime", getCreateTime())
                .append("userName", getUserName())
                .append("replayCommentsList",getReplayCommentsList())
                .append("like",getLike())
                .append("userImg",getUserImg())
                .toString();
    }
}