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

    @RequestMapping("/ellecttab")
    public ModelAndView ellecttab() {
        ModelAndView model = new ModelAndView("ellecttab");
        return model;
    }

    @RequestMapping("/ellectrestab")
    public ModelAndView ellectrestab() {
        ModelAndView model = new ModelAndView("ellectrestab");
        return model;
    }

    @RequestMapping("/agitplaces")
    public ModelAndView agitplaces() {
        ModelAndView model = new ModelAndView("agitplaces");
        return model;
    }

}
