package com.ruoyi.project.homework.stumessages.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.homework.stumessages.domain.GuestComments;
import com.ruoyi.project.homework.stumessages.mapper.GuestCommentsMapper;
import com.ruoyi.project.homework.stumessages.service.IGuestCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
@Service
public class GuestCommentsServiceImpl implements IGuestCommentsService
{
    @Autowired
    private GuestCommentsMapper guestCommentsMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public GuestComments selectGuestCommentsById(Long id)
    {
        return guestCommentsMapper.selectGuestCommentsById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param guestComments 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<GuestComments> selectGuestCommentsList(GuestComments guestComments)
    {
        return guestCommentsMapper.selectGuestCommentsList(guestComments);
    }

    /**
     * 查询留言的评论列表
     *
     * @param id 留言ID
     * @return 留言的评论集合
     */
    @Override
    public List<GuestComments> getGuestCommentsById(Long id) {
        return guestCommentsMapper.getGuestCommentsById(id);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param guestComments 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertGuestComments(GuestComments guestComments)
    {
        guestComments.setCreateTime(DateUtils.getNowDate());
        return guestCommentsMapper.insertGuestComments(guestComments);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param guestComments 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateGuestComments(GuestComments guestComments)
    {
        return guestCommentsMapper.updateGuestComments(guestComments);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteGuestCommentsByIds(String ids)
    {
        return guestCommentsMapper.deleteGuestCommentsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteGuestCommentsById(Long id)
    {
        return guestCommentsMapper.deleteGuestCommentsById(id);
    }

    /**
     * 给评论点赞
     * @param rid
     */
    @Override
    public void likeCommentById(Long rid) {
         guestCommentsMapper.likeCommentById(rid);
    }
}