package com.ruoyi.project.homework.handinhomework;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.homework.answer.domain.Answer;
import com.ruoyi.project.homework.answer.service.IAnswerService;
import com.ruoyi.project.homework.leavehomework.domain.Leavehomework;
import com.ruoyi.project.homework.leavehomework.service.ILeavehomeworkService;
import com.ruoyi.project.homework.myhomework.domain.HandInHomework;
import com.ruoyi.project.homework.myhomework.service.IHandInHomeworkService;
import com.ruoyi.project.homework.paper.domain.Paper;
import com.ruoyi.project.homework.paper.service.IPaperService;
import com.ruoyi.project.homework.questionbank.domain.QuestionBank;
import com.ruoyi.project.homework.questionbank.domain.QuestionOptions;
import com.ruoyi.project.homework.questionbank.service.IQuestionBankService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 提交作业Controller
 *
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Controller
@RequestMapping("/homework/handinhomework")
public class StuHandInHomeworkController extends BaseController {

    private String prefix = "homework/handinhomework";

    private String mprefix = "homework/myhomework";

    @Autowired
    private ILeavehomeworkService leavehomeworkService;

    @Autowired
    private IHandInHomeworkService iHandInHomeworkService;

    @Autowired
    private IQuestionBankService iQuestionBankService;

    @Autowired
    private IPaperService iPaperService;

    @Autowired
    private IAnswerService iAnswerService;


    @RequiresPermissions("homework:handinhomework:view")
    @GetMapping()
    public String myhomework()
    {
        return prefix + "/handinhomework";
    }

    /**
     * 查询我的作业列表
     */
    @RequiresPermissions("homework:myhomework:list")
    @PostMapping("/hlist")
    @ResponseBody
    public TableDataInfo list(Leavehomework leavehomework)
    {
        String loginName = ShiroUtils.getLoginName();//当前用户登录名
        Long deptId = ShiroUtils.getSysUser().getDeptId();//当前登录人部门ID
        Long roleId = ShiroUtils.getSysUser().getRoles().get(0).getRoleId();//当前登录人角色ID
        //本系统教师角色roleId == 3
        if (roleId == 3){
            //如果是老师角色只显示当前老师操作的数据
//            leavehomework.setStuclassId(String.valueOf(deptId));
            leavehomework.setTeacherId(String.valueOf(loginName));
        }else if (roleId == 4){
            //如果是学生角色只显示当前班级的作业--通过班级ID
            leavehomework.setStuclassId(String.valueOf(deptId));
        }
        startPage();
        List<Leavehomework> list = leavehomeworkService.selectLeavehomeworkList(leavehomework);
        return getDataTable(list);
    }

    /**
     * 新增学生写作业作业
     */
    @GetMapping("/add/{hid}")
    public String add(@PathVariable("hid") Long hid,Long paperid, ModelMap mmap)
    {
        if (paperid != null){
            List<QuestionBank> radioQuestionsList = iQuestionBankService.selectAllQuestionBank(paperid);
            Paper paper = iPaperService.selectPaperByPaperid(paperid);
            List<Leavehomework> leavehomeworks = leavehomeworkService.selectLeavehomeworkByPaperId(paperid);
            mmap.put("papertitle",paper.getPaperTitle());
            mmap.put("radioQuestionsList",radioQuestionsList);
            mmap.put("queastionsize",radioQuestionsList.size());
            mmap.put("paperid",paperid);
            mmap.put("teacherid",leavehomeworks.get(0).getTeacherId());
        }
        mmap.put("homeworkid",hid);
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(hid);
        mmap.put("leavehomework",leavehomework);
        return mprefix + "/add";
    }

    /**
     * 查看作业详情
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(id);
        mmap.put("handInHomework", leavehomework);
        return prefix + "/detail";
    }

    /**
     * 查询作业此作业是否已完成，是否已过期，已过期或者已评分就不让再重复写了！
     * @param id 老师留的作业ID
     * @return
     */
    @GetMapping("/checkHandInHomeWork")
    @ResponseBody
    public AjaxResult checkHandInHomeWork(@RequestParam Long id){
        //这里传来的ID是老师留的作业ID
        String studentId = ShiroUtils.getSysUser().getLoginName();//当前登录人ID
        HandInHomework handInHomework = iHandInHomeworkService.selectLeavehomeworkByHomeWoekId(id,studentId);
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(id);
        Date endTime = leavehomework.getEndTime();//当前作业结束时间
        Date nowDate = DateUtils.getNowDate();//当前时间
        if (nowDate.after(endTime)){
            return AjaxResult.fail("抱歉，作业提交时间已截止，请跟老师联系看看！~");
        } else if (handInHomework != null){
            if (handInHomework.getHid()>0){
                return AjaxResult.warn("本条作业您已成！，不允许重复写作业提交~若需要修改请到我的作业中修改~");
            }else {
                return AjaxResult.warn("本条作业您已成！，不允许重复写作业提交~若需要修改请到我的作业中修改~");
            }
        }else {
            return AjaxResult.success();
        }
    }

