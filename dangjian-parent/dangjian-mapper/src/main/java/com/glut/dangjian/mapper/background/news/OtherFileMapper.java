package com.glut.dangjian.mapper.background.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.news.XwQtwjb;

public interface OtherFileMapper {
    int deleteByPrimaryKey(String jqwjId);

    int insert(XwQtwjb record);

    int insertSelective(XwQtwjb record);

    XwQtwjb selectByPrimaryKey(String jqwjId);

    int updateByPrimaryKeySelective(XwQtwjb record);

    int updateByPrimaryKey(XwQtwjb record);

    void updateBranch(@Param("xwQtwjbs")List<XwQtwjb> xwQtwjbs);
}