package com.ruoyi.project.homework.course.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * course对象 course
 * 
 * @author LH
 * @date 2024-03-12
 */
public class Course extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String courseName;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date timeBegin;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date timeEnd;

    /** 任课教师 */
    @Excel(name = "任课教师")
    private String teacher;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCourseName(String courseName)
    {
        this.courseName = courseName;
    }

    public String getCourseName()
    {
        return courseName;
    }
    public void setTimeBegin(Date timeBegin)
    {
        this.timeBegin = timeBegin;
    }

    public Date getTimeBegin()
    {
        return timeBegin;
    }
    public void setTimeEnd(Date timeEnd)
    {
        this.timeEnd = timeEnd;
    }

    public Date getTimeEnd()
    {
        return timeEnd;
    }
    public void setTeacher(String teacher)
    {
        this.teacher = teacher;
    }

    public String getTeacher()
    {
        return teacher;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("courseName", getCourseName())
            .append("timeBegin", getTimeBegin())
            .append("timeEnd", getTimeEnd())
            .append("teacher", getTeacher())
            .toString();
    }
}
