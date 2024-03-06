package com.ruoyi.project.homework.stumessages.mapper;

import com.ruoyi.project.homework.stumessages.domain.GuestComments;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
public interface GuestCommentsMapper
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
     * 删除【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteGuestCommentsById(Long id);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGuestCommentsByIds(String[] ids);

    /**
     * 查询留言的评论列表
     *
     * @param id 留言ID
     * @return 留言的评论集合
     */
    public List<GuestComments> getGuestCommentsById(Long id);

    /**
     * 给评论点赞
     * @param rid
     */
    public void likeCommentById(Long rid);
}
