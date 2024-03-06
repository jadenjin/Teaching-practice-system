package com.ruoyi.project.homework.stumessages.service;

import java.util.List;
import com.ruoyi.project.homework.stumessages.domain.GuestComments;

/**
 * 【请填写功能名称】Service接口
 *
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
public interface IGuestCommentsService
{
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public GuestComments selectGuestCommentsById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param guestComments 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<GuestComments> selectGuestCommentsList(GuestComments guestComments);

    /**
     * 查询留言的评论列表
     *
     * @param id 留言ID
     * @return 留言的评论集合
     */
    public List<GuestComments> getGuestCommentsById(Long id);

    /**
     * 新增【请填写功能名称】
     *
     * @param guestComments 【请填写功能名称】
     * @return 结果
     */
    public int insertGuestComments(GuestComments guestComments);

    /**
     * 修改【请填写功能名称】
     *
     * @param guestComments 【请填写功能名称】
     * @return 结果
     */
    public int updateGuestComments(GuestComments guestComments);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteGuestCommentsByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteGuestCommentsById(Long id);

    /**
     * 给评论点赞
     * @param rid
     */
    public  void likeCommentById(Long rid);
}
