package com.ruoyi.project.homework.answer.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.answer.mapper.AnswerMapper;
import com.ruoyi.project.homework.answer.domain.Answer;
import com.ruoyi.project.homework.answer.service.IAnswerService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-08
 */
@Service
public class AnswerServiceImpl implements IAnswerService 
{
    @Autowired
    private AnswerMapper answerMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Answer selectAnswerById(Long id)
    {
        return answerMapper.selectAnswerById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param answer 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Answer> selectAnswerList(Answer answer)
    {
        return answerMapper.selectAnswerList(answer);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param answer 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertAnswer(Answer answer)
    {
        answer.setCreateTime(DateUtils.getNowDate());
        answer.setCreateBy(ShiroUtils.getSysUser().getLoginName());
        return answerMapper.insertAnswer(answer);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param answer 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateAnswer(Answer answer)
    {
        answer.setUpdateTime(DateUtils.getNowDate());
        answer.setUpdateBy(ShiroUtils.getSysUser().getUserName());
        return answerMapper.updateAnswer(answer);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteAnswerByIds(String ids)
    {
        return answerMapper.deleteAnswerByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteAnswerById(Long id)
    {
        return answerMapper.deleteAnswerById(id);
    }

    @Override
    public List<Answer> selectAnswerByHId(Long hid,String teacherid) {
        return answerMapper.selectAnswerByHId(hid,teacherid);
    }

    @Override
    public Integer selectAnswerByOnlineHomeWorkId(Long id, String studentId) {
        return answerMapper.selectAnswerByOnlineHomeWorkId(id,studentId);
    }

    @Override
    public Integer selectStuAnswerByHId(Long hid) {
        return answerMapper.selectStuAnswerByHId(hid);
    }

    @Override
    public List<Answer> selectAnswerByStudentId(Long id, String studentid) {
        return answerMapper.selectAnswerByStudentId(id,studentid);
    }
}
