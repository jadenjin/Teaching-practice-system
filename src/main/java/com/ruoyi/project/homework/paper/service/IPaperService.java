package com.ruoyi.project.homework.paper.service;

import java.util.List;
import com.ruoyi.project.homework.paper.domain.Paper;

/**
 * 试卷管理Service接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-04
 */
public interface IPaperService 
{
    /**
     * 查询试卷管理
     * 
     * @param paperid 试卷管理主键
     * @return 试卷管理
     */
    public Paper selectPaperByPaperid(Long paperid);

    /**
     * 查询试卷管理列表
     * 
     * @param paper 试卷管理
     * @return 试卷管理集合
     */
    public List<Paper> selectPaperList(Paper paper);

    /**
     * 新增试卷管理
     * 
     * @param paper 试卷管理
     * @return 结果
     */
    public int insertPaper(Paper paper);

    /**
     * 修改试卷管理
     * 
     * @param paper 试卷管理
     * @return 结果
     */
    public int updatePaper(Paper paper);

    /**
     * 批量删除试卷管理
     * 
     * @param paperids 需要删除的试卷管理主键集合
     * @return 结果
     */
    public int deletePaperByPaperids(String paperids);

    /**
     * 删除试卷管理信息
     * 
     * @param paperid 试卷管理主键
     * @return 结果
     */
    public int deletePaperByPaperid(Long paperid);
}
