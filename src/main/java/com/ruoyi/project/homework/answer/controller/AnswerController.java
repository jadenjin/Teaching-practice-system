package com.ruoyi.project.homework.answer.controller;

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
import com.ruoyi.project.homework.answer.domain.Answer;
import com.ruoyi.project.homework.answer.service.IAnswerService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-08
 */
@Controller
@RequestMapping("/homework/answer")
public class AnswerController extends BaseController
{
    private String prefix = "homework/answer";

    @Autowired
    private IAnswerService answerService;

    @RequiresPermissions("homework:answer:view")
    @GetMapping()
    public String answer()
    {
        return prefix + "/answer";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("homework:answer:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Answer answer)
    {
        startPage();
        List<Answer> list = answerService.selectAnswerList(answer);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("homework:answer:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Answer answer)
    {
        List<Answer> list = answerService.selectAnswerList(answer);
        ExcelUtil<Answer> util = new ExcelUtil<Answer>(Answer.class);
        return util.exportExcel(list, "【请填写功能名称】数据");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("homework:answer:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Answer answer)
    {
        return toAjax(answerService.insertAnswer(answer));
    }

    /**
     * 修改【请填写功能名称】
     */
    @RequiresPermissions("homework:answer:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Answer answer = answerService.selectAnswerById(id);
        mmap.put("answer", answer);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("homework:answer:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Answer answer)
    {
        return toAjax(answerService.updateAnswer(answer));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("homework:answer:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(answerService.deleteAnswerByIds(ids));
    }
}
