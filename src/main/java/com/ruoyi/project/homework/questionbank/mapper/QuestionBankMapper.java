package com.ruoyi.project.homework.questionbank.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.project.homework.questionbank.domain.QuestionBank;
import com.ruoyi.project.homework.questionbank.domain.QuestionOptions;

/**
 * 题目管理Mapper接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-05
 */
public interface QuestionBankMapper 
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
     * 删除题目管理
     * 
     * @param questionid 题目管理主键
     * @return 结果
     */
    public int deleteQuestionBankByQuestionid(Long questionid);

    /**
     * 批量删除题目管理
     * 
     * @param questionids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQuestionBankByQuestionids(String[] questionids);

    /**
     * 批量删除选项管理
     * 
     * @param questionids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQuestionOptionsByQids(String[] questionids);
    
    /**
     * 批量新增选项管理
     * 
     * @param questionOptionsList 选项管理列表
     * @return 结果
     */
    public int batchQuestionOptions(List<QuestionOptions> questionOptionsList);
    

    /**
     * 通过题目管理主键删除选项管理信息
     * 
     * @param questionid 题目管理ID
     * @return 结果
     */
    public int deleteQuestionOptionsByQid(Long questionid);

    public List<Map<String, Object>> selectQuestionBankOptionBypaperid(Long paperid);

    public List<QuestionBank> selectAllQuestionBankByPaperID(Long paperid);

    public  List<QuestionOptions> selectQuestionOptionsList(QuestionOptions questionOptions);

    public List<QuestionOptions> selectQuestionBankOptionByQid(Long questionid);

    public List<QuestionBank> selectQuestionBankOptionByQuestionID(Long questionid);

    QuestionOptions selectQuestionBankByOptionId(long optionid);
}
