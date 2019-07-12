package cn.zjw.controller;

import cn.zjw.pojo.User;
import cn.zjw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/listUser")
    public String list(Model model){
        List<User> users = userService.list();
        model.addAttribute("users",users);
        return "admin/listUser";
    }

    @RequestMapping("/editUser")
    public String edit(Model model,User user){
        model.addAttribute("user",user);
        return "admin/editUser";
    }

    @RequestMapping("/updateUser")
    public String updatte(User user){
        userService.update(user);
        return "admin/updateUser";
    }

}
