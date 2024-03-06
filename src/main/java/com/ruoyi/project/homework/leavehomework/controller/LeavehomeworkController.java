package com.ruoyi.project.homework.leavehomework.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.homework.answer.domain.Answer;
import com.ruoyi.project.homework.answer.service.IAnswerService;
import com.ruoyi.project.homework.leavehomework.domain.ExportParams;
import com.ruoyi.project.homework.leavehomework.domain.HandinHomweokVo;
import com.ruoyi.project.homework.leavehomework.domain.ScoreStage;
import com.ruoyi.project.homework.myhomework.domain.HandInHomework;
import com.ruoyi.project.homework.myhomework.service.IHandInHomeworkService;
import com.ruoyi.project.homework.stuclass.domain.Stuclass;
import com.ruoyi.project.homework.stuclass.service.IStuclassService;
import com.ruoyi.project.system.dept.domain.Dept;
import com.ruoyi.project.system.dept.service.IDeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.homework.leavehomework.domain.Leavehomework;
import com.ruoyi.project.homework.leavehomework.service.ILeavehomeworkService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 发布作业Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Controller
@RequestMapping("/homework/leavehomework")
public class LeavehomeworkController extends BaseController
{
    private String prefix = "homework/leavehomework";

    @Autowired
    private ILeavehomeworkService leavehomeworkService;

    @Autowired
    private IStuclassService stuclassService;

    @Autowired
    private IHandInHomeworkService iHandInHomeworkService;

    @Autowired
    private IAnswerService iAnswerService;

    @RequiresPermissions("homework:leavehomework:view")
    @GetMapping()
    public String leavehomework()
    {
        return prefix + "/leavehomework";
    }

    /**
     * 查询发布作业列表
     */
    @RequiresPermissions("homework:leavehomework:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Leavehomework leavehomework)
    {
        String loginName = ShiroUtils.getLoginName();//当前用户登录名
        Long deptId = ShiroUtils.getSysUser().getDeptId();//当前登录人部门ID
        Long roleId = ShiroUtils.getSysUser().getRoles().get(0).getRoleId();//当前登录人角色ID
        //本系统教师角色roleId == 3
        if (roleId == 3){
            //如果是老师角色只显示当前老师操作的数据
//            leavehomework.setStuclassId(String.valueOf(deptId));
            leavehomework.setTeacherId(String.valueOf(loginName));
        }else if (roleId == 4){
            //如果是学生角色只显示当前班级的作业--通过班级ID
            leavehomework.setStuclassId(String.valueOf(deptId));
        }
        startPage();
        List<Leavehomework> list = leavehomeworkService.selectLeavehomeworkList(leavehomework);
        return getDataTable(list);
    }

    /**
     * 导出发布作业列表
     */
    @Log(title = "导出作业", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ExportParams exportParams)
    {
        System.out.println(exportParams);
        List<HandInHomework> list = iHandInHomeworkService.selectHandInHomeworkByHomeworkid(exportParams.getHid());
//        System.out.println("list:"+list);
        ExcelUtil<HandInHomework> util = new ExcelUtil<HandInHomework>(HandInHomework.class);
        return util.exportExcel(list, "学生作业数据");
    }



    /**
     * 新增发布作业
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存发布作业
     */
    @RequiresPermissions("homework:leavehomework:add")
    @Log(title = "发布作业", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Leavehomework leavehomework)
    {
        return toAjax(leavehomeworkService.insertLeavehomework(leavehomework));
    }

    /**
     * 修改发布作业
     */
    @RequiresPermissions("homework:leavehomework:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(id);
        mmap.put("leavehomework", leavehomework);
        return prefix + "/edit";
    }

    /**
     * 修改保存发布作业
     */
    @RequiresPermissions("homework:leavehomework:edit")
    @Log(title = "发布作业", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Leavehomework leavehomework)
    {
        return toAjax(leavehomeworkService.updateLeavehomework(leavehomework));
    }

    /**
     * 删除发布作业
     */
    @RequiresPermissions("homework:leavehomework:remove")
    @Log(title = "发布作业", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(leavehomeworkService.deleteLeavehomeworkByIds(ids));
    }

    /**
     * 作业详情
     * @param id
     * @param mmap
     * @return
     */
    @RequiresPermissions("homework:leavehomework:detail")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(id);
        mmap.put("leavehomework", leavehomework);
        return prefix + "/detail";
    }
    //获取部门信息
    @GetMapping("/getClassInfo")
    @ResponseBody
    public AjaxResult getDept(ModelMap mmap)
    {
        String deptype = "班级";
        List<Stuclass> stuclasses = stuclassService.selectDeptByDeptType(deptype);
        return AjaxResult.success(stuclasses);
    }

    /**
     * 发布统计
     * @param id
     * @param mmap
     * @return
     */
    @GetMapping("/reportAll/{id}")
    public String reportAll(@PathVariable("id") Long id, ModelMap mmap)
    {
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(id);
        String hid = leavehomework.getStuclassId();
        //通过班级ID和作业ID查询未完成作业的学生
        List<HandinHomweokVo> handinHomweokVos = leavehomeworkService.selectNotHaninHomeworkStuinfo(id, hid);
        //通过班级ID查询这个班级的所有学生数量
        int allnum = leavehomeworkService.selectLeavehomeworkByClassID(hid);
        //未完成作业学生的数量
        int notinnum = leavehomeworkService.selectLeavehomeworkByClassIDAndID(id, hid);
        mmap.put("handinHomweokVos", handinHomweokVos);
        mmap.put("allnum", allnum);
        mmap.put("notinnum", notinnum);
        mmap.put("isnum", allnum-notinnum);
        mmap.put("hid", id);
        System.out.println("handinHomweokVos："+handinHomweokVos);
        return prefix + "/reporhomework";
    }

    /**
     * 作业分数统计
     * @param id
     * @return
     */
    @GetMapping("/reportScore")
    @ResponseBody
    public AjaxResult reportScore(@RequestParam(name = "id") String id){
        System.out.println("id:"+id);
        ScoreStage scoreStage = leavehomeworkService.selectLeavehomeworkScoreById(id);
        System.out.println("scoreStage："+scoreStage);
        List list = new ArrayList();
        list.add(scoreStage.getE());
        list.add(scoreStage.getD());
        list.add(scoreStage.getC());
        list.add(scoreStage.getB());
        list.add(scoreStage.getA());
        HashMap scores = new HashMap();
        scores.put("num",list);
        System.out.println("scores："+scores);
        return AjaxResult.success(scores);
    }

    /**
     * 选择试卷
     * @return 试卷列表
     */
    @GetMapping("/addpaper")
    public String addPaper(){return prefix + "/addpaper";};
}
