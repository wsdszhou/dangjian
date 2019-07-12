package com.glut.dangjian.background.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.other.service.PartyJobService;
import com.glut.dangjian.entity.other.Dnzwb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:06:47
* @version 1.0
*/
@Controller
@RequestMapping("back/partyJob/")
public class PartyJobController {
    
    @Autowired 
    private PartyJobService partyJobService;

    @RequestMapping(value="loadPartyJobAll", method=RequestMethod.POST)
    @ResponseBody
    public List<Dnzwb> loadPartyJobAll() {
        
        List<Dnzwb> list =  partyJobService.loadPartyJobAll();
        return list;
    }
}
