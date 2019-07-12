package com.glut.dangjian.background.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.other.service.EducationService;
import com.glut.dangjian.entity.other.Xlb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:36:47
* @version 1.0
* 学历控制
*/
@Controller
@RequestMapping("back/education/")
public class EducationController {
    
    @Autowired
    private EducationService educationService;

    @RequestMapping(value="loadEducationAll", method=RequestMethod.POST)
    @ResponseBody
    public List<Xlb> loadEducationAll(){
        
        List<Xlb> list = educationService.loadEducationAll();
        return list ;
    }
}
