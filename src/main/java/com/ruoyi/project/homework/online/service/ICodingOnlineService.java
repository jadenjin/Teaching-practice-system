package com.ruoyi.project.homework.online.service;

import java.util.List;
import com.ruoyi.project.homework.online.domain.CodingOnline;

/**
 * coding_onlineService接口
 * 
 * @author JadenChen QQ2955104590
 * @date 2024-03-03
 */
public interface ICodingOnlineService {
    /**
     * 查询coding_online
     * 
     * @param id coding_online主键
     * @return coding_online
     */
    public CodingOnline selectCodingOnlineById(Long id);

    /**
     * 查询coding_online列表
     * 
     * @param codingOnline coding_online
     * @return coding_online集合
     */
    public List<CodingOnline> selectCodingOnlineList(CodingOnline codingOnline);

    /**
     * 新增coding_online
     * 
     * @param codingOnline coding_online
     * @return 结果
     */
    public int insertCodingOnline(CodingOnline codingOnline);

    /**
     * 修改coding_online
     * 
     * @param codingOnline coding_online
     * @return 结果
     */
    public int updateCodingOnline(CodingOnline codingOnline);

    /**
     * 批量删除coding_online
     * 
     * @param ids 需要删除的coding_online主键集合
     * @return 结果
     */
    public int deleteCodingOnlineByIds(String ids);

    /**
     * 删除coding_online信息
     * 
     * @param id coding_online主键
     * @return 结果
     */
    public int deleteCodingOnlineById(Long id);

    /**
     * 在线编程
     *
     * @param cCode
     * @return result
     */
    String codeOnline(String cCode);
}
