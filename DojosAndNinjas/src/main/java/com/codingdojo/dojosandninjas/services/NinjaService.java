package com.codingdojo.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
    // adding the book repository as a dependency
    private final NinjaRepository ninjaRepository;
    
    public NinjaService(NinjaRepository ninjaRepository) {
        this.ninjaRepository = ninjaRepository;
    }
    // returns all the books
    public List<Ninja> allNinjas() {
        return ninjaRepository.findAll();
    }
    
    public Ninja createNinja(Ninja ninja) {
    	return ninjaRepository.save(ninja);
    }
    
   
}
