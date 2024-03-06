package com.ruoyi.project.homework.myhomework.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 我的作业对象 stu_hand_in_homework
 *
 * @author AbuCoder QQ932696181
 * @date 2022-04-11
 */
public class HandInHomework extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long hid;

    /** 学生id */
    private String studentId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 班级 */
    private String classId;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String stuclasSname;

    /** 教师id */
    private String teacherrId;

    /** 教师姓名 */
    @Excel(name = "教师姓名")
    private String teacherName;

    /** 作业id */
    private Long homeworkId;

    /** 试卷ID */
    private Long paperid;

    /** 课程名称 */
    private String courseName;

    /** 作业标题 */
    @Excel(name = "作业标题")
    private String homeworkTitle;
    
    /** 学生作答 */
    private String homeworkContent;

    /** 作业内容 */
    private String studentContent;

    /** 作业评分 */
    @Excel(name = "主观分")
    private BigDecimal homeworkScore;

    /** 客观分 */
    @Excel(name = "客观分")
    private BigDecimal radioscore;

    /** 作业总分 */
    @Excel(name = "作业总分")
    private BigDecimal allscores;

    /** 附件 */
    private String material;

    /** 作业状态 */
    private String state;

    /** 批阅人 */
    private String markMan;

    /** 批改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "批改时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date markTime;

    public void setHid(Long hid)
    {
        this.hid = hid;
    }

    public Long getHid()
    {
        return hid;
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
    public void setClassId(String classId)
    {
        this.classId = classId;
    }

    public String getClassId()
    {
        return classId;
    }
    public void setStuclasSname(String stuclasSname)
    {
        this.stuclasSname = stuclasSname;
    }

    public String getStuclasSname()
    {
        return stuclasSname;
    }
    public void setTeacherrId(String teacherrId)
    {
        this.teacherrId = teacherrId;
    }

    public String getTeacherrId()
    {
        return teacherrId;
    }
    public void setTeacherName(String teacherName)
    {
        this.teacherName = teacherName;
    }

    public String getTeacherName()
    {
        return teacherName;
    }
    public void setHomeworkId(Long homeworkId)
    {
        this.homeworkId = homeworkId;
    }

    public Long getHomeworkId()
    {
        return homeworkId;
    }
    public void setPaperid(Long paperid)
    {
        this.paperid = paperid;
    }

    public Long getPaperid()
    {
        return paperid;
    }
    public void setCourseName(String courseName)
    {
        this.courseName = courseName;
    }

    public String getCourseName()
    {
        return courseName;
    }
    public void setHomeworkTitle(String homeworkTitle)
    {
        this.homeworkTitle = homeworkTitle;
    }

    public String getHomeworkTitle()
    {
        return homeworkTitle;
    }
    public void setStudentContent(String studentContent)
    {
        this.studentContent = studentContent;
    }

    public String getStudentContent()
    {
        return studentContent;
    }
    public void setHomeworkContent(String homeworkContent)
    {
        this.homeworkContent = homeworkContent;
    }

    public String getHomeworkContent()
    {
        return homeworkContent;
    }
    public void setHomeworkScore(BigDecimal homeworkScore)
    {
        this.homeworkScore = homeworkScore;
    }

    public BigDecimal getHomeworkScore()
    {
        return homeworkScore;
    }
    public void setAllscores(BigDecimal allscores)
    {
        this.allscores = allscores;
    }

    public BigDecimal getAllscores()
    {
        return allscores;
    }
    public void setMaterial(String material)
    {
        this.material = material;
    }

    public String getMaterial()
    {
        return material;
    }
    public void setState(String state)
    {
        this.state = state;
    }

    public String getState()
    {
        return state;
    }
    public void setMarkMan(String markMan)
    {
        this.markMan = markMan;
    }

    public String getMarkMan()
    {
        return markMan;
    }
    public void setMarkTime(Date markTime)
    {
        this.markTime = markTime;
    }

    public Date getMarkTime()
    {
        return markTime;
    }
    public void setRadioscore(BigDecimal radioscore)
    {
        this.radioscore = radioscore;
    }

    public BigDecimal getRadioscore()
    {
        return radioscore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("hid", getHid())
                .append("studentId", getStudentId())
                .append("studentName", getStudentName())
                .append("classId", getClassId())
                .append("stuclasSname", getStuclasSname())
                .append("teacherrId", getTeacherrId())
                .append("teacherName", getTeacherName())
                .append("homeworkId", getHomeworkId())
                .append("paperid", getPaperid())
                .append("courseName", getCourseName())
                .append("homeworkTitle", getHomeworkTitle())
                .append("studentContent", getStudentContent())
                .append("homeworkContent", getHomeworkContent())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("homeworkScore", getHomeworkScore())
                .append("allscores", getAllscores())
                .append("material", getMaterial())
                .append("createBy", getCreateBy())
                .append("updateBy", getUpdateBy())
                .append("state", getState())
                .append("markMan", getMarkMan())
                .append("markTime", getMarkTime())
                .append("remark", getRemark())
                .append("radioscore", getRadioscore())
                .toString();
    }
}