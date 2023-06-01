package com.codingdojo.studentroster.services;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.studentroster.models.Dorm;
import com.codingdojo.studentroster.repositories.DormRepository;

@Service
public class DormService {
    // adding the book repository as a dependency
    private final DormRepository dormRepository;
    
    public DormService(DormRepository dormRepository) {
        this.dormRepository = dormRepository;
    }
    // returns all the books
    public List<Dorm> allDorms() {
        return dormRepository.findAll();
    }
    
    public Dorm createDorm(Dorm dorm) {
    	return dormRepository.save(dorm);
    }
    
    public Dorm findDorm(Long id) {
		Optional<Dorm> optionalDorm = dormRepository.findById(id);
		if(optionalDorm.isPresent()) {
			return optionalDorm.get();
		}
		else {
			return null;
		}
	}
}

