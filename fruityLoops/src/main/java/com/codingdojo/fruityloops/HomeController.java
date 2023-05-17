package com.codingdojo.fruityloops;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
// New import needed!
import org.springframework.ui.Model;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String index(Model model) {
    	
    	ArrayList<Item> fruits = new ArrayList<>();
    	
    	fruits.add(new Item("Kiwi",1.5));
    	fruits.add(new Item("Mango",2.0));
    	fruits.add(new Item("Goji Berries",4.0));
    	fruits.add(new Item("Guava",0.75));
    	
    	model.addAttribute("fruits",fruits);
    	
        return "index.jsp";
    }
}
