package com.ruoyi.project.homework.commentslike.controller;

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
import com.ruoyi.project.homework.commentslike.domain.CommentsLike;
import com.ruoyi.project.homework.commentslike.service.ICommentsLikeService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 点赞Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2023-01-27
 */
@Controller
@RequestMapping("/homework/commentslike")
public class CommentsLikeController extends BaseController
{
    private String prefix = "homework/commentslike";

    @Autowired
    private ICommentsLikeService commentsLikeService;

    @RequiresPermissions("homework:commentslike:view")
    @GetMapping()
    public String commentslike()
    {
        return prefix + "/commentslike";
    }

    /**
     * 查询点赞列表
     */
    @RequiresPermissions("homework:commentslike:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CommentsLike commentsLike)
    {
        startPage();
        List<CommentsLike> list = commentsLikeService.selectCommentsLikeList(commentsLike);
        return getDataTable(list);
    }

    /**
     * 导出点赞列表
     */
    @RequiresPermissions("homework:commentslike:export")
    @Log(title = "点赞", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CommentsLike commentsLike)
    {
        List<CommentsLike> list = commentsLikeService.selectCommentsLikeList(commentsLike);
        ExcelUtil<CommentsLike> util = new ExcelUtil<CommentsLike>(CommentsLike.class);
        return util.exportExcel(list, "点赞数据");
    }

    /**
     * 新增点赞
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存点赞
     */
    @RequiresPermissions("homework:commentslike:add")
    @Log(title = "点赞", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CommentsLike commentsLike)
    {
        return toAjax(commentsLikeService.insertCommentsLike(commentsLike));
    }

    /**
     * 修改点赞
     */
    @RequiresPermissions("homework:commentslike:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        CommentsLike commentsLike = commentsLikeService.selectCommentsLikeById(id);
        mmap.put("commentsLike", commentsLike);
        return prefix + "/edit";
    }

    /**
     * 修改保存点赞
     */
    @RequiresPermissions("homework:commentslike:edit")
    @Log(title = "点赞", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CommentsLike commentsLike)
    {
        return toAjax(commentsLikeService.updateCommentsLike(commentsLike));
    }

    /**
     * 删除点赞
     */
    @RequiresPermissions("homework:commentslike:remove")
    @Log(title = "点赞", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(commentsLikeService.deleteCommentsLikeByIds(ids));
    }
}
