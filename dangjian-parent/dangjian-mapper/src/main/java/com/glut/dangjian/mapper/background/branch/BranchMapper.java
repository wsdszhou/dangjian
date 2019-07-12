package com.glut.dangjian.mapper.background.branch;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.branch.ZbLxb;
import com.glut.dangjian.entity.branch.Zbb;

public interface BranchMapper {
    int deleteByPrimaryKey(Integer zbId);

    int insert(Zbb record);

    int insertSelective(Zbb record);

    Zbb selectByPrimaryKey(Integer zbId);
    
   public List<Zbb> getZbListByUserId(String userId);
   
   List<ZbLxb> loadBranchTypeList();

   List<Zbb> loadBranchAllList();

   // 根据部门和支部类型加载支部列表
   List<Zbb> loadBranchByDepartmentAndBranchTypeList(@Param("deptId") Integer deptId, @Param("branchTypeId") Integer branchTypeId);

   // 根据部门加载支部列表
   List<Zbb> loadBranchByDepartmentList(@Param("deptId") Integer deptId);

   void deleteBranchBatch(@Param("branchIds") int[] branchIds);

   void updateByPrimaryKeySelective(Zbb zbb);

   List<Zbb> getAllBranch();

   List<Zbb> getBranchListByDeptId(Integer deptId);

}