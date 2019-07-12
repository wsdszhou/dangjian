package com.glut.dangjian.mapper.approval.view;

import java.util.List;

import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.approval.view.ViewJobUser;

public interface ViewJobUserMapper {
    int insert(ViewJobUser record);

    int insertSelective(ViewJobUser record);

    List<ViewApprovalJobUser> jobUserPageList(ViewJobUser viewJobUser);
}