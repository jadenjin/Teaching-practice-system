package com.ruoyi.project.homework.stumessages.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.homework.commentslike.domain.CommentsLike;
import com.ruoyi.project.homework.commentslike.service.ICommentsLikeService;
import com.ruoyi.project.homework.stumessages.domain.GuestComments;
import com.ruoyi.project.homework.stumessages.domain.ReplayComments;
import com.ruoyi.project.homework.stumessages.service.IGuestCommentsService;
import com.ruoyi.project.homework.stumessages.service.IReplayCommentsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.homework.stumessages.domain.StuMessages;
import com.ruoyi.project.homework.stumessages.service.IStuMessagesService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 学生留言Controller
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Controller
@RequestMapping("/homework/stumessages")
public class StuMessagesController extends BaseController {
    private String prefix = "homework/stumessages";

    @Autowired
    private IStuMessagesService stuMessagesService;

    @Autowired
    private IGuestCommentsService guestCommentsService;

    @Autowired
    private IReplayCommentsService replayCommentsService;

    @Autowired
    private ICommentsLikeService commentsLikeService;


    @RequiresPermissions("homework:stumessages:view")
    @GetMapping()
    public String stumessages() {
        return prefix + "/stumessages";
    }

    /**
     * 查询学生留言列表
     */
    @RequiresPermissions("homework:stumessages:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(StuMessages stuMessages) {
        startPage();
        List<StuMessages> list = stuMessagesService.selectStuMessagesList(stuMessages);
        return getDataTable(list);
    }

