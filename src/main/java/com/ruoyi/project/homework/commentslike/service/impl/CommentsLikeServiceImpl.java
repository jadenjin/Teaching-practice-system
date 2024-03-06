package com.ruoyi.project.homework.commentslike.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.commentslike.mapper.CommentsLikeMapper;
import com.ruoyi.project.homework.commentslike.domain.CommentsLike;
import com.ruoyi.project.homework.commentslike.service.ICommentsLikeService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 点赞Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-27
 */
@Service
public class CommentsLikeServiceImpl implements ICommentsLikeService 
{
    @Autowired
    private CommentsLikeMapper commentsLikeMapper;

    /**
     * 查询点赞
     * 
     * @param id 点赞主键
     * @return 点赞
     */
    @Override
    public CommentsLike selectCommentsLikeById(Long id)
    {
        return commentsLikeMapper.selectCommentsLikeById(id);
    }

    /**
     * 查询点赞列表
     * 
     * @param commentsLike 点赞
     * @return 点赞
     */
    @Override
    public List<CommentsLike> selectCommentsLikeList(CommentsLike commentsLike)
    {
        return commentsLikeMapper.selectCommentsLikeList(commentsLike);
    }

    /**
     * 新增点赞
     * 
     * @param commentsLike 点赞
     * @return 结果
     */
    @Override
    public int insertCommentsLike(CommentsLike commentsLike)
    {
        return commentsLikeMapper.insertCommentsLike(commentsLike);
    }

    /**
     * 修改点赞
     * 
     * @param commentsLike 点赞
     * @return 结果
     */
    @Override
    public int updateCommentsLike(CommentsLike commentsLike)
    {
        return commentsLikeMapper.updateCommentsLike(commentsLike);
    }

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的点赞主键
     * @return 结果
     */
    @Override
    public int deleteCommentsLikeByIds(String ids)
    {
        return commentsLikeMapper.deleteCommentsLikeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除点赞信息
     * 
     * @param id 点赞主键
     * @return 结果
     */
    @Override
    public int deleteCommentsLikeById(Long id)
    {
        return commentsLikeMapper.deleteCommentsLikeById(id);
    }

    /**
     * 查询是否已点赞要传当前用户ID和当前被点赞内容的ID
     * @param rid
     * @param userId
     * @return
     */
    @Override
    public CommentsLike selectCommentsLikeByUserIdWithLikedId(Long rid, Long userId) {
        return commentsLikeMapper.selectCommentsLikeByUserIdWithLikedId(rid,userId);
    }
}
