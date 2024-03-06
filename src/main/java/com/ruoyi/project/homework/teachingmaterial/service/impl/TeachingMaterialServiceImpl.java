package com.ruoyi.project.homework.teachingmaterial.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.teachingmaterial.mapper.TeachingMaterialMapper;
import com.ruoyi.project.homework.teachingmaterial.domain.TeachingMaterial;
import com.ruoyi.project.homework.teachingmaterial.service.ITeachingMaterialService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 教学资料Service业务层处理
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
@Service
public class TeachingMaterialServiceImpl implements ITeachingMaterialService 
{
    @Autowired
    private TeachingMaterialMapper teachingMaterialMapper;

    /**
     * 查询教学资料
     * 
     * @param id 教学资料主键
     * @return 教学资料
     */
    @Override
    public TeachingMaterial selectTeachingMaterialById(Long id)
    {
        return teachingMaterialMapper.selectTeachingMaterialById(id);
    }

    /**
     * 查询教学资料列表
     * 
     * @param teachingMaterial 教学资料
     * @return 教学资料
     */
    @Override
    public List<TeachingMaterial> selectTeachingMaterialList(TeachingMaterial teachingMaterial)
    {
        return teachingMaterialMapper.selectTeachingMaterialList(teachingMaterial);
    }

    /**
     * 新增教学资料
     * 
     * @param teachingMaterial 教学资料
     * @return 结果
     */
    @Override
    public int insertTeachingMaterial(TeachingMaterial teachingMaterial)
    {
        teachingMaterial.setCreateTime(DateUtils.getNowDate());
        teachingMaterial.setCreateBy(ShiroUtils.getSysUser().getLoginName());
        return teachingMaterialMapper.insertTeachingMaterial(teachingMaterial);
    }

    /**
     * 修改教学资料
     * 
     * @param teachingMaterial 教学资料
     * @return 结果
     */
    @Override
    public int updateTeachingMaterial(TeachingMaterial teachingMaterial)
    {
        teachingMaterial.setUpdateTime(DateUtils.getNowDate());
        teachingMaterial.setUpdateBy(ShiroUtils.getSysUser().getUserName());
        return teachingMaterialMapper.updateTeachingMaterial(teachingMaterial);
    }

    /**
     * 批量删除教学资料
     * 
     * @param ids 需要删除的教学资料主键
     * @return 结果
     */
    @Override
    public int deleteTeachingMaterialByIds(String ids)
    {
        return teachingMaterialMapper.deleteTeachingMaterialByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除教学资料信息
     * 
     * @param id 教学资料主键
     * @return 结果
     */
    @Override
    public int deleteTeachingMaterialById(Long id)
    {
        return teachingMaterialMapper.deleteTeachingMaterialById(id);
    }
}
