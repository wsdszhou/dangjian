package com.glut.dangjian.mapper.background.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.news.XwPldzb;

public interface NewsCommentMapper {
    // 删除一条评论
    int deleteByPrimaryKey(String plId);

    //添加一条评论
    int insert(XwPlb record);

    //添加一条评论
    int insertSelective( @Param("xwPlb")XwPlb xwPlb, @Param("xwPldzb")XwPldzb xwPldzb);

    // 根基id查询一条评论
    XwPlb selectByPrimaryKey(String plId);

    // 修改评论
    int updateByPrimaryKeySelective(XwPlb record);

    // 修改评论
    int updateByPrimaryKey(XwPlb record);

    String getCommentuseridByCommentid(String commentId);

}