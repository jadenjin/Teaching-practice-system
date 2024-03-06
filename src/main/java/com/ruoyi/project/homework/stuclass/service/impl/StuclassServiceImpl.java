package com.ruoyi.project.homework.stuclass.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.stuclass.mapper.StuclassMapper;
import com.ruoyi.project.homework.stuclass.domain.Stuclass;
import com.ruoyi.project.homework.stuclass.service.IStuclassService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 班级管理Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-23
 */
@Service
public class StuclassServiceImpl implements IStuclassService 
{
    @Autowired
    private StuclassMapper stuclassMapper;

    /**
     * 查询班级管理
     * 
     * @param deptId 班级管理主键
     * @return 班级管理
     */
    @Override
    public Stuclass selectStuclassByDeptId(Long deptId)
    {
        return stuclassMapper.selectStuclassByDeptId(deptId);
    }

    /**
     * 查询班级管理列表
     * 
     * @param stuclass 班级管理
     * @return 班级管理
     */
    @Override
    public List<Stuclass> selectStuclassList(Stuclass stuclass)
    {
        return stuclassMapper.selectStuclassList(stuclass);
    }

    /**
     * 新增班级管理
     * 
     * @param stuclass 班级管理
     * @return 结果
     */
    @Override
    public int insertStuclass(Stuclass stuclass)
    {
        stuclass.setCreateTime(DateUtils.getNowDate());
        return stuclassMapper.insertStuclass(stuclass);
    }

    /**
     * 修改班级管理
     * 
     * @param stuclass 班级管理
     * @return 结果
     */
    @Override
    public int updateStuclass(Stuclass stuclass)
    {
        stuclass.setUpdateTime(DateUtils.getNowDate());
        return stuclassMapper.updateStuclass(stuclass);
    }

    /**
     * 批量删除班级管理
     * 
     * @param deptIds 需要删除的班级管理主键
     * @return 结果
     */
    @Override
    public int deleteStuclassByDeptIds(String deptIds)
    {
        return stuclassMapper.deleteStuclassByDeptIds(Convert.toStrArray(deptIds));
    }

    /**
     * 删除班级管理信息
     * 
     * @param deptId 班级管理主键
     * @return 结果
     */
    @Override
    public int deleteStuclassByDeptId(Long deptId)
    {
        return stuclassMapper.deleteStuclassByDeptId(deptId);
    }

    @Override
    public List<Stuclass> selectDeptByDeptType(String deptype) {
        return stuclassMapper.selectDeptByDeptType(deptype);
    }

}
