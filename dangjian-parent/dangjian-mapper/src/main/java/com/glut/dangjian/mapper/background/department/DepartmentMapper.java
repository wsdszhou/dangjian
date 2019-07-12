package com.glut.dangjian.mapper.background.department;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.department.Bmb;

public interface DepartmentMapper {
    
    int deleteByPrimaryKey( @Param("ids")int[] ids);

    int insert(Bmb record);

    int insertSelective(Bmb record);

    Bmb selectByPrimaryKey(Integer bmId);

    int updateByPrimaryKeySelective(Bmb record);

    int updateByPrimaryKey(Bmb record);
    
    List<Bmb> loadBmList();

    List<Bmb> loadBranchList();

    List<Bmb> getDepartMentList();

    Integer getIdByName(String bmMc);

}