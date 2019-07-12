package com.glut.dangjian.background.controller.exam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.exam.service.SjglService;
import com.glut.dangjian.entity.kszx.*;
import com.glut.dangjian.entity.kszx.view.ViewKszxTestPaper;
import com.glut.dangjian.pojo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/8
 * Time: 4:29 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/

@Controller
@RequestMapping("kszx/sjgl/")
public class SjglController extends KszxController {

    @Autowired
    SjglService sjglService;

    /**
     * 试卷管理主页
     *
     * @return
     */
    @RequestMapping("index")
    public String index() {
        return ROOT + "sjgl/TestPaperManager";
    }

    @RequestMapping("testPaperCategorieManager")
    public String testPaperCategorieManager() {
        return ROOT + "sjgl/testPaperCategorieManager";
    }

    /**
     * 添加试卷view
     *
     * @return
     */
    @RequestMapping("addTestPaper")
    public String addTestPaperView() {
        return ROOT + "sjgl/addTestPaper";
    }

    /**
     * 配置试卷基本信息view
     *
     * @param sjid
     * @param mv
     * @return
     */
    @RequestMapping("editTestPaper/{sjid}")
    public ModelAndView editTestPaperView(@PathVariable int sjid, ModelAndView mv) {
        KszxSj kszxSj = sjglService.loadTestPaper(sjid);
        List<KszxSjfl> kszxSjflList = sjglService.loadCategories();
        mv.addObject("kszxSj", kszxSj);
        mv.addObject("sjfls", kszxSjflList);
        mv.setViewName(ROOT + "sjgl/editTestPaper");
        return mv;
    }

    @ResponseBody
    @RequestMapping("editTestPaperBaseInfo")
    public String editTestPaperBaseInfo(@RequestParam("data") String testPaper) {
        ViewKszxTestPaper kszxTestPaper = JSONObject.parseObject(testPaper, ViewKszxTestPaper.class);
        System.err.println(kszxTestPaper);
        sjglService.updateTestPaperBaseInfo(kszxTestPaper);
        return "ok";
    }

    /**
     * 固定试题编辑VIEW
     *
     * @param id
     * @param mv
     * @return
     */
    @RequestMapping("fixChooseQuestion/{id}")
    public ModelAndView fixChooseQuestion(@PathVariable int id, ModelAndView mv) {
        //1.根据传入的试卷ID查找题目
        List<KszxSjGdst> list = sjglService.findAllFixQuestionById(id);
        System.out.println(list);
        mv.addObject("sjid", id);
        mv.addObject("selectedQuestion", list == null ? new ArrayList<>() : JSON.toJSONString(list));
        mv.setViewName(ROOT + "sjgl/fixChooseQuestion");
        return mv;
    }

    /**
     * 随机试题编辑VIEW
     *
     * @param id
     * @param mv
     * @return
     */
    @RequestMapping("randomChooseQuestion/{id}")
    public ModelAndView randomChooseQuestion(@PathVariable int id, ModelAndView mv) {
        List<KszxSjSjst> list = sjglService.findAllRandomRuleById(id);
        List<Map<String, Object>> questioncount = sjglService.loadQuestionCount();
        mv.addObject("questionCount", JSON.toJSONString(questioncount));
        mv.addObject("selectedRule", JSON.toJSONString(list));
        mv.addObject("sjid", id);
        mv.setViewName(ROOT + "sjgl/randomChooseQuestion");
        return mv;
    }

    /**
     * 添加试卷基础信息
     *
     * @param testPaper
     * @return
     */
    @ResponseBody
    @RequestMapping("addTestPaperBaseInfo")
    public String addTestPaperBaseInfo(@RequestParam("data") String testPaper) {
        ViewKszxTestPaper kszxTestPaper = JSONObject.parseObject(testPaper, ViewKszxTestPaper.class);
        sjglService.addTestPaperBaseInfo(kszxTestPaper);
        System.out.println(kszxTestPaper);
        Map<String, Object> map = new HashMap<>();
        map.put("key", kszxTestPaper.getId());
        if (kszxTestPaper.getZjfs() == 1) {
            map.put("url", "fixChooseQuestion");
        } else if (kszxTestPaper.getZjfs() == 2) {
            map.put("url", "randomChooseQuestion");
        } else {
            return "param error";
        }
        return JSON.toJSONString(map);
    }

