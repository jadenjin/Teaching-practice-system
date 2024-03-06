package com.ruoyi.project.homework.commentslike.mapper;

import java.util.List;
import com.ruoyi.project.homework.commentslike.domain.CommentsLike;

/**
 * 点赞Mapper接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-27
 */
public interface CommentsLikeMapper 
{
    /**
     * 查询点赞
     * 
     * @param id 点赞主键
     * @return 点赞
     */
    public CommentsLike selectCommentsLikeById(Long id);

    /**
     * 查询点赞列表
     * 
     * @param commentsLike 点赞
     * @return 点赞集合
     */
    public List<CommentsLike> selectCommentsLikeList(CommentsLike commentsLike);

    /**
     * 新增点赞
     * 
     * @param commentsLike 点赞
     * @return 结果
     */
    public int insertCommentsLike(CommentsLike commentsLike);

    /**
     * 修改点赞
     * 
     * @param commentsLike 点赞
     * @return 结果
     */
    public int updateCommentsLike(CommentsLike commentsLike);

    /**
     * 删除点赞
     * 
     * @param id 点赞主键
     * @return 结果
     */
    public int deleteCommentsLikeById(Long id);

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCommentsLikeByIds(String[] ids);

    /**
     * 查询是否已点赞要传当前用户ID和当前被点赞内容的ID
     * @param rid
     * @param userId
     * @return
     */
    CommentsLike selectCommentsLikeByUserIdWithLikedId(Long rid, Long userId);
}
