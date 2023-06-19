package com.codingdojo.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.projectmanager.models.LoginUser;
import com.codingdojo.projectmanager.models.User;
import com.codingdojo.projectmanager.repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
		
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email","Matches","email already exists");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		
        return userRepo.save(newUser);
    }
    public User login(LoginUser newLoginObject, BindingResult result) {

    	Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if (potentialUser.isEmpty()) {
			result.rejectValue("email","matches","email does not exists");
			return null;
		}
    	User user = potentialUser.get();
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	if(result.hasErrors()) {
    	return null;
    	}
    	return user;
    }
    
    public List<User> allUsers() {
    	return userRepo.findAll();
    }
    
    public User updateUser(User user) {
    	return userRepo.save(user);
    }
    
    public User findById(Long id) {
    	Optional<User> potentialUser = userRepo.findById(id);
    	if(potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	return null;
    }
    
    
}
