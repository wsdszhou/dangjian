package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxSjSjst;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/14
 * Time: 5:39 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public interface KszxSjSjstMapper {

    List<KszxSjSjst> selectBySjid(int sjid);

    void insertOne(KszxSjSjst sjst);

    void deleteOneById(int id);

    void update(KszxSjSjst sjst);

    void deleteBySjid(int sjid);
}
