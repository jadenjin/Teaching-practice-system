package com.ruoyi.project.homework.stumessages.controller;

import java.util.List;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.project.homework.stumessages.domain.GuestComments;
import com.ruoyi.project.homework.stumessages.service.IGuestCommentsService;
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
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 *
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
@Controller
@RequestMapping("/homework/comments")
public class GuestCommentsController extends BaseController
{
    private String prefix = "homework/comments";

    @Autowired
    private IGuestCommentsService guestCommentsService;

    @RequiresPermissions("homework:comments:view")
    @GetMapping()
    public String comments()
    {
        return prefix + "/comments";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("homework:comments:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(GuestComments guestComments)
    {
        startPage();
        List<GuestComments> list = guestCommentsService.selectGuestCommentsList(guestComments);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("homework:comments:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(GuestComments guestComments)
    {
        List<GuestComments> list = guestCommentsService.selectGuestCommentsList(guestComments);
        ExcelUtil<GuestComments> util = new ExcelUtil<GuestComments>(GuestComments.class);
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
    @RequiresPermissions("homework:comments:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(GuestComments guestComments)
    {
        return toAjax(guestCommentsService.insertGuestComments(guestComments));
    }

    /**
     * 修改【请填写功能名称】
     */
    @RequiresPermissions("homework:comments:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        GuestComments guestComments = guestCommentsService.selectGuestCommentsById(id);
        mmap.put("guestComments", guestComments);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("homework:comments:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(GuestComments guestComments)
    {
        return toAjax(guestCommentsService.updateGuestComments(guestComments));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("homework:comments:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(guestCommentsService.deleteGuestCommentsByIds(ids));
    }
}
