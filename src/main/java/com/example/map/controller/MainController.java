package com.example.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by anton on 05.02.2018.
 */
@Controller
public class MainController {
    @RequestMapping("/")
    public ModelAndView mainpage() {
        ModelAndView model = new ModelAndView("index");
        return model;
    }

    @RequestMapping("/electresult")
    public ModelAndView electresult() {
        ModelAndView model = new ModelAndView("electresult");
        return model;
    }

    @RequestMapping("/test")
    public ModelAndView testpage() {
        ModelAndView model = new ModelAndView("test");
        return model;
    }
}
