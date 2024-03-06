package com.ruoyi.project.homework.leavehomework.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 发布作业对象 stu_leavehomework
 *
 * @author AbuCoder QQ932696181
 * @date 2022-04-11
 */
public class Leavehomework extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 教师id */
    @Excel(name = "教师id")
    private String teacherId;

    /** 教师姓名 */
    @Excel(name = "教师姓名")
    private String teacherName;

    /** 班级 */
    @Excel(name = "班级")
    private String stuclassId;

    /** 试卷ID */
    private Long paperid;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String stuclasSname;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String courseName;

    /** 作业标题 */
    @Excel(name = "作业标题")
    private String title;

    /** 作业内容 */
    @Excel(name = "作业内容")
    private String content;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "截止时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 附件 */
    @Excel(name = "附件")
    private String material;

    /** 状态(0开始，1结束) */
    @Excel(name = "状态(0开始，1结束)")
    private String status;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setTeacherId(String teacherId)
    {
        this.teacherId = teacherId;
    }

    public String getTeacherId()
    {
        return teacherId;
    }
    public void setTeacherName(String teacherName)
    {
        this.teacherName = teacherName;
    }

    public String getTeacherName()
    {
        return teacherName;
    }
    public void setStuclassId(String stuclassId)
    {
        this.stuclassId = stuclassId;
    }

    public String getStuclassId()
    {
        return stuclassId;
    }

    public void setPaperid(Long paperid)
    {
        this.paperid = paperid;
    }

    public Long getPaperid()
    {
        return paperid;
    }

    public void setStuclasSname(String stuclasSname)
    {
        this.stuclasSname = stuclasSname;
    }

    public String getStuclasSname()
    {
        return stuclasSname;
    }

    public void setCourseName(String courseName)
    {
        this.courseName = courseName;
    }

    public String getCourseName()
    {
        return courseName;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }
    public void setMaterial(String material)
    {
        this.material = material;
    }

    public String getMaterial()
    {
        return material;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("teacherId", getTeacherId())
                .append("teacherName", getTeacherName())
                .append("stuclassId", getStuclassId())
                .append("paperid", getPaperid())
                .append("stuclasSname", getStuclasSname())
                .append("courseName", getCourseName())
                .append("title", getTitle())
                .append("content", getContent())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .append("material", getMaterial())
                .append("remark", getRemark())
                .append("status", getStatus())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("createBy", getCreateBy())
                .append("updateBy", getUpdateBy())
                .toString();
    }
}