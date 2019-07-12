package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxTmfl;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/9/29
 * Time: 12:59
 */
public interface KszxStflMapper {

    List<KszxTmfl> selectCategories();

    int insertCategorie(Map<String, Object> map);

    int updateCategorie(KszxTmfl kszxTmfl);

    int deleteCategorieById(int id);

    List<KszxTmfl> selectCategoriesByPid(int pid);

    List<Map<String, Integer>> selectCategoriesToHashMap();
}
