package cn.zjw.controller;

import cn.zjw.pojo.PropertyValue;
import cn.zjw.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class PropertyValueController {

    @Autowired
    PropertyValueService propertyValueService;

    @RequestMapping("/listPropertyValue")
    public String list(Model model){
        List<PropertyValue> propertyValues = propertyValueService.list();
        model.addAttribute("propertyValues",propertyValues);
        return  "listPropertyValue";
    }

    @RequestMapping("/updatePropertyValue")
    public String update(PropertyValue propertyValue){
        propertyValueService.update(propertyValue);
        return "admin/updatePropertyValue";
    }

    @RequestMapping("/editPropertyValue")
    public String edit(PropertyValue propertyValue,Model model){
        model.addAttribute("propertyValue",propertyValue);
        return "admin/editPropertyValue";
    }

    @RequestMapping("/deletePropertyValue")
    public String delete(Integer id){
        propertyValueService.delete(id);
        return "admin/deletePropertyValue";
    }

    @RequestMapping("insertPropertyValue")
    public String insert(PropertyValue propertyValue){
        propertyValueService.insert(propertyValue);
        return "admin/propertyValueService";
    }
}
