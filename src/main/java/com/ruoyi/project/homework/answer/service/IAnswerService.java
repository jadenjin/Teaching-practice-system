package com.ruoyi.project.homework.answer.service;

import java.util.List;
import com.ruoyi.project.homework.answer.domain.Answer;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-08
 */
public interface IAnswerService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Answer selectAnswerById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param answer 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Answer> selectAnswerList(Answer answer);

    /**
     * 新增【请填写功能名称】
     * 
     * @param answer 【请填写功能名称】
     * @return 结果
     */
    public int insertAnswer(Answer answer);

    /**
     * 修改【请填写功能名称】
     * 
     * @param answer 【请填写功能名称】
     * @return 结果
     */
    public int updateAnswer(Answer answer);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteAnswerByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteAnswerById(Long id);

    List<Answer> selectAnswerByHId(Long hid,String teacherid);

    Integer selectAnswerByOnlineHomeWorkId(Long id, String studentId);

    Integer selectStuAnswerByHId(Long hid);

    List<Answer> selectAnswerByStudentId(Long id, String studentid);
}
