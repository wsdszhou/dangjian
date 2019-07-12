package com.glut.dangjian.background.controller.exam;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.exam.service.SjglService;
import com.glut.dangjian.pojo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018-12-24
 * Time: 20:50
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
@Controller
@RequestMapping("kszx/cjgl/")
public class CjglController extends KszxController{

    @Autowired
    SjglService sjglService;

    @RequestMapping
    public String index(){
        return ROOT + "cjgl/index";
    }

    @ResponseBody
    @RequestMapping("loadStudentScore")
    public PageBean loadStudentScore(@RequestParam(value = "page",required = false,defaultValue = "1") int page
            , @RequestParam(value = "limit",required = false,defaultValue = "10") int limit){

        PageInfo pageInfo = sjglService.loadStudentScore(page,limit);

        return new PageBean(pageInfo.getTotal(),pageInfo.getList());
    }
}
