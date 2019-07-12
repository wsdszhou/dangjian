package cn.zjw.controller;

import cn.zjw.pojo.Product;
import cn.zjw.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping("/listproduct")
    public String list(Model model){
        List<Product> products = productService.list();
        model.addAttribute("products",products);
        return  "listproduct";
    }

    @RequestMapping("/updateproduct")
    public String update(Product product){
        productService.update(product);
        return "admin/updateproduct";
    }

    @RequestMapping("/editproduct")
    public String edit(Product product,Model model){
        model.addAttribute("product",product);
        return "admin/editproduct";
    }

    @RequestMapping("/deleteproduct")
    public String delete(Integer id){
        productService.delete(id);
        return "admin/deleteproduct";
    }

    @RequestMapping("insertproduct")
    public String insert(Product product){
        productService.insert(product);
        return "admin/productService";
    }
}
