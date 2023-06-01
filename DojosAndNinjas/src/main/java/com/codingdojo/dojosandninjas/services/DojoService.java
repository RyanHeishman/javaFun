package com.codingdojo.dojosandninjas.services;

import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.repositories.DojoRepository;

@Service
public class DojoService {
    // adding the book repository as a dependency
    private final DojoRepository dojoRepository;
    
    public DojoService(DojoRepository dojoRepository) {
        this.dojoRepository = dojoRepository;
    }
    // returns all the books
    public List<Dojo> allDojos() {
        return dojoRepository.findAll();
    }
    
    public Dojo createDojo(Dojo dojo) {
    	return dojoRepository.save(dojo);
    }
    
    public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
		if(optionalDojo.isPresent()) {
			return optionalDojo.get();
		}
		else {
			return null;
		}
	}
}
