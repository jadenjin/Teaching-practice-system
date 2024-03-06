package com.ruoyi.project.homework.questionbank.controller;

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
import com.ruoyi.project.homework.questionbank.domain.QuestionBank;
import com.ruoyi.project.homework.questionbank.service.IQuestionBankService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 题目管理Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-05
 */
@Controller
@RequestMapping("/homework/questionbank")
public class QuestionBankController extends BaseController
{
    private String prefix = "homework/questionbank";

    @Autowired
    private IQuestionBankService questionBankService;

    @RequiresPermissions("homework:questionbank:view")
    @GetMapping()
    public String questionbank()
    {
        return prefix + "/questionbank";
    }

    /**
     * 查询题目管理列表
     */
    @RequiresPermissions("homework:questionbank:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(QuestionBank questionBank)
    {
        startPage();
        List<QuestionBank> list = questionBankService.selectQuestionBankList(questionBank);
        return getDataTable(list);
    }

    /**
     * 导出题目管理列表
     */
    @RequiresPermissions("homework:questionbank:export")
    @Log(title = "题目管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(QuestionBank questionBank)
    {
        List<QuestionBank> list = questionBankService.selectQuestionBankList(questionBank);
        ExcelUtil<QuestionBank> util = new ExcelUtil<QuestionBank>(QuestionBank.class);
        return util.exportExcel(list, "题目管理数据");
    }

    /**
     * 新增题目管理
     */
    @GetMapping("/add/{paperid}")
    public String add(@PathVariable("paperid") Long paperid, ModelMap mmap)
    {
        mmap.put("paperid", paperid);
        return prefix + "/add";
    }

    /**
     * 新增保存题目管理
     */
    @RequiresPermissions("homework:questionbank:add")
    @Log(title = "题目管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(QuestionBank questionBank)
    {
        return toAjax(questionBankService.insertQuestionBank(questionBank));
    }

    /**
     * 修改题目管理
     */
    @RequiresPermissions("homework:questionbank:edit")
    @GetMapping("/edit/{questionid}")
    public String edit(@PathVariable("questionid") Long questionid, ModelMap mmap)
    {
        QuestionBank questionBank = questionBankService.selectQuestionBankByQuestionid(questionid);
        mmap.put("questionBank", questionBank);
        return prefix + "/edit";
    }

    /**
     * 修改保存题目管理
     */
    @RequiresPermissions("homework:questionbank:edit")
    @Log(title = "题目管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(QuestionBank questionBank)
    {
        return toAjax(questionBankService.updateQuestionBank(questionBank));
    }

    /**
     * 删除题目管理
     */
    @RequiresPermissions("homework:questionbank:remove")
    @Log(title = "题目管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(questionBankService.deleteQuestionBankByQuestionids(ids));
    }
}
