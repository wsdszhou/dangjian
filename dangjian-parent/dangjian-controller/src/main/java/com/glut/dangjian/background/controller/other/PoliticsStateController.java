package com.glut.dangjian.background.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.other.service.PoliticsStateService;
import com.glut.dangjian.entity.other.Zzmmb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:49:01
* @version 1.0
*/
@Controller
@RequestMapping("back/politicsState/")
public class PoliticsStateController {

    @Autowired 
    private  PoliticsStateService  politicsStateService;

    @RequestMapping(value="loadPoliticsStateAll", method=RequestMethod.POST)
    @ResponseBody
    public List<Zzmmb> loadPoliticsStateAll() {
        
        List<Zzmmb> list =  politicsStateService.loadPoliticsStateAll();
        return list;
    }
}
