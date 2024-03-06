package com.ruoyi.project.homework.paper.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.paper.mapper.PaperMapper;
import com.ruoyi.project.homework.paper.domain.Paper;
import com.ruoyi.project.homework.paper.service.IPaperService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 试卷管理Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-04
 */
@Service
public class PaperServiceImpl implements IPaperService 
{
    @Autowired
    private PaperMapper paperMapper;

    /**
     * 查询试卷管理
     * 
     * @param paperid 试卷管理主键
     * @return 试卷管理
     */
    @Override
    public Paper selectPaperByPaperid(Long paperid)
    {
        return paperMapper.selectPaperByPaperid(paperid);
    }

    /**
     * 查询试卷管理列表
     * 
     * @param paper 试卷管理
     * @return 试卷管理
     */
    @Override
    public List<Paper> selectPaperList(Paper paper)
    {
        return paperMapper.selectPaperList(paper);
    }

    /**
     * 新增试卷管理
     * 
     * @param paper 试卷管理
     * @return 结果
     */
    @Override
    public int insertPaper(Paper paper)
    {
        paper.setCreateTime(DateUtils.getNowDate());
        paper.setCreateBy(ShiroUtils.getSysUser().getLoginName());
        return paperMapper.insertPaper(paper);
    }

    /**
     * 修改试卷管理
     * 
     * @param paper 试卷管理
     * @return 结果
     */
    @Override
    public int updatePaper(Paper paper)
    {
        paper.setUpdateTime(DateUtils.getNowDate());
        paper.setUpdateBy(ShiroUtils.getSysUser().getLoginName());
        return paperMapper.updatePaper(paper);
    }

    /**
     * 批量删除试卷管理
     * 
     * @param paperids 需要删除的试卷管理主键
     * @return 结果
     */
    @Override
    public int deletePaperByPaperids(String paperids)
    {
        return paperMapper.deletePaperByPaperids(Convert.toStrArray(paperids));
    }

    /**
     * 删除试卷管理信息
     * 
     * @param paperid 试卷管理主键
     * @return 结果
     */
    @Override
    public int deletePaperByPaperid(Long paperid)
    {
        return paperMapper.deletePaperByPaperid(paperid);
    }
}
