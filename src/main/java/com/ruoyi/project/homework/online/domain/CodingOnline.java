package com.ruoyi.project.homework.online.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * coding_online对象 coding_online
 * 
 * @author JadenChen QQ2955104590
 * @date 2024-03-03
 */
public class CodingOnline extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 代码 */
    @Excel(name = "代码")
    private String coding;

    /** 结果 */
    @Excel(name = "结果")
    private String result;

    /**  */
    private Long id;

    public void setCoding(String coding)
    {
        this.coding = coding;
    }

    public String getCoding()
    {
        return coding;
    }
    public void setResult(String result)
    {
        this.result = result;
    }

    public String getResult()
    {
        return result;
    }
    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("coding", getCoding())
            .append("result", getResult())
            .append("id", getId())
            .toString();
    }
}
