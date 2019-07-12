package com.glut.dangjian.mapper.system.view;

import java.util.List;

import com.glut.dangjian.entity.other.Bug;
import com.glut.dangjian.entity.system.view.ViewBug;

public interface ViewBugMapper {
    int insert(ViewBug record);

    int insertSelective(ViewBug record);

    List<ViewBug> getBugPageList();

    ViewBug getViewBugById(String id);

}