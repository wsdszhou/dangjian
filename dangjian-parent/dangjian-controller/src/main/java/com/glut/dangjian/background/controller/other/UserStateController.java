package com.glut.dangjian.background.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.other.service.UserStateService;
import com.glut.dangjian.entity.user.YhZtb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:06:47
* @version 1.0
*/
@Controller
@RequestMapping("back/userState/")
public class UserStateController {
    
    @Autowired 
    private UserStateService userStateService;

    @RequestMapping(value="loadUserStateAll", method=RequestMethod.POST)
    @ResponseBody
    public List<YhZtb> loadUserStateAll() {
        
        List<YhZtb> list =  userStateService.loadUserStateAll();
        return list;
    }
}
