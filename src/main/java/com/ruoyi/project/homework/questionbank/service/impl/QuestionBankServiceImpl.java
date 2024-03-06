package com.ruoyi.project.homework.questionbank.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Map;

import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.project.homework.questionbank.domain.QuestionOptions;
import com.ruoyi.project.homework.questionbank.mapper.QuestionBankMapper;
import com.ruoyi.project.homework.questionbank.domain.QuestionBank;
import com.ruoyi.project.homework.questionbank.service.IQuestionBankService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 题目管理Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-05
 */
@Service
public class QuestionBankServiceImpl implements IQuestionBankService 
{
    @Autowired
    private QuestionBankMapper questionBankMapper;

    /**
     * 查询题目管理
     * 
     * @param questionid 题目管理主键
     * @return 题目管理
     */
    @Override
    public QuestionBank selectQuestionBankByQuestionid(Long questionid)
    {
        return questionBankMapper.selectQuestionBankByQuestionid(questionid);
    }

    /**
     * 查询题目管理列表
     * 
     * @param questionBank 题目管理
     * @return 题目管理
     */
    @Override
    public List<QuestionBank> selectQuestionBankList(QuestionBank questionBank)
    {
        return questionBankMapper.selectQuestionBankList(questionBank);
    }

    /**
     * 新增题目管理
     * 
     * @param questionBank 题目管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertQuestionBank(QuestionBank questionBank)
    {
        questionBank.setCreateTime(DateUtils.getNowDate());
        int rows = questionBankMapper.insertQuestionBank(questionBank);
        insertQuestionOptions(questionBank);
        return rows;
    }

    /**
     * 修改题目管理
     * 
     * @param questionBank 题目管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateQuestionBank(QuestionBank questionBank)
    {
        questionBank.setUpdateTime(DateUtils.getNowDate());
        questionBankMapper.deleteQuestionOptionsByQid(questionBank.getQuestionid());
        insertQuestionOptions(questionBank);
        return questionBankMapper.updateQuestionBank(questionBank);
    }

    /**
     * 批量删除题目管理
     * 
     * @param questionids 需要删除的题目管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteQuestionBankByQuestionids(String questionids)
    {
        questionBankMapper.deleteQuestionOptionsByQids(Convert.toStrArray(questionids));
        return questionBankMapper.deleteQuestionBankByQuestionids(Convert.toStrArray(questionids));
    }

    /**
     * 删除题目管理信息
     * 
     * @param questionid 题目管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteQuestionBankByQuestionid(Long questionid)
    {
        questionBankMapper.deleteQuestionOptionsByQid(questionid);
        return questionBankMapper.deleteQuestionBankByQuestionid(questionid);
    }

    @Override
    public List<Map<String, Object>> selectQuestionBankOptionBypaperid(Long paperid) {
        return questionBankMapper.selectQuestionBankOptionBypaperid(paperid);
    }

    @Override
    public List<QuestionBank> selectAllQuestionBank(Long paperid) {
        List<QuestionBank> questionBanks = questionBankMapper.selectAllQuestionBankByPaperID(paperid);

        questionBanks.forEach(questionBank -> {
           QuestionOptions questionOptions = new QuestionOptions();
           questionOptions.setQid(questionBank.getQuestionid());
            List<QuestionOptions> questionOptionsList = questionBankMapper.selectQuestionOptionsList(questionOptions);
            questionBank.setQuestionOptionsList(questionOptionsList);
//            System.out.println(questionOptionsList);
        });
        return questionBanks;
    }

    @Override
    public List<QuestionOptions> selectQuestionBankOptionByQid(Long questionid) {
        return questionBankMapper.selectQuestionBankOptionByQid(questionid);
    }

    @Override
    public List<QuestionBank> selectQuestionBankOptionByQuestionID(Long questionid) {
        return questionBankMapper.selectQuestionBankOptionByQuestionID(questionid);
    }

    @Override
    public QuestionBank getOne(Long questionid) {
        QuestionBank questionBank = questionBankMapper.selectQuestionBankByQuestionid(questionid);
        return questionBank;
    }

    @Override
    public QuestionOptions selectQuestionBankByOptionId(long optionid) {
        return questionBankMapper.selectQuestionBankByOptionId(optionid);
    }


    /**
     * 新增选项管理信息
     * 
     * @param questionBank 题目管理对象
     */
    public void insertQuestionOptions(QuestionBank questionBank)
    {
        List<QuestionOptions> questionOptionsList = questionBank.getQuestionOptionsList();
        Long questionid = questionBank.getQuestionid();
        if (StringUtils.isNotNull(questionOptionsList))
        {
            List<QuestionOptions> list = new ArrayList<QuestionOptions>();
            for (QuestionOptions questionOptions : questionOptionsList)
            {
                questionOptions.setQid(questionid);
                list.add(questionOptions);
            }
            if (list.size() > 0)
            {
                questionBankMapper.batchQuestionOptions(list);
            }
        }
    }
}
