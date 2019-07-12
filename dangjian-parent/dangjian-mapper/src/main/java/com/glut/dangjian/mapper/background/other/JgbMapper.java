package com.glut.dangjian.mapper.background.other;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Jgb;

public interface JgbMapper {
    int deleteByPrimaryKey(Integer jgId);

    int insert(Jgb record);

    int insertSelective(Jgb record);

    Jgb selectByPrimaryKey(Integer jgId);

    int updateByPrimaryKeySelective(Jgb record);

    int updateByPrimaryKey(Jgb record);
    
    /**
     * 查询所有籍贯信息
     */
    List<Jgb> getJgbList();
    
    /**
     * 根据所在省查询所有籍贯
     */
    List<Jgb> getJgbListBySzsId(Integer szsId);

}