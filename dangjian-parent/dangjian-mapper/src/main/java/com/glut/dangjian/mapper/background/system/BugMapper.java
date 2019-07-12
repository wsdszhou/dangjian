package com.glut.dangjian.mapper.background.system;

import java.util.List;

import com.glut.dangjian.entity.other.Bug;

public interface BugMapper {
    int deleteByPrimaryKey(String id);

    int insert(Bug record);

    int insertSelective(Bug record);

    Bug selectByPrimaryKey(String id);

    List<Bug> getBugPageList();

    void reading(String id);

}