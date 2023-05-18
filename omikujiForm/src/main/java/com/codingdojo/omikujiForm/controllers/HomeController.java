package com.codingdojo.omikujiForm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
// New import needed!

@Controller
public class HomeController {
    @RequestMapping("/")
    public String index() {
        return "redirect:/omikuji";
    }
    @RequestMapping("/omikuji")
    public String home() {
        return "index.jsp";
    }
    @RequestMapping("/form")
    public String login(@RequestParam(value="select") int select, 
    		@RequestParam(value="city") String city,
    		@RequestParam(value="person") String person,
    		@RequestParam(value="hobby") String hobby,
    		@RequestParam(value="living") String living,
    		@RequestParam(value="nice") String nice,
    		HttpSession session){
    	
    	session.setAttribute("select", select);
    	session.setAttribute("person", person);
    	session.setAttribute("city", city);
    	session.setAttribute("hobby", hobby);
    	session.setAttribute("living", living);
    	session.setAttribute("nice", nice);
    	
    	return "redirect:/omikuji/show";
    }
    @RequestMapping("/omikuji/show")
    public String show() {
    	return "show.jsp";
    }
}
