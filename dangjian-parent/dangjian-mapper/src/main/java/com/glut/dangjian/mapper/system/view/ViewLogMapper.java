package com.glut.dangjian.mapper.system.view;

import java.util.List;

import com.glut.dangjian.entity.view.ViewLog;

public interface ViewLogMapper {
    int insert(ViewLog record);

    int insertSelective(ViewLog record);

    List<ViewLog> getLogPageList(ViewLog viewLog);
}