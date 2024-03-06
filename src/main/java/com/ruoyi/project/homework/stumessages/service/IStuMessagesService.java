package com.ruoyi.project.homework.stumessages.service;

import java.util.List;
import com.ruoyi.project.homework.stumessages.domain.StuMessages;

/**
 * 学生留言Service接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
public interface IStuMessagesService 
{
    /**
     * 查询学生留言
     * 
     * @param id 学生留言主键
     * @return 学生留言
     */
    public StuMessages selectStuMessagesById(Long id);

    /**
     * 查询学生留言列表
     * 
     * @param stuMessages 学生留言
     * @return 学生留言集合
     */
    public List<StuMessages> selectStuMessagesList(StuMessages stuMessages);

    /**
     * 新增学生留言
     * 
     * @param stuMessages 学生留言
     * @return 结果
     */
    public int insertStuMessages(StuMessages stuMessages);

    /**
     * 修改学生留言
     * 
     * @param stuMessages 学生留言
     * @return 结果
     */
    public int updateStuMessages(StuMessages stuMessages);

    /**
     * 批量删除学生留言
     * 
     * @param ids 需要删除的学生留言主键集合
     * @return 结果
     */
    public int deleteStuMessagesByIds(String ids);

    /**
     * 删除学生留言信息
     * 
     * @param id 学生留言主键
     * @return 结果
     */
    public int deleteStuMessagesById(Long id);
}
