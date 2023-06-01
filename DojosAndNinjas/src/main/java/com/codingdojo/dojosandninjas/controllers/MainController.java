package com.codingdojo.dojosandninjas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.services.DojoService;
import com.codingdojo.dojosandninjas.services.NinjaService;

import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
	NinjaService ninjaService;
	@Autowired
	DojoService dojoService;
	

	@GetMapping("/")
	public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "index.jsp";
	}
	
	@PostMapping("/dojo/new")
	public String createNewDojo(@Valid @ModelAttribute("dojo")Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		else {
			dojoService.createDojo(dojo);
			return "redirect:/";
		}
	}
	
	@GetMapping("/ninja")
	public String newNinja(Model model, @ModelAttribute("ninja")Ninja ninja) {
		model.addAttribute("dojo", dojoService.allDojos());
		return "ninja.jsp";
	}
	
	@PostMapping("/ninja/new")
	public String createNewNinja(Model model, @Valid @ModelAttribute("ninja")Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return "ninja.jsp";
		}
		else {
			ninjaService.createNinja(ninja);
			return "redirect:/";
		}
	}
	
	@GetMapping("/dojo/{id}")
	public String showDojo(@PathVariable("id")Long id, Model model) {
		model.addAttribute("dojo",dojoService.findDojo(id));
		return "show.jsp";
	}
}