    /**
     * 添加或删除固定试题
     *
     * @param action
     * @param data
     * @return
     */
    @ResponseBody
    @RequestMapping("modifyFixQuestion/{action}")
    public String modifyFixQuestion(@PathVariable String action, String data) {
        KszxSjGdst gdst = JSONObject.parseObject(data, KszxSjGdst.class);
        System.out.println(gdst);
        if (action.equals("add")) {
            sjglService.addFixQuestion(gdst);
        } else if (action.equals("del")) {
            sjglService.deleteFixQuestion(gdst);
        }
        return "ok";
    }

    /**
     * 修改或删除随机试题规则
     *
     * @param action
     * @param data
     * @return
     */
    @ResponseBody
    @RequestMapping("modifyRandomRule/{action}")
    public String modifyRandomRule(@PathVariable String action, String data) {
        KszxSjSjst sjst = JSONObject.parseObject(data, KszxSjSjst.class);
        if (action.equals("add")) {
            sjglService.addRandomQuestion(sjst);
            sjglService.updateRandomQuestionCount(sjst.getSj());
            return JSON.toJSONString(sjst);
        } else if (action.equals("del")) {
            sjglService.deleteRandomQuestion(sjst.getId());
            sjglService.updateRandomQuestionCount(sjst.getSj());
            return "ok";
        } else if (action.equals("update")) {
            sjglService.updateRandomQuestion(sjst);
            sjglService.updateRandomQuestionCount(sjst.getSj());
            return "ok";
        }
        return "error";
    }

    /**
     * 重新统计试卷总题目数量和分数
     *
     * @param sjid
     * @return
     */
    @ResponseBody
    @RequestMapping("updateFixQuestionCount/{sjid}")
    public String updateFixQuestionCount(@PathVariable int sjid) {
        List<Map<String, Object>> list = sjglService.updateFixQuestionCount(sjid);
        System.out.println(list);
        return JSON.toJSONString(list);
    }


    /**
     * 根据条件筛选试卷列表
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("loadTestPaperList")
    public PageBean loadTestPaperList(TestPaperFilter filter) {
        PageInfo<ViewKszxTestPaper> pageInfo = sjglService.loadTestPaperList(filter);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 加载试卷分类
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "loadCategories")
    public String loadCategories() {
        List<KszxSjfl> list = sjglService.loadCategories();
        return JSON.toJSONString(list);
    }

    @ResponseBody
    @RequestMapping("modifyCategorie")
    public String modifyCategorie(KszxSjfl kszxSjfl) {
        sjglService.modifyCategorie(kszxSjfl);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("deleteCategorie")
    public String deleteCategorie(KszxSjfl kszxSjfl) {
        sjglService.deleteCategorie(kszxSjfl);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("addCategorie")
    public String addCategorie(KszxSjfl kszxSjfl) {
        kszxSjfl.setParentId(0);
        sjglService.addCategorie(kszxSjfl);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("deleteTestPaper")
    public String deleteTestPaper(String data) {
        KszxSj kszxSj = JSONObject.parseObject(data, KszxSj.class);
        sjglService.deleteTestPaper(kszxSj);
        return "del";
    }

    @ResponseBody
    @RequestMapping(value = "modifyTestpaperStatus", method = RequestMethod.POST)
    public String modifyTestpaperStatus(@RequestParam("testpaperId") int testpaperId, @RequestParam("status") int status) {

        sjglService.modifyTestpaperStatus(testpaperId, status);

        return "modify";
    }

}