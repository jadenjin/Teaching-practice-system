package com.ruoyi.project.homework.markstuhomework;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.homework.answer.domain.Answer;
import com.ruoyi.project.homework.answer.service.IAnswerService;
import com.ruoyi.project.homework.myhomework.domain.HandInHomework;
import com.ruoyi.project.homework.myhomework.service.IHandInHomeworkService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 批改作业Controller
 *
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Controller
@RequestMapping("/homework/markstuhomework")
public class MarkStuHomeWork extends BaseController {

    private String prefix = "homework/markstuhomework";

    @Autowired
    private IHandInHomeworkService iHandInHomeworkService;

    @Autowired
    private IAnswerService iAnswerService;


    @RequiresPermissions("homework:markstuhomework:view")
    @GetMapping()
    public String markstuhomework()
    {
        return prefix + "/markstuhomework";
    }

    /**
     * 查询我的作业列表
     */
    @RequiresPermissions("homework:markstuhomework:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HandInHomework handInHomework)
    {
        Long deptId = ShiroUtils.getSysUser().getDeptId();//当前用户所在部门
        Long roleId = ShiroUtils.getSysUser().getRoles().get(0).getRoleId();//当前用户角色ID
        //本系统教师角色ID roleId == 3
        if (roleId == 3){
            handInHomework.setTeacherrId(ShiroUtils.getSysUser().getLoginName());
//            handInHomework.setClassId(String.valueOf(deptId));
        }
        startPage();
        List<HandInHomework> list = iHandInHomeworkService.selectHandInHomeworkList(handInHomework);
        return getDataTable(list);
    }

    /**
     * 批阅作业
     * @param hid
     * @param mmap
     * @return
     */
    @GetMapping("/edit/{hid}")
    public String edit(@PathVariable("hid") Long hid, ModelMap mmap)
    {
        HandInHomework handInHomework = iHandInHomeworkService.selectHandInHomeworkByHid(hid);
        mmap.put("handInHomework", handInHomework);
        return prefix + "/edit";
    }

    /**
     * 提交的作业--详情
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id,@RequestParam String homeworkid, ModelMap mmap)
    {
        String teacherid = ShiroUtils.getSysUser().getLoginName();
        List<Answer>  answer = iAnswerService.selectAnswerByHId(Long.valueOf(homeworkid),teacherid);
        mmap.put("answer", answer);
        HandInHomework handInHomework = iHandInHomeworkService.selectHandInHomeworkByHid(id);
        mmap.put("handInHomework", handInHomework);
        return prefix + "/detail";
    }

    /**
     * 查询事由有在线图库的作业信息
     * @param hid
     * @return
     */
    @GetMapping("/checkOnlieHomeWork")
    @ResponseBody
    public AjaxResult checkHandInHomeWork(@RequestParam Long hid){
        Integer count = iAnswerService.selectStuAnswerByHId(hid);
        System.out.println("count = " + count);
        if (count == null){
            return AjaxResult.warn("没有在线题的作业哦~");
        }else {
            return AjaxResult.success();
        }
    }

    @GetMapping("/onlineQuestion/{hid}")
    public String onlineQuestion(@PathVariable("hid") Long hid, ModelMap mmap)
    {
        String teacherid = ShiroUtils.getSysUser().getLoginName();
        List<Answer>  answer = iAnswerService.selectAnswerByHId(hid,teacherid);
        mmap.put("answer", answer);
        return prefix + "/onlinequestion";
    }
}
