package com.glut.dangjian.mapper.dues;

import com.glut.dangjian.entity.dues.view.ViewDuesList;

import java.util.List;

public interface DuesListMapper {
    List<ViewDuesList> duesPageList(ViewDuesList viewDuesList);

    int noticeById(Integer id);
}
