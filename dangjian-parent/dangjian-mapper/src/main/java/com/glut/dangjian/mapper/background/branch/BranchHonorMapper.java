package com.glut.dangjian.mapper.background.branch;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.branch.Zbry;

public interface BranchHonorMapper {
    int deleteByPrimaryKey(Integer zbryId);

    int insert(Zbry record);

    int insertSelective(Zbry record);

    Zbry selectByPrimaryKey(Integer zbryId);

    int updateByPrimaryKeySelective(Zbry record);

    int updateByPrimaryKey(Zbry record);

    void deleteBranchHonorBratch(@Param("zbryIds") int[] zbryIds);

    List<Zbry> getBranchHonorListPage(Zbry zbry);

    List<Zbry> getBranchHonorPageList();

    Zbry getBranchHonorByHonorid(String honorId);

    Integer getHonorIdByName(String zbryMc);
}