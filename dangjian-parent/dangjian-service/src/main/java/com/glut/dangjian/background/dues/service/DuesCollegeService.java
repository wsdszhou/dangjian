package com.glut.dangjian.background.dues.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.dues.DuesCollege;

import java.util.List;

public interface DuesCollegeService {

    // 加载学院信息
    List<DuesCollege> loadDuesCollege();

    //分页查询学院信息
    PageInfo<DuesCollege> duesCollegePageList(Integer pageNum, Integer pageSize);

    //获取学院对象
    DuesCollege getCollegeById(Integer collegeId);
}
