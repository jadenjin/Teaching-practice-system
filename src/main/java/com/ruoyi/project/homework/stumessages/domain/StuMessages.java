package com.ruoyi.project.homework.stumessages.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 学生留言对象 stu_messages
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
public class StuMessages extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 留言人 */
    @Excel(name = "留言人")
    private String stuname;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String phone;

    /** 留言标题 */
    @Excel(name = "留言标题")
    private String title;

    /** 留言内容 */
    private String content;

    /** 附件 */
    private String material;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setStuname(String stuname)
    {
        this.stuname = stuname;
    }

    public String getStuname()
    {
        return stuname;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
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
    public void setMaterial(String material)
    {
        this.material = material;
    }

    public String getMaterial()
    {
        return material;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("stuname", getStuname())
            .append("phone", getPhone())
            .append("title", getTitle())
            .append("content", getContent())
            .append("material", getMaterial())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
