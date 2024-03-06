package com.ruoyi.project.homework.paper.controller;

import java.util.List;

import com.ruoyi.common.utils.security.ShiroUtils;
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
import com.ruoyi.project.homework.paper.domain.Paper;
import com.ruoyi.project.homework.paper.service.IPaperService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 试卷管理Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-05-04
 */
@Controller
@RequestMapping("/homework/paper")
public class PaperController extends BaseController
{
    private String prefix = "homework/paper";

    private String sprefix = "homework/questionbank";

    @Autowired
    private IPaperService paperService;

    @RequiresPermissions("homework:paper:view")
    @GetMapping()
    public String paper()
    {
        return prefix + "/paper";
    }

    /**
     * 查询试卷管理列表
     */
    @RequiresPermissions("homework:paper:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Paper paper)
    {
        paper.setCreateBy(ShiroUtils.getSysUser().getLoginName());
        startPage();
        List<Paper> list = paperService.selectPaperList(paper);
        return getDataTable(list);
    }

    /**
     * 导出试卷管理列表
     */
    @RequiresPermissions("homework:paper:export")
    @Log(title = "试卷管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Paper paper)
    {
        List<Paper> list = paperService.selectPaperList(paper);
        ExcelUtil<Paper> util = new ExcelUtil<Paper>(Paper.class);
        return util.exportExcel(list, "试卷管理数据");
    }

    /**
     * 新增试卷管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }


    /**
     * 添加到题库管理越慢
     */
    @GetMapping("/addToQuestionBank/{paperId}")
    public String addToQuestionBank(@PathVariable("paperId") Long paperId, ModelMap mmap)
    {
        mmap.put("paperId", paperId);
        return sprefix + "/questionbank";
    }

    /**
     * 新增保存试卷管理
     */
    @RequiresPermissions("homework:paper:add")
    @Log(title = "试卷管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Paper paper)
    {
        return toAjax(paperService.insertPaper(paper));
    }

    /**
     * 修改试卷管理
     */
    @RequiresPermissions("homework:paper:edit")
    @GetMapping("/edit/{paperid}")
    public String edit(@PathVariable("paperid") Long paperid, ModelMap mmap)
    {
        Paper paper = paperService.selectPaperByPaperid(paperid);
        mmap.put("paper", paper);
        return prefix + "/edit";
    }

    /**
     * 修改保存试卷管理
     */
    @RequiresPermissions("homework:paper:edit")
    @Log(title = "试卷管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Paper paper)
    {
        return toAjax(paperService.updatePaper(paper));
    }

    /**
     * 删除试卷管理
     */
    @RequiresPermissions("homework:paper:remove")
    @Log(title = "试卷管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(paperService.deletePaperByPaperids(ids));
    }
}
