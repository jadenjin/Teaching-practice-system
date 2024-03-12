package com.ruoyi.project.homework.course.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.homework.course.mapper.CourseMapper;
import com.ruoyi.project.homework.course.domain.Course;
import com.ruoyi.project.homework.course.service.ICourseService;
import com.ruoyi.common.utils.text.Convert;

/**
 * courseService业务层处理
 * 
 * @author LH
 * @date 2024-03-12
 */
@Service
public class CourseServiceImpl implements ICourseService 
{
    @Autowired
    private CourseMapper courseMapper;

    /**
     * 查询course
     * 
     * @param id course主键
     * @return course
     */
    @Override
    public Course selectCourseById(Long id)
    {
        return courseMapper.selectCourseById(id);
    }

    /**
     * 查询course列表
     * 
     * @param course course
     * @return course
     */
    @Override
    public List<Course> selectCourseList(Course course)
    {
        return courseMapper.selectCourseList(course);
    }

    /**
     * 新增course
     * 
     * @param course course
     * @return 结果
     */
    @Override
    public int insertCourse(Course course)
    {
        return courseMapper.insertCourse(course);
    }

    /**
     * 修改course
     * 
     * @param course course
     * @return 结果
     */
    @Override
    public int updateCourse(Course course)
    {
        return courseMapper.updateCourse(course);
    }

    /**
     * 批量删除course
     * 
     * @param ids 需要删除的course主键
     * @return 结果
     */
    @Override
    public int deleteCourseByIds(String ids)
    {
        return courseMapper.deleteCourseByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除course信息
     * 
     * @param id course主键
     * @return 结果
     */
    @Override
    public int deleteCourseById(Long id)
    {
        return courseMapper.deleteCourseById(id);
    }
}
