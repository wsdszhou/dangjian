package com.glut.dangjian.service.exam;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.kszx.KszxYhsj;
import com.glut.dangjian.entity.kszx.view.ViewExamQuestion;
import com.glut.dangjian.entity.kszx.view.ViewExamTestPaper;
import com.glut.dangjian.entity.user.Yhb;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 5:27 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/

public interface ExamService {

    /**
     * 分页加载试卷列表
     * @param page
     * @param limit
     * @return
     */
    PageInfo<ViewExamTestPaper> loadTestPaperList(Yhb yhb, int page, int limit);

    /**
     * 加载已考试卷
     * @param yhb
     * @param page
     * @param limit
     * @return
     */
    PageInfo<ViewExamTestPaper> loadTestPaperListTested(Yhb yhb,int page, int limit);

    /**
     * 根据试卷ID加载一张试卷
     * @param id
     * @return
     */
    ViewExamTestPaper loadTestPaperById(int id);

    /**
     * 根据试卷ID加载试卷的试题
     * @param testPaper
     * @return
     */
    List<ViewExamQuestion> loadQuestion(ViewExamTestPaper testPaper);


    /**
     * 根据用户ID和试卷ID加载 用户试卷信息
     * @param userId
     * @param id
     * @return
     */
    KszxYhsj loadKszxYhsj(String userId, int id);


    /**
     * 保存用户试卷
     * @param yhsj
     * @return
     */
    void saveKszxYhsj(KszxYhsj yhsj);

    /**
     * 根据用户ID和试卷ID加载用户作答的试题和已达试题的答案
     * @param yhsj
     * @return
     */
    List<ViewExamQuestion> loadQuestionWithUserAnswer(KszxYhsj yhsj);

    /**
     * 新增或更新用户试卷答案
     * @param userId
     * @param testpaperId
     * @param list
     */
    void insertOrUpdateStudentAnswer(String userId, String testpaperId, List<Map> list);

    PageInfo<ViewExamTestPaper> loadTestPaperListTesting(Yhb yhb, int page, int limit);

    /**
     * 计算用户考试分数
     * @param userId
     * @param testpaperId
     */
    void calUserTestpaperScore(String userId, Integer testpaperId);
}
