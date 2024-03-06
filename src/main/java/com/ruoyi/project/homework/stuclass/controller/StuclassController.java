package com.ruoyi.project.homework.stuclass.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.homework.stuclass.domain.Stuclass;
import com.ruoyi.project.homework.stuclass.service.IStuclassService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 班级管理Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-23
 */
@Controller
@RequestMapping("/homework/stuclass")
public class StuclassController extends BaseController
{
    private String prefix = "homework/stuclass";

    @Autowired
    private IStuclassService stuclassService;

    @RequiresPermissions("homework:stuclass:view")
    @GetMapping()
    public String stuclass()
    {
        return prefix + "/stuclass";
    }

    /**
     * 查询班级管理列表
     */
    @RequiresPermissions("homework:stuclass:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Stuclass stuclass)
    {
        startPage();
        List<Stuclass> list = stuclassService.selectStuclassList(stuclass);
        return getDataTable(list);
    }

    /**
     * 导出班级管理列表
     */
    @RequiresPermissions("homework:stuclass:export")
    @Log(title = "班级管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Stuclass stuclass)
    {
        List<Stuclass> list = stuclassService.selectStuclassList(stuclass);
        ExcelUtil<Stuclass> util = new ExcelUtil<Stuclass>(Stuclass.class);
        return util.exportExcel(list, "班级管理数据");
    }

    /**
     * 新增班级管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存班级管理
     */
    @RequiresPermissions("homework:stuclass:add")
    @Log(title = "班级管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Stuclass stuclass)
    {
        return toAjax(stuclassService.insertStuclass(stuclass));
    }

    /**
     * 修改班级管理
     */
    @RequiresPermissions("homework:stuclass:edit")
    @GetMapping("/edit/{deptId}")
    public String edit(@PathVariable("deptId") Long deptId, ModelMap mmap)
    {
        Stuclass stuclass = stuclassService.selectStuclassByDeptId(deptId);
        mmap.put("stuclass", stuclass);
        return prefix + "/edit";
    }

    /**
     * 修改保存班级管理
     */
    @RequiresPermissions("homework:stuclass:edit")
    @Log(title = "班级管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Stuclass stuclass)
    {
        return toAjax(stuclassService.updateStuclass(stuclass));
    }

    /**
     * 删除班级管理
     */
    @RequiresPermissions("homework:stuclass:remove")
    @Log(title = "班级管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(stuclassService.deleteStuclassByDeptIds(ids));
    }
}
