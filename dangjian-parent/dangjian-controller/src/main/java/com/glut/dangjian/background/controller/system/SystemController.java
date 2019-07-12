package com.glut.dangjian.background.controller.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.authority.service.FunctionService;
import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.user.Yhb;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("back/")
public class SystemController {

    @Autowired
    private FunctionService functionService;
    
    @RequestMapping("loadMenu")
    @ResponseBody 
    public String loadMune(HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        List<Function> functions = functionService.getFunctionList(yhb);
        // 将数据封装成前端指定的json格式
        JSONObject object = null;
        JSONArray json = new JSONArray();
        for(Function function : functions) {  
            object = new JSONObject();
            object.put("id", function.getMkId());
            object.put("name", function.getMkMc());
            object.put("page", function.getMkUrl());
//            pid和FID为父id，上级菜单id
            object.put("pId", function.getMkFId());
//            icon为图标
            object.put("icon", function.getMkIcon());
            json.add(object);
         }
        return json.toString();
    }
    
   
}
