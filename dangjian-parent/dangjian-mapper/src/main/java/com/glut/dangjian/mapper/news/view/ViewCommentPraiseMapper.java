package com.glut.dangjian.mapper.news.view;

import com.glut.dangjian.entity.news.view.ViewCommentPraise;

public interface ViewCommentPraiseMapper {
    int insert(ViewCommentPraise record);

    int insertSelective(ViewCommentPraise record);
}