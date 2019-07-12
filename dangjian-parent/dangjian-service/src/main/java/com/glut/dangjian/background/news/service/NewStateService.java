package com.glut.dangjian.background.news.service;

import java.util.List;

import com.glut.dangjian.entity.news.XwZtb;

public interface NewStateService {

    // 加载新闻状态
    public List<XwZtb> getNewsStateListAll();

}
