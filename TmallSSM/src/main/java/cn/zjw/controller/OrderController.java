package cn.zjw.controller;

import cn.zjw.pojo.Order;
import cn.zjw.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Controller
@RequestMapping("/admin")
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping("/listOrder")
    public String list(Model model){
        List<Order> orders = orderService.list();
        model.addAttribute("orders",orders);
        return "admin/listOrder";
    }

    @RequestMapping("/editOrder")
    public String edit(Order order,Model model){
        model.addAttribute("order",order);
        return "admin/editOrder";
    }

    @RequestMapping("/updateOrder")
    public String update(Order order){
        orderService.update(order);
        return "admin/updateOrder";
    }
}
