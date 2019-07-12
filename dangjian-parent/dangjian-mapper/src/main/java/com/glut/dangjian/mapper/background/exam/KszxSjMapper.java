package com.glut.dangjian.mapper.background.exam;

import com.glut.dangjian.entity.kszx.KszxSj;
import com.glut.dangjian.entity.kszx.TestPaperFilter;
import com.glut.dangjian.entity.kszx.view.ViewKszxTestPaper;
import com.glut.dangjian.entity.kszx.view.ViewKszxXscj;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/8
 * Time: 8:49 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/

public interface KszxSjMapper {

    List<ViewKszxTestPaper> selectAll(TestPaperFilter filter);

    int addKszxSj(ViewKszxTestPaper kszxTestPaper);

    KszxSj selectOneById(int sjid);

    int updateQuestionInfo(KszxSj sj);

    int updateTestPaperBaseInfo(ViewKszxTestPaper kszxTestPaper);

    void delete(int id);

    void updateTestPaperStatus(@Param("testpaperId") int testpaperId,@Param("status") int status);

    List<ViewKszxXscj> selectStudentScore();
}
