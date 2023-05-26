package com.codingdojo.safetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.safetravels.models.Travel;
import com.codingdojo.safetravels.services.TravelService;

import jakarta.validation.Valid;

@Controller
public class TravelController {

	@Autowired
	TravelService travelService;
	
	@GetMapping("/")
	public String newTravel(Model model,@ModelAttribute("travel") Travel travel) {
		List<Travel> travels = travelService.allTravels();
		model.addAttribute("travels", travels);
		return "index.jsp";
	}
	@PostMapping("/travels")
	public String createTravel(@Valid @ModelAttribute("travel") Travel travel, BindingResult result) {
		if (result.hasErrors()) {
			return "index.jsp";
		}
		travelService.createTravel(travel);
		return "redirect:/";
	}
	
	@GetMapping("/show/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Travel travel = travelService.oneTravel(id);
		model.addAttribute("travel", travel);
		return "show.jsp";
	}
	@GetMapping("/travel/{id}/edit")
	public String edit(@PathVariable("id")Long id, Model model) {
		Travel travel = travelService.oneTravel(id);
		model.addAttribute("travel",travel);
		return "edit.jsp";
	}
	@PostMapping("/travels/{id}")
	public String updateTravel(@Valid @ModelAttribute("travel") Travel travel, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		travelService.updateTravel(travel);
		return "redirect:/";
	}
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id")Long id) {
		travelService.deleteTravel(id);
		return "redirect:/";
	}
}
