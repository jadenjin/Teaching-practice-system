package com.ruoyi.project.homework.myhomework.controller;

import java.util.Date;
import java.util.List;


import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.homework.answer.domain.Answer;
import com.ruoyi.project.homework.answer.service.IAnswerService;
import com.ruoyi.project.homework.leavehomework.domain.Leavehomework;
import com.ruoyi.project.homework.leavehomework.service.ILeavehomeworkService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.homework.myhomework.domain.HandInHomework;
import com.ruoyi.project.homework.myhomework.service.IHandInHomeworkService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 我的作业Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Controller
@RequestMapping("/homework/myhomework")
public class HandInHomeworkController extends BaseController
{
    private String prefix = "homework/myhomework";

    @Autowired
    private IHandInHomeworkService handInHomeworkService;

    @Autowired
    private ILeavehomeworkService iLeavehomeworkService;

    @Autowired
    private IAnswerService iAnswerService;

    @RequiresPermissions("homework:myhomework:view")
    @GetMapping()
    public String myhomework()
    {
        return prefix + "/myhomework";
    }

    /**
     * 查询我的作业列表
     */
    @RequiresPermissions("homework:myhomework:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HandInHomework handInHomework)
    {
        String loginName = ShiroUtils.getSysUser().getLoginName();//当前登录的用户账号
        Long deptId = ShiroUtils.getSysUser().getDeptId();//前当登录用户班级ID
        Long roleId = ShiroUtils.getSysUser().getRoles().get(0).getRoleId();//当前登录用户角色ID
        //学生的角色roleId == 4;//老师的角色roleId == 4
        if (roleId == 4){
            //提交作业的学生ID要等于当前登录学生登录账号
            handInHomework.setStudentId(String.valueOf(loginName));
        }else if (roleId == 3){
            //如果是老师角色只能查看自己班级和自己批改的作业
//            handInHomework.setClassId(String.valueOf(deptId));
            handInHomework.setTeacherrId(loginName);
        }
        startPage();
        List<HandInHomework> list = handInHomeworkService.selectHandInHomeworkList(handInHomework);
        return getDataTable(list);
    }

    /**
     * 导出我的作业列表
     */
    @RequiresPermissions("homework:myhomework:export")
    @Log(title = "我的作业", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HandInHomework handInHomework)
    {
        List<HandInHomework> list = handInHomeworkService.selectHandInHomeworkList(handInHomework);
        ExcelUtil<HandInHomework> util = new ExcelUtil<HandInHomework>(HandInHomework.class);
        return util.exportExcel(list, "我的作业数据");
    }

    /**
     * 新增我的作业
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存我的作业
     */
    @RequiresPermissions("homework:myhomework:add")
    @Log(title = "我的作业", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HandInHomework handInHomework)
    {

        return toAjax(handInHomeworkService.insertHandInHomework(handInHomework));
    }

    /**
     * 修改我的作业
     */
    @RequiresPermissions("homework:myhomework:edit")
    @GetMapping("/edit/{hid}")
    public String edit(@PathVariable("hid") Long hid, ModelMap mmap)
    {
        HandInHomework handInHomework = handInHomeworkService.selectHandInHomeworkByHid(hid);
        mmap.put("handInHomework", handInHomework);
            return prefix + "/edit";
    }

    /**
     * 修改保存我的作业
     */
    @RequiresPermissions("homework:myhomework:edit")
    @Log(title = "我的作业", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HandInHomework handInHomework)
    {
        return toAjax(handInHomeworkService.updateHandInHomework(handInHomework));
    }

    /**
     * 删除我的作业
     */
    @RequiresPermissions("homework:myhomework:remove")
    @Log(title = "我的作业", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String hids)
    {
        return toAjax(handInHomeworkService.deleteHandInHomeworkByHids(hids));
    }

    /**
     * 提交的作业--详情
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id,@RequestParam String homeworkid, ModelMap mmap)
    {
        String studentid = ShiroUtils.getSysUser().getLoginName();
        List<Answer>  answer = iAnswerService.selectAnswerByStudentId(Long.valueOf(homeworkid),studentid);
        HandInHomework handInHomework = handInHomeworkService.selectHandInHomeworkByHid(id);
        mmap.put("answer", answer);
        mmap.put("handInHomework", handInHomework);
        return prefix + "/detail";
    }

    /**
     * 查询作业是否已评分，已评分就不让再修改了！
     * @param hid
     * @return
     */
    @GetMapping("/checkHandInHomeWork")
    @ResponseBody
    public AjaxResult checkHandInHomeWork(@RequestParam Long hid){
        HandInHomework handInHomework = handInHomeworkService.selectHandInHomeworkByHid(hid);
        System.out.println(handInHomework.getState());
        if ("已批阅".equals(handInHomework.getState())){
            return AjaxResult.warn("作业已被批阅，不允许修改重复提交，若需要请与老师联系~");
        }else {
            return AjaxResult.success();
        }
    }
}
