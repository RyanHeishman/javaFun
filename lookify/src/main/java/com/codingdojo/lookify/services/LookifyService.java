package com.codingdojo.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.Lookify;
import com.codingdojo.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
    // adding the book repository as a dependency
    private final LookifyRepository lookifyRepository;
    
    public LookifyService(LookifyRepository lookifyRepository) {
        this.lookifyRepository = lookifyRepository;
    }
    // returns all the books
    public List<Lookify> allLookifys() {
        return lookifyRepository.findAll();
    }
    
    public List<Lookify> topTenSongs(){
    	return lookifyRepository.findTop10ByOrderByRatingDesc();
    }
    
    // creates a book
    public Lookify createLookify(Lookify l) {
        return lookifyRepository.save(l);
    }
    public Lookify oneLookify(Long id) {
    	
    	Optional<Lookify> optionalLookify = lookifyRepository.findById(id);
    	if(optionalLookify.isPresent()) {
    		return optionalLookify.get();
    	}
    	else {
    		return null;
    	}
    }
    
    public List<Lookify> searchLookify(String artist){
    	return lookifyRepository.findByArtistContaining(artist);
    }
    public void deleteLookify(Long id) {
		Optional<Lookify> optionalLookify = lookifyRepository.findById(id);
		if(optionalLookify.isPresent()) {
			lookifyRepository.deleteById(id);
		}
    }
}
