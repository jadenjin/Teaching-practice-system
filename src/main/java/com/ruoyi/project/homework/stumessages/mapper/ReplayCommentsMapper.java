package com.ruoyi.project.homework.stumessages.mapper;

import java.util.List;
import com.ruoyi.project.homework.stumessages.domain.ReplayComments;

/**
 * 用户评论Mapper接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
public interface ReplayCommentsMapper {
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
     * 删除用户评论
     *
     * @param id 用户评论主键
     * @return 结果
     */
    public int deleteReplayCommentsById(Long id);

    /**
     * 批量删除用户评论
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteReplayCommentsByIds(String[] ids);

    /**
     * 查询用户评论列表
     *
     * @param id 用户评论ID
     * @return 用户评论集合
     */
    public List<ReplayComments> getReplayCommentsById(Long id);

    /**
     * 点赞方法，实际上，原点赞上+1
     * @param rid
     */
    void likeCommentById(Long rid);
}

