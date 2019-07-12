package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxSjfl;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/8
 * Time: 7:13 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/


public interface KszxSjflMapper {

    List<KszxSjfl> select();

    void update(KszxSjfl kszxSjfl);

    void delete(KszxSjfl kszxSjfl);

    void insert(KszxSjfl kszxSjfl);
}
