package com.ruoyi.project.homework.course.mapper;

import java.util.List;
import com.ruoyi.project.homework.course.domain.Course;

/**
 * courseMapper接口
 * 
 * @author LH
 * @date 2024-03-12
 */
public interface CourseMapper 
{
    /**
     * 查询course
     * 
     * @param id course主键
     * @return course
     */
    public Course selectCourseById(Long id);

    /**
     * 查询course列表
     * 
     * @param course course
     * @return course集合
     */
    public List<Course> selectCourseList(Course course);

    /**
     * 新增course
     * 
     * @param course course
     * @return 结果
     */
    public int insertCourse(Course course);

    /**
     * 修改course
     * 
     * @param course course
     * @return 结果
     */
    public int updateCourse(Course course);

    /**
     * 删除course
     * 
     * @param id course主键
     * @return 结果
     */
    public int deleteCourseById(Long id);

    /**
     * 批量删除course
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseByIds(String[] ids);
}
