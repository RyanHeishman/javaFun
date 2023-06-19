package com.codingdojo.projectmanager.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.projectmanager.models.LoginUser;
import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.Task;
import com.codingdojo.projectmanager.models.User;
import com.codingdojo.projectmanager.services.ProjectService;
import com.codingdojo.projectmanager.services.TaskService;
import com.codingdojo.projectmanager.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
    
    // Add once service is implemented:
	@Autowired
    private UserService userServ;
	@Autowired
    private ProjectService projectServ;
	@Autowired
    private TaskService taskServ;
	
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {

    	userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("userId", newUser.getId());
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
        return "redirect:/dashboard";
    }
    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	if(userId==null) {
    		return "redirect:/";
    	}
    	User user = userServ.findById(userId);
    	model.addAttribute("user", user);
    	model.addAttribute("assignedProjects",projectServ.getAssignedProjects(user));
    	model.addAttribute("unassignedProjects",projectServ.getUnassignedProjects(user));
    	return "dashboard.jsp";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	if(userId==null) {
    		return "redirect:/";
    	}
    	session.invalidate();
    	return "redirect:/";
    }
    @GetMapping("/projects/new")
   	public String newProject(@ModelAttribute("project")Project project,Model model, HttpSession session) {
       	Long userId = (Long) session.getAttribute("userId");

       	model.addAttribute("userId",userId);
   		return "newProject.jsp";
   	}
   	
   	@PostMapping("/projects/new")
   	public String createNewProject(@Valid @ModelAttribute("project")Project project, BindingResult result, Model model, HttpSession session) {
   		if(result.hasErrors()) {
   			return "newProject.jsp";
   		}
   		projectServ.createProject(project);
   		
   		Long userId = (Long) session.getAttribute("userId");
   		User user = userServ.findById(userId);
   		user.getProjects().add(project);
   		userServ.updateUser(user);
   		
   		return "redirect:/dashboard";
   	}
   	
    @GetMapping("/projects/{id}/jointeam")
    public String joinTeam(@PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	Project project = projectServ.findProject(id);
    	User user = userServ.findById(userId);
    	
    	user.getProjects().add(project);
    	userServ.updateUser(user);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("assignedProjects",projectServ.getAssignedProjects(user));
    	model.addAttribute("unassignedProjects",projectServ.getUnassignedProjects(user));
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/projects/{id}/return")
    public String returnBook(@PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	Project project = projectServ.findProject(id);
    	User user = userServ.findById(userId);
    	
    	user.getProjects().remove(project);
    	userServ.updateUser(user);

    	model.addAttribute("user", user);
    	model.addAttribute("assignedProjects",projectServ.getAssignedProjects(user));
    	model.addAttribute("unassignedProjects",projectServ.getUnassignedProjects(user));
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/projects/{id}")
	public String showProject(@PathVariable("id")Long id, HttpSession session, Model model){
		model.addAttribute("project", projectServ.findProject(id));
		Long userId = (Long) session.getAttribute("userId");
    	User user = userServ.findById(userId);
    	model.addAttribute("user", user);
		return "seeProjects.jsp";
	}
    
    @GetMapping("/projects/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Project project = projectServ.findProject(id);
		model.addAttribute("project",project);
		return "edit.jsp";
	}
	@PostMapping("/projects/{id}/update")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		User user = userServ.findById(userId);
		
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		Project thisProject = projectServ.findProject(id);
		project.setUsers(thisProject.getUsers());
		project.setLead(user);
		projectServ.updateProject(project);
		return "redirect:/dashboard";
	}
	 @GetMapping("/projects/{id}/delete")
		public String delete(@PathVariable("id")Long id) {
			projectServ.deleteProject(id);
			return "redirect:/dashboard";
		}
	 @GetMapping("/projects/{id}/tasks")
		public String newTask(@PathVariable("id")Long id, Model model, HttpSession session,@ModelAttribute("task")Task task) {
		 	
		 model.addAttribute("project", projectServ.findProject(id));
		 Long userId = (Long) session.getAttribute("userId");
	     User user = userServ.findById(userId);
	     model.addAttribute("user", user);
	     List<Task> tasks = taskServ.allTasks();
	     model.addAttribute("tasks", tasks);
			
	    	return "projectTasks.jsp";
		}
		
		@PostMapping("/projects/new/tasks")
		public String createNewTask(Model model, HttpSession session, @Valid @ModelAttribute("task")Task task, BindingResult result) {
			if(result.hasErrors()) {
				return "projectTasks.jsp";
			}
			taskServ.createTask(task);
			return "redirect:/dashboard";
		}
}
