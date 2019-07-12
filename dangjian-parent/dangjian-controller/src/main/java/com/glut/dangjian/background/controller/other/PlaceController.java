package com.glut.dangjian.background.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.other.service.JgService;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Jgb;

@Controller
@RequestMapping("back/other/")
public class PlaceController {

    @Autowired
    private JgService jgService;
    
    /**
     * 通过ajax加载所有部门
     * @return
     */
    @RequestMapping(value="loadJg",method=RequestMethod.GET)
    @ResponseBody
    public List<Jgb> loadBmByAjax() {
        
         List<Jgb> jgList = jgService.loadJgList();
        return jgList;
    }
    
    /**
     * 通过ajax加载所有部门
     * @return
     */
    @RequestMapping(value="loadBmByListAll",method=RequestMethod.POST)
    @ResponseBody
    public List<Jgb> loadBmByListAll() {
        
         List<Jgb> jgList = jgService.loadJgList();
        return jgList;
    }
}
