package com.codingdojo.lookify.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.models.Lookify;
import com.codingdojo.lookify.services.LookifyService;

import jakarta.validation.Valid;

@Controller
public class LookifyController {

	@Autowired
	LookifyService lookifyService;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		List<Lookify> lookifys = lookifyService.allLookifys();
		model.addAttribute("lookifys", lookifys);
		return "dashboard.jsp";
	}
	
	@GetMapping("/topten")
	public String topTen(Model model) {
		List<Lookify> songs = lookifyService.topTenSongs();
		model.addAttribute("songs",songs);
		return "topten.jsp";
	}
	@GetMapping("/songs/new")
	public String newSong(@ModelAttribute("lookify") Lookify lookify) {
		return "new.jsp";
	}
	@PostMapping("/songs")
	public String createLookify(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result) {
		if (result.hasErrors()) {
			return "new.jsp";
		}
		lookifyService.createLookify(lookify);
		return "redirect:/dashboard";
	}
	@GetMapping("/songs/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Lookify lookify = lookifyService.oneLookify(id);
		model.addAttribute("lookify", lookify);
		return "show.jsp";
	}
	@PostMapping("/dashboard")
	public String dashboard(@RequestParam("artist") String artist, Model model) {
		model.addAttribute("artist", artist);
		return "redirect:/search/"+artist;
	}
	
	@GetMapping("/search/{artist}")
	public String searchResult(@PathVariable("artist") String artist, Model model) {
		model.addAttribute("songs", lookifyService.searchLookify(artist));
		model.addAttribute("searchTerm", artist);
		return "search.jsp";
	}
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id")Long id) {
		lookifyService.deleteLookify(id);
		return "redirect:/dashboard";
	}
}	
