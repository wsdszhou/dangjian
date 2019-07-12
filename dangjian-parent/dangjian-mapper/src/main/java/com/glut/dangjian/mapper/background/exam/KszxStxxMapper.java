package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxStxx;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/10/23
 * Time: 14:05
 */
public interface KszxStxxMapper {

    int deleteByStid(int stid);

    int insert(List<KszxStxx> kszxStxxList);

    void insertByStid(@Param("kszxStxxList") List<KszxStxx> kszxStxxList,@Param("stid") int stid);

}