    /**
     * 导出学生留言列表
     */
    @RequiresPermissions("homework:stumessages:export")
    @Log(title = "学生留言", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(StuMessages stuMessages) {
        List<StuMessages> list = stuMessagesService.selectStuMessagesList(stuMessages);
        ExcelUtil<StuMessages> util = new ExcelUtil<StuMessages>(StuMessages.class);
        return util.exportExcel(list, "学生留言数据");
    }

    /**
     * 新增学生留言
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存学生留言
     */
    @RequiresPermissions("homework:stumessages:add")
    @Log(title = "学生留言", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(StuMessages stuMessages) {
        return toAjax(stuMessagesService.insertStuMessages(stuMessages));
    }

    /**
     * 修改学生留言
     */
    @RequiresPermissions("homework:stumessages:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        StuMessages stuMessages = stuMessagesService.selectStuMessagesById(id);
        mmap.put("stuMessages", stuMessages);
        return prefix + "/edit";
    }

    /**
     * 修改保存学生留言
     */
    @RequiresPermissions("homework:stumessages:edit")
    @Log(title = "学生留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(StuMessages stuMessages) {
        return toAjax(stuMessagesService.updateStuMessages(stuMessages));
    }

    /**
     * 删除学生留言
     */
    @RequiresPermissions("homework:stumessages:remove")
    @Log(title = "学生留言", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(stuMessagesService.deleteStuMessagesByIds(ids));
    }

    /**
     * 留言信息详情
     */
    @RequiresPermissions("homework:stumessages:detail")
    @Log(title = "查看留言详情", businessType = BusinessType.OTHER)
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap) {
        StuMessages stuMessages = stuMessagesService.selectStuMessagesById(id);
        mmap.put("messages", stuMessages);
        mmap.put("id", id);
        return prefix + "/detail";
    }

    /**
     * 查询留言的评论集合
     *
     * @param id 留言ID
     * @return
     */
    @PostMapping("/getGuest")
    @ResponseBody
    public List<GuestComments> getGusetById(@RequestParam(value = "id", required = true) Long id) {
        return guestCommentsService.getGuestCommentsById(id);
    }

    /**
     * 评论
     * @param id 留言ID
     * @param content 评论内容
     * @param request 请求
     * @param response 请求
     * @return
     */
    @PostMapping("/addComments")
    @ResponseBody
    public Map<String, String> addComments(
            @RequestParam(value = "id", required = true) Long id,
            @RequestParam(value = "content", required = true) String content,
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, String> result = new HashMap<>();
        if (StringUtils.isNotNull(id) && StringUtils.isNotNull(content)){
            GuestComments guestComments = new GuestComments();
            guestComments.setUserId(ShiroUtils.getUserId());
            guestComments.setContent(content);
            guestComments.setGuestId(id);
            guestComments.setUserName(ShiroUtils.getLoginName());
            guestComments.setCreateTime(DateUtils.getNowDate());
            guestCommentsService.insertGuestComments(guestComments);
            result.put("status","1");
            result.put("msg", "评论成功咯！");
        }else {
            result.put("status", "0");
            result.put("msg", "评论失败咯！");
        }
        return result;
    }

    /**
     * 留言评论
     * @param id 留言ID
     * @param replaycontent 评论内容
     * @param request 请求
     * @param response 请求
     * @return
     */
    @PostMapping("/addReplayComments")
    @ResponseBody
    public Map<String, String> addReplayComments(
            @RequestParam(value = "id", required = true) Long id,
            @RequestParam(value = "rid", required = true) Long rid,
            @RequestParam(value = "ruserid", required = true) Long ruserid,
            @RequestParam(value = "rusername", required = true) String rusername,
            @RequestParam(value = "replaycontent", required = true) String replaycontent,
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, String> result = new HashMap<>();
        if (StringUtils.isNotNull(id) && StringUtils.isNotNull(replaycontent)){
            ReplayComments replayComments = new ReplayComments();
            replayComments.setReplayUserId(ShiroUtils.getUserId());//回复人ID
            replayComments.setReplyUserName(ShiroUtils.getLoginName());//回复人昵称
            replayComments.setRepliedUserId(ruserid);//被回复人员ID
            replayComments.setReplyedUserName(rusername);//被回复人员昵称
            replayComments.setCommentId(rid);//当前评论ID
            replayComments.setGuestId(id);//当前留言ID
            replayComments.setContent(replaycontent);//评论内容
            replayComments.setCreateTime(DateUtils.getNowDate());//评论时间
            replayCommentsService.insertReplayComments(replayComments);
            result.put("status","1");
            result.put("msg", "评论回复成功咯！");
        }else {
            result.put("status", "0");
            result.put("msg", "评论回复失败咯！");
        }
        return result;
    }

    /**
     * 对评论点赞
     * @param rid
     * @param request
     * @param response
     * @return
     */
    @PostMapping("/likeGuestComment")
    @ResponseBody
    public Map<String, String> likeGuestComment(
            @RequestParam(value = "rid", required = true) Long rid,
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, String> result = new HashMap<>();
        //判断是否已点赞,要传当前用户ID和当前被点赞内容的ID
        CommentsLike commentsLikes = commentsLikeService.selectCommentsLikeByUserIdWithLikedId(rid,ShiroUtils.getUserId());
        if (StringUtils.isNull(commentsLikes)){
            //点赞方法，实际上，原点赞上+1
            guestCommentsService.likeCommentById(rid);
            CommentsLike commentsLike = new CommentsLike();
            commentsLike.setLikedId(rid);//被点赞的内容ID
            commentsLike.setUserId(ShiroUtils.getUserId());//当前点赞人ID
            commentsLikeService.insertCommentsLike(commentsLike);//把点赞信息保存下，勇于判断当前点赞的人是否已点赞
            result.put("status","1");
            result.put("msg", "点赞成功咯！");
        }else {
            result.put("status", "0");
            result.put("msg", "点赞失败咯！你已点赞过了！");
        }
        return result;
    }

    /**
     * 对回复点赞
     * @param rid
     * @param request
     * @param response
     * @return
     */
    @PostMapping("/likeComments")
    @ResponseBody
    public Map<String, String> likeComments(
            @RequestParam(value = "rid", required = true) Long rid,
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, String> result = new HashMap<>();
        //判断是否已点赞,要传当前用户ID和当前被点赞内容的ID
        CommentsLike commentsLikes = commentsLikeService.selectCommentsLikeByUserIdWithLikedId(rid,ShiroUtils.getUserId());
        if (StringUtils.isNull(commentsLikes)){
            //点赞方法，实际上，原点赞上+1
            replayCommentsService.likeCommentById(rid);
            CommentsLike commentsLike = new CommentsLike();
            commentsLike.setLikedId(rid);//被点赞的内容ID
            commentsLike.setUserId(ShiroUtils.getUserId());//当前点赞人ID
            commentsLikeService.insertCommentsLike(commentsLike);//把点赞信息保存下，勇于判断当前点赞的人是否已点赞
            result.put("status","1");
            result.put("msg", "点赞成功咯！");
        }else {
            result.put("status", "0");
            result.put("msg", "点赞失败咯！你已点赞过了！");
        }
        return result;
    }
}