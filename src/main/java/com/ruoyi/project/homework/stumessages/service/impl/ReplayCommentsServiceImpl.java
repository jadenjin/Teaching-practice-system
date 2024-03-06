package com.ruoyi.project.homework.stumessages.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.homework.stumessages.domain.ReplayComments;
import com.ruoyi.project.homework.stumessages.mapper.ReplayCommentsMapper;
import com.ruoyi.project.homework.stumessages.service.IReplayCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;

/**
 * 用户评论Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
@Service
public class ReplayCommentsServiceImpl implements IReplayCommentsService
{
    @Autowired
    private ReplayCommentsMapper replayCommentsMapper;

    /**
     * 查询用户评论
     * 
     * @param id 用户评论主键
     * @return 用户评论
     */
    @Override
    public ReplayComments selectReplayCommentsById(Long id)
    {
        return replayCommentsMapper.selectReplayCommentsById(id);
    }

    /**
     * 查询用户评论列表
     * 
     * @param replayComments 用户评论
     * @return 用户评论
     */
    @Override
    public List<ReplayComments> selectReplayCommentsList(ReplayComments replayComments)
    {
        return replayCommentsMapper.selectReplayCommentsList(replayComments);
    }

    /**
     * 查询用户评论列表
     *
     * @param id 用户评论ID
     * @return 用户评论集合
     */
    @Override
    public List<ReplayComments> getReplayCommentsById(Long id) {
        return replayCommentsMapper.getReplayCommentsById(id);
    }

    /**
     * 新增用户评论
     * 
     * @param replayComments 用户评论
     * @return 结果
     */
    @Override
    public int insertReplayComments(ReplayComments replayComments)
    {
        replayComments.setCreateTime(DateUtils.getNowDate());
        return replayCommentsMapper.insertReplayComments(replayComments);
    }

    /**
     * 修改用户评论
     * 
     * @param replayComments 用户评论
     * @return 结果
     */
    @Override
    public int updateReplayComments(ReplayComments replayComments)
    {
        return replayCommentsMapper.updateReplayComments(replayComments);
    }

    /**
     * 批量删除用户评论
     * 
     * @param ids 需要删除的用户评论主键
     * @return 结果
     */
    @Override
    public int deleteReplayCommentsByIds(String ids)
    {
        return replayCommentsMapper.deleteReplayCommentsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户评论信息
     * 
     * @param id 用户评论主键
     * @return 结果
     */
    @Override
    public int deleteReplayCommentsById(Long id)
    {
        return replayCommentsMapper.deleteReplayCommentsById(id);
    }

    /**
     * 点赞方法，实际上，原点赞上+1
     * @param rid
     */
    @Override
    public void likeCommentById(Long rid) {
        replayCommentsMapper.likeCommentById(rid);
    }
}
