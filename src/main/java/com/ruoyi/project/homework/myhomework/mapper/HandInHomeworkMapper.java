package com.ruoyi.project.homework.myhomework.mapper;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.project.homework.myhomework.domain.HandInHomework;

/**
 * 我的作业Mapper接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
public interface HandInHomeworkMapper
{
    /**
     * 查询我的作业
     *
     * @param hid 我的作业主键
     * @return 我的作业
     */
    public HandInHomework selectHandInHomeworkByHid(Long hid);

    /**
     * 查询我的作业列表
     *
     * @param handInHomework 我的作业
     * @return 我的作业集合
     */
    public List<HandInHomework> selectHandInHomeworkList(HandInHomework handInHomework);

    /**
     * 新增我的作业
     *
     * @param handInHomework 我的作业
     * @return 结果
     */
    public int insertHandInHomework(HandInHomework handInHomework);

    /**
     * 修改我的作业
     *
     * @param handInHomework 我的作业
     * @return 结果
     */
    public int updateHandInHomework(HandInHomework handInHomework);

    /**
     * 删除我的作业
     *
     * @param hid 我的作业主键
     * @return 结果
     */
    public int deleteHandInHomeworkByHid(Long hid);

    /**
     * 批量删除我的作业
     *
     * @param hids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHandInHomeworkByHids(String[] hids);

    /**
     * 查询作业此作业是否已完成，已评分就不让再重复写了！
     * @param hid
     * @return
     */
    public HandInHomework selectLeavehomeworkByHomeWoekId(Long hid,String studentId);

    List<HandInHomework> selectHandInHomeworkByHomeworkid(String id);

    public int updateHandInHomeworkScoreByStuIdAndScore(BigDecimal totalScroe, String homeworkid, String loginName);
}
