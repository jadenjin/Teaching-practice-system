package com.ruoyi.project.homework.stumessages.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.List;

/**
 * 用户评论对象 replay_comments
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
public class ReplayComments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 留言ID */
    @Excel(name = "留言ID")
    private Long guestId;

    /** 评论ID */
    @Excel(name = "评论ID")
    private Long commentId;

    /** 回复者ID */
    @Excel(name = "回复者ID")
    private Long replayUserId;

    /** 被回复者ID */
    @Excel(name = "被回复者ID")
    private Long repliedUserId;

    /** 回复内容 */
    @Excel(name = "回复内容")
    private String content;

    /** 被回复者昵称 */
    @Excel(name = "被回复者昵称")
    private String replyedUserName;

    /** 回复者昵称 */
    @Excel(name = "回复者昵称")
    private String replyUserName;

    /** 点赞 */
    @Excel(name = "点赞")
    private Long like;

    /**
     * 用户头像
     */
    private String userImg;


    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setGuestId(Long guestId)
    {
        this.guestId = guestId;
    }

    public Long getGuestId()
    {
        return guestId;
    }
    public void setCommentId(Long commentId)
    {
        this.commentId = commentId;
    }

    public Long getCommentId()
    {
        return commentId;
    }
    public void setReplayUserId(Long replayUserId)
    {
        this.replayUserId = replayUserId;
    }

    public Long getReplayUserId()
    {
        return replayUserId;
    }
    public void setRepliedUserId(Long repliedUserId)
    {
        this.repliedUserId = repliedUserId;
    }

    public Long getRepliedUserId()
    {
        return repliedUserId;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setReplyedUserName(String replyedUserName)
    {
        this.replyedUserName = replyedUserName;
    }

    public String getReplyedUserName()
    {
        return replyedUserName;
    }
    public void setReplyUserName(String replyUserName)
    {
        this.replyUserName = replyUserName;
    }

    public String getReplyUserName()
    {
        return replyUserName;
    }

    public void setLike(Long like)
    {
        this.like = like;
    }

    public Long getLike()
    {
        return like;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    //    public ReplayComments(Long id, Long guestId, Long commentId, Long replayUserId, Long repliedUserId, String content, String replyedUserName, String replyUserName) {
//        this.id = id;
//        this.guestId = guestId;
//        this.commentId = commentId;
//        this.replayUserId = replayUserId;
//        this.repliedUserId = repliedUserId;
//        this.content = content;
//        this.replyedUserName = replyedUserName;
//        this.replyUserName = replyUserName;
//    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("guestId", getGuestId())
            .append("commentId", getCommentId())
            .append("replayUserId", getReplayUserId())
            .append("repliedUserId", getRepliedUserId())
            .append("content", getContent())
            .append("createTime", getCreateTime())
            .append("replyedUserName", getReplyedUserName())
            .append("replyUserName", getReplyUserName())
            .append("like", getLike())
                .append("userImg",getUserImg())
            .toString();
    }
}
