package com.ruoyi.project.homework.myhomework.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.myhomework.mapper.HandInHomeworkMapper;
import com.ruoyi.project.homework.myhomework.domain.HandInHomework;
import com.ruoyi.project.homework.myhomework.service.IHandInHomeworkService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 我的作业Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Service
public class HandInHomeworkServiceImpl implements IHandInHomeworkService
{
    @Autowired
    private HandInHomeworkMapper handInHomeworkMapper;

    /**
     * 查询我的作业
     *
     * @param hid 我的作业主键
     * @return 我的作业
     */
    @Override
    public HandInHomework selectHandInHomeworkByHid(Long hid)
    {
        return handInHomeworkMapper.selectHandInHomeworkByHid(hid);
    }

    /**
     * 查询我的作业列表
     *
     * @param handInHomework 我的作业
     * @return 我的作业
     */
    @Override
    public List<HandInHomework> selectHandInHomeworkList(HandInHomework handInHomework)
    {
        return handInHomeworkMapper.selectHandInHomeworkList(handInHomework);
    }

    /**
     * 新增我的作业
     * 
     * @param handInHomework 我的作业
     * @return 结果
     */
    @Override
    public int insertHandInHomework(HandInHomework handInHomework)
    {
        handInHomework.setCreateTime(DateUtils.getNowDate());
        handInHomework.setCreateBy(ShiroUtils.getSysUser().getLoginName());
        handInHomework.setClassId(String.valueOf(ShiroUtils.getSysUser().getDeptId()));
        handInHomework.setStuclasSname(ShiroUtils.getSysUser().getDept().getDeptName());
        return handInHomeworkMapper.insertHandInHomework(handInHomework);
    }

    /**
     * 修改我的作业
     * 
     * @param handInHomework 我的作业
     * @return 结果
     */
    @Override
    public int updateHandInHomework(HandInHomework handInHomework)
    {

        handInHomework.setUpdateTime(DateUtils.getNowDate());
        handInHomework.setUpdateBy(ShiroUtils.getSysUser().getUserName());
        //获取教师角色
        Long roleId = ShiroUtils.getSysUser().getRoles().get(0).getRoleId();
        //如果是老师角色批改作业就状态改为已批改作业否则不变
        if (roleId==3){
            handInHomework.setState("已批阅");
            handInHomework.setMarkMan(ShiroUtils.getSysUser().getUserName());
            handInHomework.setMarkTime(DateUtils.getNowDate());
        }
        return handInHomeworkMapper.updateHandInHomework(handInHomework);
    }

    /**
     * 批量删除我的作业
     *
     * @param hids 需要删除的我的作业主键
     * @return 结果
     */
    @Override
    public int deleteHandInHomeworkByHids(String hids)
    {
        return handInHomeworkMapper.deleteHandInHomeworkByHids(Convert.toStrArray(hids));
    }

    /**
     * 删除我的作业信息
     *
     * @param hid 我的作业主键
     * @return 结果
     */
    @Override
    public int deleteHandInHomeworkByHid(Long hid)
    {
        return handInHomeworkMapper.deleteHandInHomeworkByHid(hid);
    }

    /**
     * 查询作业此作业是否已完成，已评分就不让再重复写了！
     * @param hid
     * @return
     */
    @Override
    public HandInHomework selectLeavehomeworkByHomeWoekId(Long hid,String studentId) {
        return handInHomeworkMapper.selectLeavehomeworkByHomeWoekId(hid,studentId);
    }

    @Override
    public List<HandInHomework> selectHandInHomeworkByHomeworkid(String id) {
        return handInHomeworkMapper.selectHandInHomeworkByHomeworkid(id);
    }

    @Override
    public int updateHandInHomeworkScoreByStuIdAndScore(BigDecimal totalScroe, String homeworkid, String loginName) {
        return handInHomeworkMapper.updateHandInHomeworkScoreByStuIdAndScore(totalScroe,homeworkid,loginName);
    }
}
