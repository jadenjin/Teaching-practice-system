package com.ruoyi.project.homework.stumessages.service;

import java.util.List;
import com.ruoyi.project.homework.stumessages.domain.ReplayComments;

/**
 * 用户评论Service接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
public interface IReplayCommentsService 
{
    /**
     * 查询用户评论
     * 
     * @param id 用户评论主键
     * @return 用户评论
     */
    public ReplayComments selectReplayCommentsById(Long id);

    /**
     * 查询用户评论列表
     * 
     * @param replayComments 用户评论
     * @return 用户评论集合
     */
    public List<ReplayComments> selectReplayCommentsList(ReplayComments replayComments);

    /**
     * 查询用户评论列表
     *
     * @param id 用户评论ID
     * @return 用户评论集合
     */
    public List<ReplayComments> getReplayCommentsById(Long id);


    /**
     * 新增用户评论
     * 
     * @param replayComments 用户评论
     * @return 结果
     */
    public int insertReplayComments(ReplayComments replayComments);

    /**
     * 修改用户评论
     * 
     * @param replayComments 用户评论
     * @return 结果
     */
    public int updateReplayComments(ReplayComments replayComments);

    /**
     * 批量删除用户评论
     * 
     * @param ids 需要删除的用户评论主键集合
     * @return 结果
     */
    public int deleteReplayCommentsByIds(String ids);

    /**
     * 删除用户评论信息
     * 
     * @param id 用户评论主键
     * @return 结果
     */
    public int deleteReplayCommentsById(Long id);

    /**
     * 点赞方法，实际上，原点赞上+1
     * @param rid
     */
    void likeCommentById(Long rid);
}
