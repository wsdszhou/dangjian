package cn.zjw.controller;

import cn.zjw.pojo.Property;
import cn.zjw.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class PropertyController {

    @Autowired
    PropertyService propertyService;

    @RequestMapping("/listProperty")
    public String list(Model model){
        List<Property> properties = propertyService.list();
        model.addAttribute("properties",properties);
        return  "listProperty";
    }

    @RequestMapping("/updateProperty")
    public String update(Property property){
        propertyService.update(property);
        return "admin/updateProperty";
    }

    @RequestMapping("/editProperty")
    public String edit(Property property,Model model){
        model.addAttribute("property",property);
        return "admin/editProperty";
    }

    @RequestMapping("/deleteProperty")
    public String delete(Integer id){
        propertyService.delete(id);
        return "admin/deleteProperty";
    }

    @RequestMapping("insertProperty")
    public String insert(Property property){
        propertyService.insert(property);
        return "admin/propertyService";
    }
}
