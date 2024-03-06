package com.ruoyi.project.homework.questionbank.domain;

import java.math.BigDecimal;
import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 题目管理对象 stu_question_bank
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-05
 */
public class QuestionBank extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 题目ID */
    private Long questionid;

    /** 试卷ID */
    @Excel(name = "试卷ID")
    private Long paperid;

    /** 题目名称 */
    @Excel(name = "题目名称")
    private String questions;

    /** 题目类型（0：单选题、1：多选题、2：简答题） */
    @Excel(name = "题目类型", readConverterExp = "0=：单选题、1：多选题、2：简答题")
    private Integer questiontype;

    /** 试题分值 */
    @Excel(name = "试题分值")
    private BigDecimal scores;

    /** 选项管理信息 */
    private List<QuestionOptions> questionOptionsList;

    public void setQuestionid(Long questionid)
    {
        this.questionid = questionid;
    }

    public Long getQuestionid()
    {
        return questionid;
    }
    public void setPaperid(Long paperid)
    {
        this.paperid = paperid;
    }

    public Long getPaperid()
    {
        return paperid;
    }
    public void setQuestions(String questions)
    {
        this.questions = questions;
    }

    public String getQuestions()
    {
        return questions;
    }
    public void setQuestiontype(Integer questiontype)
    {
        this.questiontype = questiontype;
    }

    public Integer getQuestiontype()
    {
        return questiontype;
    }
    public void setScores(BigDecimal scores)
    {
        this.scores = scores;
    }

    public BigDecimal getScores()
    {
        return scores;
    }

    public List<QuestionOptions> getQuestionOptionsList()
    {
        return questionOptionsList;
    }

    public void setQuestionOptionsList(List<QuestionOptions> questionOptionsList)
    {
        this.questionOptionsList = questionOptionsList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("questionid", getQuestionid())
            .append("paperid", getPaperid())
            .append("questions", getQuestions())
            .append("questiontype", getQuestiontype())
            .append("scores", getScores())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("questionOptionsList", getQuestionOptionsList())
            .toString();
    }
}
