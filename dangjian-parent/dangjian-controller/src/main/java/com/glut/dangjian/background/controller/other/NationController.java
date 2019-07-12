package com.glut.dangjian.background.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.other.service.NationService;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.entity.other.Zzmmb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:02:14
* @version 1.0
*/
@Controller
@RequestMapping("back/nation/")
public class NationController {
    
    @Autowired 
    private  NationService  nationService;
    
    @RequestMapping(value="loadNationAll", method=RequestMethod.POST)
    @ResponseBody
    public List<Mzb> loadNationAll() {
        
        List<Mzb> list =  nationService.loadNationAll();
        return list;
    }

}
