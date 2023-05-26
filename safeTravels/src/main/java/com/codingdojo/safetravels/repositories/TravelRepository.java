package com.codingdojo.safetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.safetravels.models.Travel;

@Repository
public interface TravelRepository extends CrudRepository<Travel, Long> {
	
    // this method retrieves all the books from the database
    List<Travel> findAll();

}

