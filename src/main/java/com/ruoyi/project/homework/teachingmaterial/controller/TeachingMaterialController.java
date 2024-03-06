package com.ruoyi.project.homework.teachingmaterial.controller;

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
import com.ruoyi.project.homework.teachingmaterial.domain.TeachingMaterial;
import com.ruoyi.project.homework.teachingmaterial.service.ITeachingMaterialService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 教学资料Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Controller
@RequestMapping("/homework/teachingmaterial")
public class TeachingMaterialController extends BaseController
{
    private String prefix = "homework/teachingmaterial";

    @Autowired
    private ITeachingMaterialService teachingMaterialService;

    @RequiresPermissions("homework:teachingmaterial:view")
    @GetMapping()
    public String teachingmaterial()
    {
        return prefix + "/teachingmaterial";
    }

    /**
     * 查询教学资料列表
     */
    @RequiresPermissions("homework:teachingmaterial:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TeachingMaterial teachingMaterial)
    {
        startPage();
        List<TeachingMaterial> list = teachingMaterialService.selectTeachingMaterialList(teachingMaterial);
        return getDataTable(list);
    }

    /**
     * 导出教学资料列表
     */
    @RequiresPermissions("homework:teachingmaterial:export")
    @Log(title = "教学资料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TeachingMaterial teachingMaterial)
    {
        List<TeachingMaterial> list = teachingMaterialService.selectTeachingMaterialList(teachingMaterial);
        ExcelUtil<TeachingMaterial> util = new ExcelUtil<TeachingMaterial>(TeachingMaterial.class);
        return util.exportExcel(list, "教学资料数据");
    }

    /**
     * 新增教学资料
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存教学资料
     */
    @RequiresPermissions("homework:teachingmaterial:add")
    @Log(title = "教学资料", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TeachingMaterial teachingMaterial)
    {
        return toAjax(teachingMaterialService.insertTeachingMaterial(teachingMaterial));
    }

    /**
     * 修改教学资料
     */
    @RequiresPermissions("homework:teachingmaterial:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TeachingMaterial teachingMaterial = teachingMaterialService.selectTeachingMaterialById(id);
        mmap.put("teachingMaterial", teachingMaterial);
        return prefix + "/edit";
    }

    /**
     * 修改保存教学资料
     */
    @RequiresPermissions("homework:teachingmaterial:edit")
    @Log(title = "教学资料", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TeachingMaterial teachingMaterial)
    {
        return toAjax(teachingMaterialService.updateTeachingMaterial(teachingMaterial));
    }

    /**
     * 删除教学资料
     */
    @RequiresPermissions("homework:teachingmaterial:remove")
    @Log(title = "教学资料", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(teachingMaterialService.deleteTeachingMaterialByIds(ids));
    }

    /**
     * 教学资料详情
     */
    @RequiresPermissions("homework:teachingmaterial:detail")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        TeachingMaterial teachingMaterial = teachingMaterialService.selectTeachingMaterialById(id);
        mmap.put("material", teachingMaterial);
        return prefix + "/detail";
    }
}
