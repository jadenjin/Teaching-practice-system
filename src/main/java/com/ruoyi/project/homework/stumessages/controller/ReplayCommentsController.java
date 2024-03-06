package com.ruoyi.project.homework.stumessages.controller;

import java.util.List;

import com.ruoyi.project.homework.stumessages.domain.ReplayComments;
import com.ruoyi.project.homework.stumessages.service.IReplayCommentsService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 用户评论Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-25
 */
@Controller
@RequestMapping("/homework/test")
public class ReplayCommentsController extends BaseController
{
    private String prefix = "test/comments";

    @Autowired
    private IReplayCommentsService replayCommentsService;

    @RequiresPermissions("homework:comments:view")
    @GetMapping()
    public String comments()
    {
        return prefix + "/comments";
    }

    /**
     * 查询用户评论列表
     */
    @RequiresPermissions("homework:comments:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ReplayComments replayComments)
    {
        startPage();
        List<ReplayComments> list = replayCommentsService.selectReplayCommentsList(replayComments);
        return getDataTable(list);
    }

    /**
     * 导出用户评论列表
     */
    @RequiresPermissions("homework:comments:export")
    @Log(title = "用户评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ReplayComments replayComments)
    {
        List<ReplayComments> list = replayCommentsService.selectReplayCommentsList(replayComments);
        ExcelUtil<ReplayComments> util = new ExcelUtil<ReplayComments>(ReplayComments.class);
        return util.exportExcel(list, "用户评论数据");
    }

    /**
     * 新增用户评论
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户评论
     */
    @RequiresPermissions("homework:comments:add")
    @Log(title = "用户评论", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ReplayComments replayComments)
    {
        return toAjax(replayCommentsService.insertReplayComments(replayComments));
    }

    /**
     * 修改用户评论
     */
    @RequiresPermissions("homework:comments:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ReplayComments replayComments = replayCommentsService.selectReplayCommentsById(id);
        mmap.put("replayComments", replayComments);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户评论
     */
    @RequiresPermissions("homework:comments:edit")
    @Log(title = "用户评论", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ReplayComments replayComments)
    {
        return toAjax(replayCommentsService.updateReplayComments(replayComments));
    }

    /**
     * 删除用户评论
     */
    @RequiresPermissions("homework:comments:remove")
    @Log(title = "用户评论", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(replayCommentsService.deleteReplayCommentsByIds(ids));
    }
}
