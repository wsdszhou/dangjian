package com.glut.dangjian.mapper.dues;

import com.glut.dangjian.entity.dues.DuesCollege;

import java.util.List;

public interface DuesCollegeMapper {

    DuesCollege selectById(Integer collegeId);
    // 加载审批岗位
    List<DuesCollege> loadDuesCollege();

    // 分页查询审批岗位
    List<DuesCollege> duesCollegePageList();
}
