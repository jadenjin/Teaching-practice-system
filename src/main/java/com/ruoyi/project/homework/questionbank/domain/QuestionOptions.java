package com.ruoyi.project.homework.questionbank.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 选项管理对象 stu_question_options
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-05
 */
public class QuestionOptions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 选项编号 */
    private Long optionId;

    /** 题目编号 */
    @Excel(name = "题目编号")
    private Long qid;

    /** 选项内容 */
    @Excel(name = "选项内容")
    private String optionContent;

    /** 选项标识符（ABCDE） */
    @Excel(name = "选项标识符", readConverterExp = "A=BCDE")
    private String optionTag;

    /** 正确答案状态（0：正确、1：错误） */
    @Excel(name = "正确答案状态", readConverterExp = "0=：正确、1：错误")
    private String correctAnswerStatus;

    public void setOptionId(Long optionId) 
    {
        this.optionId = optionId;
    }

    public Long getOptionId() 
    {
        return optionId;
    }
    public void setQid(Long qid) 
    {
        this.qid = qid;
    }

    public Long getQid() 
    {
        return qid;
    }
    public void setOptionContent(String optionContent) 
    {
        this.optionContent = optionContent;
    }

    public String getOptionContent() 
    {
        return optionContent;
    }
    public void setOptionTag(String optionTag) 
    {
        this.optionTag = optionTag;
    }

    public String getOptionTag() 
    {
        return optionTag;
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
            .append("optionId", getOptionId())
            .append("qid", getQid())
            .append("optionContent", getOptionContent())
            .append("optionTag", getOptionTag())
            .append("correctAnswerStatus", getCorrectAnswerStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
