package com.glut.dangjian.mapper.exam;

import com.glut.dangjian.entity.kszx.KszxYhsj;
import com.glut.dangjian.entity.kszx.view.ViewExamQuestion;
import com.glut.dangjian.entity.kszx.view.ViewExamTestPaper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 6:38 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public interface ViewExamMapper {
    List<ViewExamTestPaper> selectViewExamTestPaper();

    ViewExamTestPaper selectViewExamTestPaperById(int id);

    List<ViewExamQuestion> selectViewExamQuestionFixNoAnswer(int id);

    List<Integer> selectJudgementId();

    List<Integer> selectSingleId();

    List<Integer> selectMultipleId();

    List<ViewExamQuestion> selectViewExamQuestionFixNoAnswerByIdList(List<Integer> questionId);

    KszxYhsj selectYhsj(@Param(("userId")) String userId,@Param("testpaperId") int id);

    void insertKszxYhsj(KszxYhsj yhsj);

    List<ViewExamQuestion> selectViewExamQuestionWithUserAnswer(KszxYhsj yhsj);

    void modifyKszxYhda(@Param("userId") String userId,@Param("testpaperId") String testpaperId,@Param("list") List<Map> list);

    /**
     * 获取未考的试卷列表
     * @param userId
     * @return
     */
    List<ViewExamTestPaper> selectViewExamTestPaperByUserId(String userId);

    /**
     * 获取已考完的试卷列表
     * @param userId
     * @return
     */
    List<ViewExamTestPaper> selectViewExamTestPaperTestedByUserId(String userId);

    /**
     * 正在考的
     * @param userId
     * @return
     */
    List<ViewExamTestPaper> selectViewExamTestPaperTestingByUserId(String userId);

    List<Map<String, Object>> selectUserAnswerAndTestpaperQuestionAnswer(@Param("userId") String userId,@Param("testpaperId") Integer testpaperId,@Param("questions") String questions);

    void updateYhsjXscj(KszxYhsj yhsj);
}
