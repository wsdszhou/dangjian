package com.glut.dangjian.mapper.branch.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.branch.view.ViewBranchUser;

public interface ViewBranchUserMapper {
    int insert(ViewBranchUser record);

    int insertSelective(ViewBranchUser record);

    List<ViewBranchUser> getBranchUserPageList(@Param("viewBranchUser") ViewBranchUser viewBranchUser, @Param("branchId") Integer branchId);

    List<ViewBranchUser> getBranchUserInfoByuserid(String userId);
}