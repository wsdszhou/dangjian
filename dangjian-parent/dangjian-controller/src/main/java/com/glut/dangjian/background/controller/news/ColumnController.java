package com.glut.dangjian.background.controller.news;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.news.service.LmService;
import com.glut.dangjian.entity.other.Lmb;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("back/news/lm/")
public class ColumnController {

    @Autowired
    private LmService lmService;
    
    /**
     * 加载一级栏目
     * @return
     */
    @RequestMapping("loadFirstLmList")
    @ResponseBody
    public String loadFirstLmList() {
        List<Lmb> firstLmbList = lmService.getFirstLmbList();
        String json = JSONArray.fromObject(firstLmbList).toString();
        return json;
        
    }
    
    /**
     * 加载子栏目
     * @param lmId
     * @return
     */
    @RequestMapping("loadChildrenLmList")
    @ResponseBody
    public String  loadChildrenLmList(@RequestParam("id") Integer  lmId, HttpSession session) {
        
        List<Lmb> childrenLmbListByFid  = null;
        // lmId为0情况，加载非首栏
        if(lmId == 0 ) {
            childrenLmbListByFid = lmService.getNotFirstLmbList();
        }else { // 获取指定的子栏目
            
            // 设置当前栏目
            session.setAttribute("currentLmId", lmId);
            
            System.err.println(lmId);
            
            childrenLmbListByFid = lmService.getChildrenLmbListByFid(lmId);
        }
        String json = JSONArray.fromObject(childrenLmbListByFid).toString();
        return json;
    }
    
    
}
