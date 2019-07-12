package com.glut.dangjian.mapper.background.news;

import java.util.List;

import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.news.XwZtb;
/**
 * 新闻状态
 * @author XuLanKong
 *
 */
public interface NewsStateMapper {
    
    // 根据id删除信息
    int deleteByPrimaryKey(Integer xwztId);

    // 插入数据
    int insert(XwZtb record);

    // 插入数据，并且判断是否为空
    int insertSelective(XwZtb record);

    // 通过主键查询
    XwZtb selectByPrimaryKey(Integer xwztId);

    // 修改新闻状态，并且判断是否为空
    int updateByPrimaryKeySelective(XwZtb record);

    // 修改新闻状态
    int updateByPrimaryKey(XwZtb record);

    // 获取所有新闻状态信息
    List<XwZtb> getNewsStateListAll();

    
}