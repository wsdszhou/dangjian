package cn.zjw.controller;


import cn.zjw.pojo.Category;
import cn.zjw.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping("/listCategory")
    public String list(Model model){
        List<Category> categories = categoryService.list();
        model.addAttribute("categories",categories);
        return "admin/listCategory";
    }

    @RequestMapping("/editCategory")
    public String edit(Category category,Model model){
        model.addAttribute("category",category);
        return "admin/editCategory";
    }

    @RequestMapping("/updateCategory")
    public String update(Category category){
        categoryService.update(category);
        return "admin/updateCategory";
    }
}
