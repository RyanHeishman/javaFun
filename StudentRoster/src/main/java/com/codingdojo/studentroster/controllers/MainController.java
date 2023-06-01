package com.codingdojo.studentroster.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.studentroster.models.Dorm;
import com.codingdojo.studentroster.models.Student;
import com.codingdojo.studentroster.services.DormService;
import com.codingdojo.studentroster.services.StudentService;

import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
	StudentService studentService;
	@Autowired
	DormService dormService;
	
	@GetMapping("/")
	public String index(Model model) {
		List<Dorm> dorms = dormService.allDorms();
		model.addAttribute("dorm",dorms);
		return "index.jsp";
	}

	@GetMapping("/dorm")
	public String newDorm(@ModelAttribute("dorm") Dorm dorm) {
		return "newDorm.jsp";
	}
	
	@PostMapping("/dorm/new")
	public String createNewDorm(@Valid @ModelAttribute("dorm")Dorm dorm, BindingResult result) {
		if(result.hasErrors()) {
			return "newDorm.jsp";
		}
		else {
			dormService.createDorm(dorm);
			return "redirect:/dorm";
		}
	}
	
	@GetMapping("/student")
	public String newStudent(Model model, @ModelAttribute("student")Student student) {
		model.addAttribute("dorm", dormService.allDorms());
		return "newStudent.jsp";
	}
	
	@PostMapping("/student/new")
	public String createNewStudent(Model model, @Valid @ModelAttribute("student")Student student, BindingResult result) {
		if(result.hasErrors()) {
			return "newStudent.jsp";
		}
		else {
			studentService.createStudent(student);
			return "redirect:/dorm";
		}
	}
	
	@GetMapping("/dorm/{id}")
	public String showDorm(@PathVariable("id")Long id, Model model){
		model.addAttribute("dorm",dormService.findDorm(id));
		return "seeStudents.jsp";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id")Long id) {
		studentService.deleteStudent(id);
		return "redirect:/dorm";
	}
	
}
