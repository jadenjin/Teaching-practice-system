package com.ruoyi.project.homework.online.controller;

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
import com.ruoyi.project.homework.online.domain.CodingOnline;
import com.ruoyi.project.homework.online.service.ICodingOnlineService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * coding_onlineController
 * 
 * @author JadenChen QQ2955104590
 * @date 2024-03-03
 */
@Controller
@RequestMapping("/homework/online")
public class CodingOnlineController extends BaseController {
    private String prefix = "homework/online";

    @Autowired
    private ICodingOnlineService codingOnlineService;

    @RequiresPermissions("homework:online:view")
    @GetMapping()
    public String online() {
        return prefix + "/online";
    }

    /**
     * 查询coding_online列表
     */
    @RequiresPermissions("homework:online:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CodingOnline codingOnline) {
        startPage();
        List<CodingOnline> list = codingOnlineService.selectCodingOnlineList(codingOnline);
        return getDataTable(list);
    }

    /**
     * 导出coding_online列表
     */
    @RequiresPermissions("homework:online:export")
    @Log(title = "coding_online", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CodingOnline codingOnline) {
        List<CodingOnline> list = codingOnlineService.selectCodingOnlineList(codingOnline);
        ExcelUtil<CodingOnline> util = new ExcelUtil<CodingOnline>(CodingOnline.class);
        return util.exportExcel(list, "coding_online数据");
    }

    /**
     * 新增coding_online
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存coding_online
     */
    @RequiresPermissions("homework:online:add")
    @Log(title = "coding_online", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CodingOnline codingOnline) {
        return toAjax(codingOnlineService.insertCodingOnline(codingOnline));
    }

    /**
     * 修改coding_online
     */
    @RequiresPermissions("homework:online:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        CodingOnline codingOnline = codingOnlineService.selectCodingOnlineById(id);
        mmap.put("codingOnline", codingOnline);
        return prefix + "/edit";
    }

    /**
     * 修改保存coding_online
     */
    @RequiresPermissions("homework:online:edit")
    @Log(title = "coding_online", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CodingOnline codingOnline) {
        return toAjax(codingOnlineService.updateCodingOnline(codingOnline));
    }

    /**
     * 删除coding_online
     */
    @RequiresPermissions("homework:online:remove")
    @Log(title = "coding_online", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(codingOnlineService.deleteCodingOnlineByIds(ids));
    }

    /**
     * 在线编译代码
     */
    @RequiresPermissions("homework:online:view")
    @PostMapping("/code")
    @ResponseBody
    public String codeOnline(String code) {
        return codingOnlineService.codeOnline(code);
    }
}
