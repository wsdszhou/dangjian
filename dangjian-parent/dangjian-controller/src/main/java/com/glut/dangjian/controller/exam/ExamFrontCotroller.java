package com.glut.dangjian.controller.exam;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.common.Result;

import com.glut.dangjian.entity.kszx.KszxYhda;
import com.glut.dangjian.entity.kszx.KszxYhsj;
import com.glut.dangjian.entity.kszx.view.ViewExamQuestion;
import com.glut.dangjian.entity.kszx.view.ViewExamTestPaper;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.exam.ExamService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 5:04 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/

@Controller
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET})
@RequestMapping("/mobile/exam/")
public class ExamFrontCotroller {

    @Autowired
    ExamService examService;

    /**
     * 获取未考试卷列表
     *
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "TestPaperList")
    public Result getTestPaperList(@RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "5") int limit, HttpSession session) {
        Result result = new Result();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //检查传入参数是否合法
        if (page <= 0 || limit <= 0 || limit > 10) {
            result.setError(1);
            result.setMsg("分页数据不合法!");
            return result;
        }
        Map<String, Object> map = new HashMap<>();
        PageInfo<ViewExamTestPaper> pageInfo = examService.loadTestPaperList(yhb, page, limit);
        map.put("total", pageInfo.getTotal());
        map.put("list", pageInfo.getList());
        result.setError(0);
        result.setData(map);
        return result;
    }

    /**
     * 获取正在考的试卷列表
     *
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "TestPaperListTesting")
    public Result getTestPaperListTesting(@RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "5") int limit, HttpSession session) {
        Result result = new Result();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //检查传入参数是否合法
        if (page <= 0 || limit <= 0 || limit > 10) {
            result.setError(1);
            result.setMsg("分页数据不合法!");
            return result;
        }
        Map<String, Object> map = new HashMap<>();
        PageInfo<ViewExamTestPaper> pageInfo = examService.loadTestPaperListTesting(yhb, page, limit);
        map.put("total", pageInfo.getTotal());
        map.put("list", pageInfo.getList());
        result.setError(0);
        result.setData(map);
        return result;
    }

    /**
     * 获取已考的试卷
     *
     * @param page
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "TestPaperListTested")
    public Result getTestPaperListTested(@RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "5") int limit, HttpSession session) {
        Result result = new Result();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //检查传入参数是否合法
        if (page <= 0 || limit <= 0 || limit > 10) {
            result.setError(1);
            result.setMsg("分页数据不合法!");
            return result;
        }
        Map<String, Object> map = new HashMap<>();
        PageInfo<ViewExamTestPaper> pageInfo = examService.loadTestPaperListTested(yhb, page, limit);
        map.put("total", pageInfo.getTotal());
        map.put("list", pageInfo.getList());
        result.setError(0);
        result.setData(map);
        return result;
    }

    /**
     * 第一次获取试卷试题
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "QuestionList/{id}")
    public Result getQuestionList(@PathVariable int id, HttpSession session) {
        Result result = new Result();
        ViewExamTestPaper testPaper = examService.loadTestPaperById(id);
        //判断试卷是否有效
        if (testPaper == null || testPaper.getStatus() == 0) {
            result.setError(1);
            result.setMsg("试卷不存在！");
            return result;
        }
        if (new Date().before(testPaper.getStartTime())) {
            result.setMsg("考试未开始！");
            result.setError(1);
            return result;

        }
        if (new Date().after(testPaper.getEndTime())) {
            result.setMsg("考试已结束！");
            result.setError(1);
            return result;
        }

        //从session中获取用户信息
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //判断此次考试该用户是否已在作答
        KszxYhsj yhsj = examService.loadKszxYhsj(yhb.getUserId(), testPaper.getId());

        List<ViewExamQuestion> judgement = new ArrayList<>();
        List<ViewExamQuestion> single = new ArrayList<>();
        List<ViewExamQuestion> multiple = new ArrayList<>();
        Map<String, Object> data = new HashMap<>();

        if (yhsj == null) {
            //用户第一次答题
            //根据试卷加载试题
            List<ViewExamQuestion> list = examService.loadQuestion(testPaper);
            StringBuilder stringBuffer = new StringBuilder();
            //判断试卷是否有试题
            if (list != null && list.size() != 0) {
                for (ViewExamQuestion question : list) {
                    switch (question.getType()) {
                        case "判断题":
                            judgement.add(question);
                            stringBuffer.append(question.getId()).append(",");
                            break;
                        case "单选题":
                            single.add(question);
                            stringBuffer.append(question.getId()).append(",");
                            break;
                        case "多选题":
                            multiple.add(question);
                            stringBuffer.append(question.getId()).append(",");
                            break;
                    }
                }
                yhsj = new KszxYhsj();
                yhsj.setUserId(yhb.getUserId());
                yhsj.setTestpaperId(testPaper.getId());
                yhsj.setStartTime(new Date());
                Calendar specialDate = Calendar.getInstance();
                specialDate.setTime(yhsj.getStartTime()); //注意在此处将 specialDate 的值改为特定日期

                specialDate.add(Calendar.MINUTE, testPaper.getExamTime()); //特定时间的1年后
                yhsj.setEndTime(specialDate.getTime());

                yhsj.setQuestions(stringBuffer.substring(0, stringBuffer.length() - 1));
                //将用户试卷存入数据库
                examService.saveKszxYhsj(yhsj);
            } else {
                result.setError(1);
                result.setMsg("试卷无有效试题！");
                return result;
            }
        } else {
            // 错误码310表示用户已开始作答
            result.setError(310);
            result.setMsg("已开始答题！请到考试中列表查看！");
            return result;
        }
        data.put("testInfo",yhsj);
        data.put("testpaperInfo", testPaper);
        data.put("judgement", judgement);
        data.put("single", single);
        data.put("multiple", multiple);
        result.setError(0);
        result.setData(data);
        return result;
    }

    /**
     * 获取正在考的试卷问题
     *
     * @param id
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("getTestingQuestionList/{id}")
    public Result getTestingQuestionList(@PathVariable int id, HttpSession session) {
        Result result = new Result();
        //根据试卷ID获取试卷信息
        ViewExamTestPaper testPaper = examService.loadTestPaperById(id);
        //判断试卷是否有效
        if (testPaper == null || testPaper.getStatus() == 0) {
            result.setError(1);
            result.setMsg("试卷不存在！");
            return result;
        }
        if (new Date().before(testPaper.getStartTime())) {
            result.setMsg("考试未开始！");
            result.setError(1);
            return result;

        }
        if (new Date().after(testPaper.getEndTime())) {
            result.setMsg("考试已结束！");
            result.setError(1);
            return result;
        }
        //从session中获取用户信息
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //判断此次考试该用户是否已在作答
        KszxYhsj yhsj = examService.loadKszxYhsj(yhb.getUserId(), testPaper.getId());

        List<ViewExamQuestion> judgement = new ArrayList<>();
        List<ViewExamQuestion> single = new ArrayList<>();
        List<ViewExamQuestion> multiple = new ArrayList<>();
        Map<String, Object> data = new HashMap<>();

        //如果用户已开始答题，则从已保存的试题ID集合中抽取试题，包括已答题目的答案
        if (yhsj != null && yhsj.getQuestions() != null && !yhsj.getQuestions().equals("")) {
            List<ViewExamQuestion> list = examService.loadQuestionWithUserAnswer(yhsj);
            if (list != null && list.size() != 0) {
                for (ViewExamQuestion question : list) {
                    switch (question.getType()) {
                        case "判断题":
                            judgement.add(question);
                            break;
                        case "单选题":
                            single.add(question);
                            break;
                        case "多选题":
                            multiple.add(question);
                            break;
                    }
                }
            } else {
                result.setError(1);
                result.setMsg("试卷无有效试题！");
                return result;
            }
        }else {
            result.setMsg("用户未开始答题！");
            result.setError(1);
            return result;
        }
        data.put("testInfo",yhsj);
        data.put("testpaperInfo", testPaper);
        data.put("judgement", judgement);
        data.put("single", single);
        data.put("multiple", multiple);
        result.setError(0);
        result.setData(data);
        return result;
    }



    /**
     * 接收用户试卷答案
     *
     * @param data
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "AnswerQuestion")
    public Result answerQuestion(@RequestBody String data, HttpSession session) {
        JSONObject jsonObject = JSONObject.parseObject(data);
        System.out.println(jsonObject.toString());
        List<Map> list = jsonObject.getJSONArray("answer").toJavaList(Map.class);
        String testpaperId = jsonObject.getString("testpaperId");
        Integer isSubmit = jsonObject.getInteger("isSubmit");
        Result result = new Result();
        if(testpaperId == null || testpaperId.equals("")){
            result.setError(1);
            result.setMsg("试卷ID不能为空!");
            return result;
        }

        //从session中获取用户信息
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        //根据试卷ID获取试卷信息
        ViewExamTestPaper testPaper = examService.loadTestPaperById(Integer.valueOf(testpaperId));
        //判断试卷是否有效
        if (testPaper == null || testPaper.getStatus() == 0) {
            result.setError(1);
            result.setMsg("试卷不存在！");
            return result;
        }
        if (new Date().before(testPaper.getStartTime())) {
            result.setMsg("考试未开始！");
            result.setError(1);
            return result;

        }
        if (new Date().after(testPaper.getEndTime())) {
            result.setMsg("考试已结束！");
            result.setError(1);
            return result;
        }

        if(list.size()!=0){
            examService.insertOrUpdateStudentAnswer(yhb.getUserId(), testpaperId, list);
        }

        if(isSubmit == 0){
            return new Result(0, null, "答案已更新");
        }else {
            examService.calUserTestpaperScore(yhb.getUserId(),Integer.valueOf(testpaperId));
            return new Result(0, null, "考试完成");
        }

    }

}
