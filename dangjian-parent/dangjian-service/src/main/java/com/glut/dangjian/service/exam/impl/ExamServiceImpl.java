package com.glut.dangjian.service.exam.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.kszx.KszxYhsj;
import com.glut.dangjian.entity.kszx.view.ViewExamQuestion;
import com.glut.dangjian.entity.kszx.view.ViewExamTestPaper;
import com.glut.dangjian.entity.kszx.view.ViewKszxTestPaper;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.exam.ViewExamMapper;
import com.glut.dangjian.service.exam.ExamService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 5:27 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
@Service("examService")
@Transactional(propagation=Propagation.NESTED)
public class ExamServiceImpl implements ExamService {

    @Autowired
    ViewExamMapper examMapper;

    /**
     * 获取用户未考的试卷
     * @param yhb
     * @param page
     * @param limit
     * @return
     */
    @Override
    @Cacheable(value="examManageCache", key="'#p0.getUserId()'+'--'+'#p1'+'--'+'#p2'+'#root.methodName'"  )
    public PageInfo<ViewExamTestPaper> loadTestPaperList(Yhb yhb,int page, int limit) {
        PageHelper.startPage(page,limit);
        List<ViewExamTestPaper> list = examMapper.selectViewExamTestPaperByUserId(yhb.getUserId());
        return new PageInfo<>(list);
    }

    /**
     * 获取用户已考的试卷
     * @param yhb
     * @param page
     * @param limit
     * @return
     */
    @Override
    @Cacheable(value="examManageCache", key="'#p0.getUserId()'+'#p1'+'--'+'#p2'+'#root.methodName'"  )
    public PageInfo<ViewExamTestPaper> loadTestPaperListTested(Yhb yhb,int page, int limit) {
        PageHelper.startPage(page,limit);
        List<ViewExamTestPaper> list = examMapper.selectViewExamTestPaperTestedByUserId(yhb.getUserId());
        return new PageInfo<>(list);
    }


    /**
     * 获取正在考的试卷
     * @param yhb
     * @param page
     * @param limit
     * @return
     */
    @Override
    public PageInfo<ViewExamTestPaper> loadTestPaperListTesting(Yhb yhb, int page, int limit) {
        PageHelper.startPage(page,limit);
        List<ViewExamTestPaper> list = examMapper.selectViewExamTestPaperTestingByUserId(yhb.getUserId());
        return new PageInfo<>(list);
    }

    /**
     * 计算试卷得分
     * @param userId
     * @param testpaperId
     */
    @Override
    public void calUserTestpaperScore(String userId, Integer testpaperId) {
        //1.查出用户当前试卷
        ViewExamTestPaper viewExamTestPaper = examMapper.selectViewExamTestPaperById(testpaperId);
        System.out.println(viewExamTestPaper);
        //查出根据用户生成的试卷题目
        KszxYhsj yhsj = examMapper.selectYhsj(userId,testpaperId);

        //2.查出用户提交的所有答案与试卷的答案
        List<Map<String,Object>> questionAndAnswer = examMapper.selectUserAnswerAndTestpaperQuestionAnswer(userId,testpaperId,yhsj.getQuestions());
        //3.查出试卷每种题型的分数
        int judgement = 0;
        int single = 0;
        int multiple = 0;

        for(Map<String,Object> map :questionAndAnswer){
            switch (map.get("questionType").toString()){
                case "判断题":
                    if(map.get("studentAnswer") != null && map.get("questionAnswer").equals(map.get("studentAnswer"))){
                        judgement++;
                    }
                    break;
                case "单选题":
                    if(map.get("studentAnswer") != null && map.get("questionAnswer").equals(map.get("studentAnswer"))){
                        single++;
                    }
                    break;
                case "多选题":
                    if(map.get("studentAnswer") != null && map.get("questionAnswer").equals(map.get("studentAnswer"))){
                        multiple++;
                    }
                    break;
            }
        }

        //计算总分
        int totalScore = judgement*viewExamTestPaper.getJudgementScore()+single*viewExamTestPaper.getSingleScore()+multiple*viewExamTestPaper.getMultipleScore();

        yhsj.setStudentScore(totalScore);

        examMapper.updateYhsjXscj(yhsj);

    }

    @Override
    @Cacheable(value="examManageCache", key="'#p0'+'#root.methodName'"  )
    public ViewExamTestPaper loadTestPaperById(int id) {
        return examMapper.selectViewExamTestPaperById(id);
    }

    @Override
    public List<ViewExamQuestion> loadQuestion(ViewExamTestPaper testPaper) {
        List<ViewExamQuestion> questionList = new ArrayList<>();
        //判断该张试卷的组卷方式
        if(testPaper.getGenerateWay() == 1){//固定试题方式
            //根据试卷的ID将试题都查询出来
            questionList = examMapper.selectViewExamQuestionFixNoAnswer(testPaper.getId());
        }else if(testPaper.getGenerateWay() == 2){
            Random random = new Random();
            List<Integer> judgement;
            List<Integer> single;
            List<Integer> multiple;
            int loop;
            List<Integer> questionId = new ArrayList<>();
            if(testPaper.getJudgementNum() != 0){
                judgement = examMapper.selectJudgementId();
                loop = testPaper.getJudgementNum();
                while (judgement.size() > 0 && loop>0){
                    int tempid = random.nextInt(loop);
                    questionId.add(judgement.get(tempid));
                    judgement.remove(tempid);
                    loop--;
                }
            }
            if(testPaper.getSingleNum() != 0){
                single = examMapper.selectSingleId();
                loop = testPaper.getSingleNum();
                while (single.size() > 0 && loop>0){
                    int tempid = random.nextInt(loop);
                    questionId.add(single.get(tempid));
                    single.remove(tempid);
                    loop--;
                }
            }
            if(testPaper.getMultipleNum() != 0){
                multiple = examMapper.selectMultipleId();
                loop = testPaper.getMultipleNum();
                while (multiple.size() > 0 && loop>0){
                    int tempid = random.nextInt(loop);
                    questionId.add(multiple.get(tempid));
                    multiple.remove(tempid);
                    loop--;
                }
            }

            if(questionId.size() != 0){
                questionList = examMapper.selectViewExamQuestionFixNoAnswerByIdList(questionId);
            }

        }
        return questionList;
    }

    @Override
    @Cacheable(value="examManageCache", key="'#p0'+'--'+'#p1'+'#root.methodName'"  )
    public KszxYhsj loadKszxYhsj(String userId, int id) {
        return examMapper.selectYhsj(userId,id);
    }

    @Override
    @CacheEvict(value="examManageCache",allEntries=true)
    public void saveKszxYhsj(KszxYhsj yhsj) {
        examMapper.insertKszxYhsj(yhsj);
    }

    @Override
    public List<ViewExamQuestion> loadQuestionWithUserAnswer(KszxYhsj yhsj) {
        return examMapper.selectViewExamQuestionWithUserAnswer(yhsj);
    }

    @Override
    @CacheEvict(value="examManageCache",allEntries=true)
    public void insertOrUpdateStudentAnswer(String userId, String testpaperId, List<Map> list) {
        examMapper.modifyKszxYhda(userId,testpaperId,list);
    }



}
