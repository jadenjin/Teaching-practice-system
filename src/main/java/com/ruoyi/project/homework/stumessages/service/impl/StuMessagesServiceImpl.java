package com.ruoyi.project.homework.stumessages.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.homework.stumessages.domain.StuMessages;
import com.ruoyi.project.homework.stumessages.mapper.StuMessagesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.stumessages.service.IStuMessagesService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 学生留言Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Service
public class StuMessagesServiceImpl implements IStuMessagesService 
{
    @Autowired
    private StuMessagesMapper stuMessagesMapper;

    /**
     * 查询学生留言
     * 
     * @param id 学生留言主键
     * @return 学生留言
     */
    @Override
    public StuMessages selectStuMessagesById(Long id)
    {
        return stuMessagesMapper.selectStuMessagesById(id);
    }

    /**
     * 查询学生留言列表
     * 
     * @param stuMessages 学生留言
     * @return 学生留言
     */
    @Override
    public List<StuMessages> selectStuMessagesList(StuMessages stuMessages)
    {
        return stuMessagesMapper.selectStuMessagesList(stuMessages);
    }

    /**
     * 新增学生留言
     * 
     * @param stuMessages 学生留言
     * @return 结果
     */
    @Override
    public int insertStuMessages(StuMessages stuMessages)
    {
        stuMessages.setCreateTime(DateUtils.getNowDate());
        stuMessages.setCreateBy(ShiroUtils.getSysUser().getLoginName());
        return stuMessagesMapper.insertStuMessages(stuMessages);
    }

    /**
     * 修改学生留言
     * 
     * @param stuMessages 学生留言
     * @return 结果
     */
    @Override
    public int updateStuMessages(StuMessages stuMessages)
    {
        stuMessages.setUpdateTime(DateUtils.getNowDate());
        stuMessages.setUpdateBy(ShiroUtils.getSysUser().getUserName());
        return stuMessagesMapper.updateStuMessages(stuMessages);
    }

    /**
     * 批量删除学生留言
     * 
     * @param ids 需要删除的学生留言主键
     * @return 结果
     */
    @Override
    public int deleteStuMessagesByIds(String ids)
    {
        return stuMessagesMapper.deleteStuMessagesByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除学生留言信息
     * 
     * @param id 学生留言主键
     * @return 结果
     */
    @Override
    public int deleteStuMessagesById(Long id)
    {
        return stuMessagesMapper.deleteStuMessagesById(id);
    }
}
