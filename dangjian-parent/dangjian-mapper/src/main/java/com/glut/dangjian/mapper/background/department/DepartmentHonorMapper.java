package com.glut.dangjian.mapper.background.department;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.department.Bmry;

public interface DepartmentHonorMapper {
    
    // 根据主键删除
    int deleteByPrimaryKey(Integer bmryId);

    // 保存荣誉
    int insert(Bmry record);

    // 保存荣誉并且判断是否为空
    int insertSelective(Bmry record);

    // 根据主键查询
    Bmry selectByPrimaryKey(Integer bmryId);

    // 修改荣誉信息，并且判断是否为空
    int updateByPrimaryKeySelective(Bmry record);

    // 修改荣誉信息
    int updateByPrimaryKey(Bmry record);

    // 批量删除
    void deleteBratch(@Param("honorIds")int[] honorIds);

    // 分页查询 
    List<Bmry> getDeptHonorListPage(Bmry bmry);

    // 分页查询
    List<Bmry> getDeptHonorPageList();

    //荣誉详细信息
    Bmry getDeptHonorByHonorid(String honorId);

    Integer getHonorIdByName(String bmryMc);
}