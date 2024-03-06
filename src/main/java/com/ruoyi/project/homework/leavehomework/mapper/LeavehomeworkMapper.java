package com.ruoyi.project.homework.leavehomework.mapper;

import java.util.List;

import com.ruoyi.project.homework.leavehomework.domain.HandinHomweokVo;
import com.ruoyi.project.homework.leavehomework.domain.Leavehomework;
import com.ruoyi.project.homework.leavehomework.domain.ScoreStage;

/**
 * 发布作业Mapper接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
public interface LeavehomeworkMapper 
{
    /**
     * 查询发布作业
     * 
     * @param id 发布作业主键
     * @return 发布作业
     */
    public Leavehomework selectLeavehomeworkById(Long id);

    /**
     * 查询发布作业列表
     * 
     * @param leavehomework 发布作业
     * @return 发布作业集合
     */
    public List<Leavehomework> selectLeavehomeworkList(Leavehomework leavehomework);

    /**
     * 新增发布作业
     * 
     * @param leavehomework 发布作业
     * @return 结果
     */
    public int insertLeavehomework(Leavehomework leavehomework);

    /**
     * 修改发布作业
     * 
     * @param leavehomework 发布作业
     * @return 结果
     */
    public int updateLeavehomework(Leavehomework leavehomework);

    /**
     * 删除发布作业
     * 
     * @param id 发布作业主键
     * @return 结果
     */
    public int deleteLeavehomeworkById(Long id);

    /**
     * 批量删除发布作业
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLeavehomeworkByIds(String[] ids);

    List<HandinHomweokVo> selectNotHaninHomeworkStuinfo(Long id, String hid);

    public int selectLeavehomeworkByClassID(String hid);

    public int selectLeavehomeworkByClassIDAndID(Long id, String hid);

    public ScoreStage selectLeavehomeworkScoreById(String id);

    List<Leavehomework> selectLeavehomeworkByPaperId(Long paperid);
}
