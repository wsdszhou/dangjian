package com.glut.dangjian.mapper.news.view;

import com.glut.dangjian.entity.news.view.ViewNewsPraise;

public interface ViewNewsPraiseMapper {
    int insert(ViewNewsPraise record);

    int insertSelective(ViewNewsPraise record);
}