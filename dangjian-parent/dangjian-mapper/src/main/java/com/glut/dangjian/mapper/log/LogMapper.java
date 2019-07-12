package com.glut.dangjian.mapper.log;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.log.Log;

public interface LogMapper {
    int deleteByPrimaryKey(String id);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    void deleteBatch(@Param("ids")String[] ids);
    
}