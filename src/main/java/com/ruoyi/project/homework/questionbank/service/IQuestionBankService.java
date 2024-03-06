package com.ruoyi.project.homework.questionbank.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.project.homework.questionbank.domain.QuestionBank;
import com.ruoyi.project.homework.questionbank.domain.QuestionOptions;

/**
 * 题目管理Service接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-05
 */
public interface IQuestionBankService 
{
    /**
     * 查询题目管理
     * 
     * @param questionid 题目管理主键
     * @return 题目管理
     */
    public QuestionBank selectQuestionBankByQuestionid(Long questionid);

    /**
     * 查询题目管理列表
     * 
     * @param questionBank 题目管理
     * @return 题目管理集合
     */
    public List<QuestionBank> selectQuestionBankList(QuestionBank questionBank);

    /**
     * 新增题目管理
     * 
     * @param questionBank 题目管理
     * @return 结果
     */
    public int insertQuestionBank(QuestionBank questionBank);

    /**
     * 修改题目管理
     * 
     * @param questionBank 题目管理
     * @return 结果
     */
    public int updateQuestionBank(QuestionBank questionBank);

    /**
     * 批量删除题目管理
     * 
     * @param questionids 需要删除的题目管理主键集合
     * @return 结果
     */
    public int deleteQuestionBankByQuestionids(String questionids);

    /**
     * 删除题目管理信息
     * 
     * @param questionid 题目管理主键
     * @return 结果
     */
    public int deleteQuestionBankByQuestionid(Long questionid);

    public List<Map<String, Object>> selectQuestionBankOptionBypaperid(Long paperid);

    public  List<QuestionBank> selectAllQuestionBank(Long paperid);

    public List<QuestionOptions> selectQuestionBankOptionByQid(Long questionid);

    public List<QuestionBank> selectQuestionBankOptionByQuestionID(Long questionid);

    QuestionBank getOne(Long questionid);

    QuestionOptions selectQuestionBankByOptionId(long optionid);
}
