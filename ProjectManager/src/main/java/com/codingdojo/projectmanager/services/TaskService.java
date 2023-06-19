package com.codingdojo.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.projectmanager.models.LoginUser;
import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.Task;
import com.codingdojo.projectmanager.models.User;
import com.codingdojo.projectmanager.repositories.ProjectRepository;
import com.codingdojo.projectmanager.repositories.TaskRepository;
import com.codingdojo.projectmanager.repositories.UserRepository;

@Service
public class TaskService {
    
    @Autowired
    private TaskRepository taskRepo;
    
    public TaskService(TaskRepository taskRepo) {
        this.taskRepo =  taskRepo;
    }
    // returns all the books
    public List<Task> allTasks() {
        return taskRepo.findAll();
    }
    
    public Task createTask(Task task) {
    	return  taskRepo.save(task);
    }
}
