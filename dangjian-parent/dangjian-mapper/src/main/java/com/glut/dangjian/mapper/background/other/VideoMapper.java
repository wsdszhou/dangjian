package com.glut.dangjian.mapper.background.other;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.other.Sp;

public interface VideoMapper {

    int insert(Sp record);

    int insertSelective(Sp record);

    Sp selectByPrimaryKey(String spId);

    int updateByPrimaryKeySelective(Sp record);

    int updateByPrimaryKey(Sp record);

    List<Sp> getVideoPageList(Sp xwSp);

    void deleteBySpId(@Param("spIds") String[] spIds);

    List<Sp> getPageList();

    Sp getSingleVideo(String videoId);

}