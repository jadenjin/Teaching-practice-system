package com.ruoyi.project.homework.course.controller;

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
import com.ruoyi.project.homework.course.domain.Course;
import com.ruoyi.project.homework.course.service.ICourseService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * courseController
 * 
 * @author LH
 * @date 2024-03-12
 */
@Controller
@RequestMapping("/homework/course")
public class CourseController extends BaseController
{
    private String prefix = "homework/course";

    @Autowired
    private ICourseService courseService;

    @RequiresPermissions("homework:course:view")
    @GetMapping()
    public String course()
    {
        return prefix + "/course";
    }

    /**
     * 查询course列表
     */
    @RequiresPermissions("homework:course:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Course course)
    {
        startPage();
        List<Course> list = courseService.selectCourseList(course);
        return getDataTable(list);
    }

    /**
     * 导出course列表
     */
    @RequiresPermissions("homework:course:export")
    @Log(title = "course", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Course course)
    {
        List<Course> list = courseService.selectCourseList(course);
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        return util.exportExcel(list, "course数据");
    }

    /**
     * 新增course
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存course
     */
    @RequiresPermissions("homework:course:add")
    @Log(title = "course", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Course course)
    {
        return toAjax(courseService.insertCourse(course));
    }

    /**
     * 修改course
     */
    @RequiresPermissions("homework:course:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Course course = courseService.selectCourseById(id);
        mmap.put("course", course);
        return prefix + "/edit";
    }

    /**
     * 修改保存course
     */
    @RequiresPermissions("homework:course:edit")
    @Log(title = "course", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Course course)
    {
        return toAjax(courseService.updateCourse(course));
    }

    /**
     * 删除course
     */
    @RequiresPermissions("homework:course:remove")
    @Log(title = "course", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(courseService.deleteCourseByIds(ids));
    }
}
