package com.glut.dangjian.background.exam.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.kszx.*;
import com.glut.dangjian.entity.kszx.view.ViewKszxTestPaper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/8
 * Time: 7:08 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public interface SjglService {

    List<KszxSjfl> loadCategories();

    void modifyCategorie(KszxSjfl kszxSjfl);

    void deleteCategorie(KszxSjfl kszxSjfl);

    void addCategorie(KszxSjfl kszxSjfl);

    /* 新 */

    PageInfo<ViewKszxTestPaper> loadTestPaperList(TestPaperFilter filter);

    void addTestPaperBaseInfo(ViewKszxTestPaper kszxTestPaper);

    List<KszxSjGdst> findAllFixQuestionById(int id);

    void addFixQuestion(KszxSjGdst gdst);

    void deleteFixQuestion(KszxSjGdst gdst);

    List<Map<String,Object>> updateFixQuestionCount(int sjid);

    KszxSj loadTestPaper(int sjid);

    void updateTestPaperBaseInfo(ViewKszxTestPaper kszxTestPaper);

    List<KszxSjSjst> findAllRandomRuleById(int id);

    List<Map<String, Object>> loadQuestionCount();

    void addRandomQuestion(KszxSjSjst sjst);

    void deleteRandomQuestion(int sjstid);

    void updateRandomQuestion(KszxSjSjst sjst);

    void updateRandomQuestionCount(int sj);

    void deleteTestPaper(KszxSj kszxSj);

    void modifyTestpaperStatus(int testpaperId,int status);

    PageInfo loadStudentScore(int page, int limit);
}
