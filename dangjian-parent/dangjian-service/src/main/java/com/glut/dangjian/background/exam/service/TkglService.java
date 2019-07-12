package com.glut.dangjian.background.exam.service;

import com.glut.dangjian.entity.kszx.KszxSt;
import com.glut.dangjian.entity.kszx.KszxTmfl;
import com.glut.dangjian.entity.kszx.QuestionFilter;
import com.glut.dangjian.entity.kszx.view.ViewKszxStlb;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/9/29
 * Time: 12:40
 */

/*题库管理*/
public interface TkglService {
    /**
     * 加载试题分类
     * @return
     */
    List<KszxTmfl> loadCategories();

    /**
     * 添加题目分类
     * @param map
     * @return
     */
    int addCategorie(Map<String, Object> map);

    int updateCategorie(KszxTmfl kszxTmfl);

    void removeCategorie(int id);

    /**
     * 加载试题
     * @return ViewKszxStlb
     */
    List<ViewKszxStlb> loadQuestions(QuestionFilter questionFilter);

    /**
     * 加载试题详细信息
     * @param stid
     * @return
     */
    ViewKszxStlb loadQuestionDetail(int stid);

    void updateQuestion(KszxSt kszxSt);

    void addQuestion(KszxSt kszxSt);

    void removeQuestion(String[] id);

    void importQuestionExcel(File file);
}
