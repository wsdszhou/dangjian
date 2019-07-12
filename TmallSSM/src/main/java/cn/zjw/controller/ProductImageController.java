package cn.zjw.controller;

import cn.zjw.pojo.ProductImage;
import cn.zjw.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class ProductImageController {

    @Autowired
    ProductImageService productImageService;

    @RequestMapping("/listProductImage")
    public String list(Model model){
        List<ProductImage> productImages =  productImageService.list();
        model.addAttribute("productImages",productImages);
        return "admin/listProductImage";
    }

    @RequestMapping("/insertProductImage")
    public String insert(ProductImage productImage){
        productImageService.insert(productImage);
        return "admin/insertProductImage";
    }

    @RequestMapping("/updateProductImage")
    public String update(ProductImage productImage){
        productImageService.update(productImage);
        return "admin/updateProductImage";
    }

    @RequestMapping("/editProductImage")
    public String edit(Model model,ProductImage productImage){
        model.addAttribute("productImage",productImage);
        return "admin/editProductImage";
    }
}
