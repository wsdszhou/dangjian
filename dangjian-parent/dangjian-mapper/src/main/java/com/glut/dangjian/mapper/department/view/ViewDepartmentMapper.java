package com.glut.dangjian.mapper.department.view;

import com.glut.dangjian.entity.department.view.ViewDepartment;

public interface ViewDepartmentMapper {
    int insert(ViewDepartment record);

    int insertSelective(ViewDepartment record);

    ViewDepartment getDeptInfoByUserId(String userId);
}