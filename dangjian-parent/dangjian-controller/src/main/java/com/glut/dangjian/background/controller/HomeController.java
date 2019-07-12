package com.glut.dangjian.background.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author lanlan
 *
 */
@Controller
public class HomeController {

    @RequestMapping("/background/home")
    public String gotoBackgroundLogin() {
        return "background/login";
    }
    
}
