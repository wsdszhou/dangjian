package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxSt;
import com.glut.dangjian.entity.kszx.QuestionFilter;
import com.glut.dangjian.entity.kszx.view.ViewKszxStlb;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/10/3
 * Time: 12:34
 */
public interface KszxStMapper {

    List<ViewKszxStlb> selectQuestions(QuestionFilter questionFilter);

    ViewKszxStlb findQuestionDetailById(int stid);

    int updateQuestion(KszxSt kszxSt);

    int insertQuestion(KszxSt kszxSt);

    void deleteQuesyionById(int parseint);

    List<Map<String,Object>> selectQuestionsTypeCount();

    void updateQuestionsCategorie(@Param("oldFlid") int oldFlid,@Param("newFlid") int newFlid);
}
