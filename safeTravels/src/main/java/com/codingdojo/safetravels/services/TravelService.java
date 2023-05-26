package com.codingdojo.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.safetravels.models.Travel;
import com.codingdojo.safetravels.repositories.TravelRepository;

@Service
public class TravelService {
    // adding the book repository as a dependency
    private final TravelRepository travelRepository;
    
    public TravelService(TravelRepository travelRepository) {
        this.travelRepository = travelRepository;
    }
    // returns all the books
    public List<Travel> allTravels() {
        return travelRepository.findAll();
    }
    // creates a book
    public Travel createTravel(Travel t) {
        return travelRepository.save(t);
    }
    
    public Travel oneTravel(Long id) {
    	
    	Optional<Travel> optionalTravel = travelRepository.findById(id);
    	if(optionalTravel.isPresent()) {
    		return optionalTravel.get();
    	}
    	else {
    		return null;
    	}
    }
    public Travel updateTravel(Travel travel) {
    	return travelRepository.save(travel);
    }
    public void deleteTravel(Long id) {
    	Optional<Travel> optionalTravel = travelRepository.findById(id);
    	if(optionalTravel.isPresent()) {
    		travelRepository.deleteById(id);
    	}
    }
}