package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxSjGdst;
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
public interface KszxSjGdstMapper {
    void insert(@Param("gdsts") List<KszxSjGdst> gdsts,@Param("sjid") int id);

    List<KszxSjGdst> selectBySjid(int sjid);

    int insertOne(KszxSjGdst kszxSjGdst);

    int deleteOne(KszxSjGdst kszxSjGdst);

    List<Map<String, Object>> selectQuestionView1(int sjid);

    int deleteBySjid(int sjid);

    List<Map<String, Object>> countQuestionType(int sjid);
}
