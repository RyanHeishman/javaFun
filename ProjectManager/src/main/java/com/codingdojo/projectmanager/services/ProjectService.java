package com.codingdojo.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.projectmanager.models.LoginUser;
import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.User;
import com.codingdojo.projectmanager.repositories.ProjectRepository;
import com.codingdojo.projectmanager.repositories.UserRepository;

@Service
public class ProjectService {
    
    @Autowired
    private ProjectRepository projectRepo;
    
    public ProjectService(ProjectRepository projectRepo) {
        this.projectRepo = projectRepo;
    }
    // returns all the books
    public List<Project> allProjects() {
        return projectRepo.findAll();
    }
    
    public List<Project> getAssignedProjects(User user){
		return projectRepo.findAllByUsers(user);
	}
	
	public List<Project> getUnassignedProjects(User user){
		return projectRepo.findByUsersNotContains(user);
	}
    
    public Project createProject(Project project) {
    	return projectRepo.save(project);
    }
    public Project updateProject(Project project) {
    	return projectRepo.save(project);
    }
    
    public Project findProject(Long id) {
		Optional<Project> optionalProject = projectRepo.findById(id);
		if(optionalProject.isPresent()) {
			return optionalProject.get();
		}
		else {
			return null;
		}
	}
    public void deleteProject(Long id) {
		Optional<Project> optionalProject = projectRepo.findById(id);
		if(optionalProject.isPresent()) {
		projectRepo.deleteById(id);
		}

    }
}
