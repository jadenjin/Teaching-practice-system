package com.ruoyi.project.homework.answer.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 stu_answer
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-08
 */
public class Answer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 作业ID */
    @Excel(name = "作业ID")
    private String homeworkid;

    /** 学生id */
    @Excel(name = "学生id")
    private String studentId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 班级ID */
    @Excel(name = "班级ID")
    private String stucalssid;

    /** 教师ID */
    @Excel(name = "教师ID")
    private String teacherid;

    /** 试卷ID */
    @Excel(name = "试卷ID")
    private Long paperid;

    /** 题目ID */
    @Excel(name = "题目ID")
    private Long questionid;

    /** 答案ID */
    @Excel(name = "答案ID")
    private Long optionid;

    /** 题目 */
    @Excel(name = "题目")
    private String question;

    /** 答案 */
    @Excel(name = "答案")
    private String answer;

    /** 正确答案状态（0：正确、1：错误） */
    @Excel(name = "正确答案状态", readConverterExp = "0=：正确、1：错误")
    private String correctAnswerStatus;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setHomeworkid(String homeworkid)
    {
        this.homeworkid = homeworkid;
    }

    public String getHomeworkid()
    {
        return homeworkid;
    }
    public void setStudentId(String studentId)
    {
        this.studentId = studentId;
    }

    public String getStudentId()
    {
        return studentId;
    }
    public void setStudentName(String studentName)
    {
        this.studentName = studentName;
    }

    public String getStudentName()
    {
        return studentName;
    }
    public void setStucalssid(String stucalssid)
    {
        this.stucalssid = stucalssid;
    }

    public String getStucalssid()
    {
        return stucalssid;
    }
    public void setTeacherid(String teacherid)
    {
        this.teacherid = teacherid;
    }

    public String getTeacherid()
    {
        return teacherid;
    }
    public void setPaperid(Long paperid)
    {
        this.paperid = paperid;
    }

    public Long getPaperid()
    {
        return paperid;
    }
    public void setQuestionid(Long questionid)
    {
        this.questionid = questionid;
    }

    public Long getQuestionid()
    {
        return questionid;
    }
    public void setOptionid(Long optionid)
    {
        this.optionid = optionid;
    }

    public Long getOptionid()
    {
        return optionid;
    }
    public void setQuestion(String question)
    {
        this.question = question;
    }

    public String getQuestion()
    {
        return question;
    }
    public void setAnswer(String answer)
    {
        this.answer = answer;
    }

    public String getAnswer()
    {
        return answer;
    }
    public void setCorrectAnswerStatus(String correctAnswerStatus)
    {
        this.correctAnswerStatus = correctAnswerStatus;
    }

    public String getCorrectAnswerStatus()
    {
        return correctAnswerStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("homeworkid", getHomeworkid())
                .append("studentId", getStudentId())
                .append("studentName", getStudentName())
                .append("stucalssid", getStucalssid())
                .append("teacherid", getTeacherid())
                .append("paperid", getPaperid())
                .append("questionid", getQuestionid())
                .append("optionid", getOptionid())
                .append("question", getQuestion())
                .append("answer", getAnswer())
                .append("correctAnswerStatus", getCorrectAnswerStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}