    /**
     * 查询作业此作业是否已完成，是否已过期，已过期或者已评分就不让再重复写了！
     * @param homeworkid 老师留的作业ID
     * @return
     */
    @GetMapping("/checkOnlineWork")
    @ResponseBody
    public AjaxResult checkOnlineWork(@RequestParam Long homeworkid){
        //这里传来的ID是老师留的作业ID
        String studentId = ShiroUtils.getSysUser().getLoginName();//当前登录人ID
        Integer exist = iAnswerService.selectAnswerByOnlineHomeWorkId(homeworkid,studentId);
        Leavehomework leavehomework = leavehomeworkService.selectLeavehomeworkById(homeworkid);
        Date endTime = leavehomework.getEndTime();//当前作业结束时间
        Date nowDate = DateUtils.getNowDate();//当前时间
        if (nowDate.after(endTime)){
            return AjaxResult.fail("抱歉，作业提交时间已截止，请跟老师联系看看！~");
        } else if (exist>0){
            return AjaxResult.warn("本条作业您已成！，不允许重复写作业提交~若需要修改请到我的作业中修改~");
        }else {
            return AjaxResult.success();
        }
    }

    /**
     * 在心写作业
     * @param paperid
     * @param mmap
     * @return
     */
    @GetMapping("/onlineQuestion/{paperid}")
    public String onlineQuestion(@PathVariable("paperid") Long paperid,@RequestParam String homeworkid, ModelMap mmap)
    {
        List<QuestionBank> radioQuestionsList = iQuestionBankService.selectAllQuestionBank(paperid);
        Paper paper = iPaperService.selectPaperByPaperid(paperid);
        List<Leavehomework> leavehomeworks = leavehomeworkService.selectLeavehomeworkByPaperId(paperid);
        mmap.put("papertitle",paper.getPaperTitle());
        mmap.put("radioQuestionsList",radioQuestionsList);
        mmap.put("queastionsize",radioQuestionsList.size());
        mmap.put("paperid",paperid);
        mmap.put("teacherid",leavehomeworks.get(0).getTeacherId());
        mmap.put("homeworkid",homeworkid);
        return prefix + "/onlinequestion";
    }

    @PostMapping("/submitRadioOptions")
    @ResponseBody
    public AjaxResult submitRadioOptions(@RequestParam Long paperid,@RequestParam String teacherid,@RequestParam String homeworkid, @RequestParam String options,ModelMap mmap){
        BigDecimal totalScroe = new BigDecimal(0);
        List<Map> errorQuestion = new ArrayList<>();
        List<Map> userselect = new ArrayList<>();
        String[] selectoptions = options.split("&");
        for(int i = 0 ;i <= selectoptions.length -1;i++){
            String[] test = selectoptions[i].split("=");
            String questionIdStr = test[0].replace("\"", "");
            Long questionId =Long.parseLong(questionIdStr);
            String answer = test[1].replace("\"", "");
            QuestionBank obj = iQuestionBankService.getOne(questionId);
            QuestionOptions optionss = iQuestionBankService.selectQuestionBankByOptionId(Long.parseLong(answer));
            Map usererr = new HashMap();
            usererr.put("optionid",optionss.getOptionId());
            usererr.put("answer",optionss.getOptionContent());
            usererr.put("tag",optionss.getOptionTag());
            userselect.add(usererr);
            if("0".equals(optionss.getCorrectAnswerStatus())){
                totalScroe = totalScroe.add(obj.getScores());
            }else {
                List<QuestionOptions> items = iQuestionBankService.selectQuestionBankOptionByQid(questionId);
                //[{answer:A},{answer:B}]
                List<QuestionOptions> temp = items.stream().filter(item -> "0".equals(item.getCorrectAnswerStatus())).collect(Collectors.toList());
                //[A,B]
                List<String> tagList = temp.stream().map(QuestionOptions::getOptionTag).collect(Collectors.toList());
                List<String> answerList = temp.stream().map(QuestionOptions::getOptionContent).collect(Collectors.toList());
                String q = obj.getQuestions();
                String answerStr = answerList.stream().collect(Collectors.joining("、"));
                String tagStr = tagList.stream().collect(Collectors.joining("、"));
                //'A、B'
                Map err = new HashMap();
                err.put("questionId",questionId);
                err.put("question",q);
                err.put("answerStr",answerStr);
                err.put("answertagStr",tagStr);
                errorQuestion.add(err);
            }
            Answer answerObj = new Answer();
            answerObj.setPaperid(paperid);
            answerObj.setQuestionid(questionId);
            answerObj.setTeacherid(teacherid);
            answerObj.setAnswer(optionss.getOptionContent());
            answerObj.setOptionid(optionss.getOptionId());
            answerObj.setQuestion(obj.getQuestions());
            answerObj.setQuestion(obj.getQuestions());
            answerObj.setCorrectAnswerStatus(optionss.getCorrectAnswerStatus());
            answerObj.setStudentId(ShiroUtils.getLoginName());
            answerObj.setStudentName(ShiroUtils.getSysUser().getUserName());
            answerObj.setStucalssid(String.valueOf(ShiroUtils.getSysUser().getDeptId()));
            answerObj.setHomeworkid(homeworkid);
            iAnswerService.insertAnswer(answerObj);
        }
        iHandInHomeworkService.updateHandInHomeworkScoreByStuIdAndScore(totalScroe,homeworkid,ShiroUtils.getSysUser().getLoginName());
        Map result = new HashMap();
        result.put("totalScroe",totalScroe);
        result.put("errorQuestion",errorQuestion);
        result.put("userselect",userselect);
        return AjaxResult.success(result);
    }

}
