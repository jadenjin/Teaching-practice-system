package com.ruoyi.project.homework.teachingmaterial.mapper;

import java.util.List;
import com.ruoyi.project.homework.teachingmaterial.domain.TeachingMaterial;

/**
 * 教学资料Mapper接口
 * 
 * @author AbuCoder QQ932696181
 * @date 2022-04-10
 */
public interface TeachingMaterialMapper 
{
    /**
     * 查询教学资料
     * 
     * @param id 教学资料主键
     * @return 教学资料
     */
    public TeachingMaterial selectTeachingMaterialById(Long id);

    /**
     * 查询教学资料列表
     * 
     * @param teachingMaterial 教学资料
     * @return 教学资料集合
     */
    public List<TeachingMaterial> selectTeachingMaterialList(TeachingMaterial teachingMaterial);

    /**
     * 新增教学资料
     * 
     * @param teachingMaterial 教学资料
     * @return 结果
     */
    public int insertTeachingMaterial(TeachingMaterial teachingMaterial);

    /**
     * 修改教学资料
     * 
     * @param teachingMaterial 教学资料
     * @return 结果
     */
    public int updateTeachingMaterial(TeachingMaterial teachingMaterial);

    /**
     * 删除教学资料
     * 
     * @param id 教学资料主键
     * @return 结果
     */
    public int deleteTeachingMaterialById(Long id);

    /**
     * 批量删除教学资料
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeachingMaterialByIds(String[] ids);
}
