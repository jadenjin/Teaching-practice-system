package com.ruoyi.project.homework.paper.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 试卷管理对象 stu_paper
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-04
 */
public class Paper extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 试卷ID */
    private Long paperid;

    /** 试卷标题 */
    @Excel(name = "试卷标题")
    private String paperTitle;

    /** 试卷类型 */
    @Excel(name = "试卷类型")
    private Integer paperType;

    /** 试卷来源 */
    @Excel(name = "试卷来源")
    private String paperResources;

    /** 状态 */
    @Excel(name = "状态")
    private Integer state;

    public void setPaperid(Long paperid)
    {
        this.paperid = paperid;
    }

    public Long getPaperid()
    {
        return paperid;
    }
    public void setPaperTitle(String paperTitle)
    {
        this.paperTitle = paperTitle;
    }

    public String getPaperTitle()
    {
        return paperTitle;
    }
    public void setPaperType(Integer paperType)
    {
        this.paperType = paperType;
    }

    public Integer getPaperType()
    {
        return paperType;
    }
    public void setPaperResources(String paperResources)
    {
        this.paperResources = paperResources;
    }

    public String getPaperResources()
    {
        return paperResources;
    }
    public void setState(Integer state)
    {
        this.state = state;
    }

    public Integer getState()
    {
        return state;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("paperid", getPaperid())
            .append("paperTitle", getPaperTitle())
            .append("paperType", getPaperType())
            .append("paperResources", getPaperResources())
            .append("state", getState())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
