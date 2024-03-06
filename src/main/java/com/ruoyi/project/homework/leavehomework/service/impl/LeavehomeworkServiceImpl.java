package com.ruoyi.project.homework.leavehomework.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.homework.leavehomework.domain.HandinHomweokVo;
import com.ruoyi.project.homework.leavehomework.domain.ScoreStage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.leavehomework.mapper.LeavehomeworkMapper;
import com.ruoyi.project.homework.leavehomework.domain.Leavehomework;
import com.ruoyi.project.homework.leavehomework.service.ILeavehomeworkService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 发布作业Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Service
public class LeavehomeworkServiceImpl implements ILeavehomeworkService 
{
    @Autowired
    private LeavehomeworkMapper leavehomeworkMapper;

    /**
     * 查询发布作业
     * 
     * @param id 发布作业主键
     * @return 发布作业
     */
    @Override
    public Leavehomework selectLeavehomeworkById(Long id)
    {
        return leavehomeworkMapper.selectLeavehomeworkById(id);
    }

    /**
     * 查询发布作业列表
     * 
     * @param leavehomework 发布作业
     * @return 发布作业
     */
    @Override
    public List<Leavehomework> selectLeavehomeworkList(Leavehomework leavehomework)
    {
        return leavehomeworkMapper.selectLeavehomeworkList(leavehomework);
    }

    /**
     * 新增发布作业
     * 
     * @param leavehomework 发布作业
     * @return 结果
     */
    @Override
    public int insertLeavehomework(Leavehomework leavehomework)
    {
        leavehomework.setCreateTime(DateUtils.getNowDate());
        leavehomework.setCreateBy(ShiroUtils.getSysUser().getLoginName());
//        leavehomework.setStuclassId(String.valueOf(ShiroUtils.getSysUser().getDeptId()));//当前老师的部门ID
        return leavehomeworkMapper.insertLeavehomework(leavehomework);
    }

    /**
     * 修改发布作业
     * 
     * @param leavehomework 发布作业
     * @return 结果
     */
    @Override
    public int updateLeavehomework(Leavehomework leavehomework)
    {
        leavehomework.setUpdateTime(DateUtils.getNowDate());
        leavehomework.setUpdateBy(ShiroUtils.getSysUser().getUserName());
        return leavehomeworkMapper.updateLeavehomework(leavehomework);
    }

    /**
     * 批量删除发布作业
     * 
     * @param ids 需要删除的发布作业主键
     * @return 结果
     */
    @Override
    public int deleteLeavehomeworkByIds(String ids)
    {
        return leavehomeworkMapper.deleteLeavehomeworkByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除发布作业信息
     * 
     * @param id 发布作业主键
     * @return 结果
     */
    @Override
    public int deleteLeavehomeworkById(Long id)
    {
        return leavehomeworkMapper.deleteLeavehomeworkById(id);
    }

    @Override
    public List<HandinHomweokVo> selectNotHaninHomeworkStuinfo(Long id, String hid) {
        return leavehomeworkMapper.selectNotHaninHomeworkStuinfo(id,hid);
    }

    @Override
    public int selectLeavehomeworkByClassID(String hid) {
        return leavehomeworkMapper.selectLeavehomeworkByClassID(hid);
    }

    @Override
    public int selectLeavehomeworkByClassIDAndID(Long id, String hid) {
        return leavehomeworkMapper.selectLeavehomeworkByClassIDAndID(id,hid);
    }

    @Override
    public ScoreStage selectLeavehomeworkScoreById(String id) {
        return leavehomeworkMapper.selectLeavehomeworkScoreById(id);
    }

    @Override
    public List<Leavehomework> selectLeavehomeworkByPaperId(Long paperid) {
        return leavehomeworkMapper.selectLeavehomeworkByPaperId(paperid);
    }

}
