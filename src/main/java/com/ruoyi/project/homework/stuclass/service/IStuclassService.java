package com.ruoyi.project.homework.stuclass.service;

import java.util.List;
import com.ruoyi.project.homework.stuclass.domain.Stuclass;
import com.ruoyi.project.system.dept.domain.Dept;

/**
 * 班级管理Service接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-23
 */
public interface IStuclassService 
{
    /**
     * 查询班级管理
     * 
     * @param deptId 班级管理主键
     * @return 班级管理
     */
    public Stuclass selectStuclassByDeptId(Long deptId);

    /**
     * 查询班级管理列表
     * 
     * @param stuclass 班级管理
     * @return 班级管理集合
     */
    public List<Stuclass> selectStuclassList(Stuclass stuclass);

    /**
     * 新增班级管理
     * 
     * @param stuclass 班级管理
     * @return 结果
     */
    public int insertStuclass(Stuclass stuclass);

    /**
     * 修改班级管理
     * 
     * @param stuclass 班级管理
     * @return 结果
     */
    public int updateStuclass(Stuclass stuclass);

    /**
     * 批量删除班级管理
     * 
     * @param deptIds 需要删除的班级管理主键集合
     * @return 结果
     */
    public int deleteStuclassByDeptIds(String deptIds);

    /**
     * 删除班级管理信息
     * 
     * @param deptId 班级管理主键
     * @return 结果
     */
    public int deleteStuclassByDeptId(Long deptId);

    public List<Stuclass> selectDeptByDeptType(String deptype);
}
