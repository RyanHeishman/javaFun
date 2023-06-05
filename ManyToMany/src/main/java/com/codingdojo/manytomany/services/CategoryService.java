package com.codingdojo.manytomany.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.manytomany.models.Category;
import com.codingdojo.manytomany.models.Product;
import com.codingdojo.manytomany.repositories.CategoryRepository;


@Service
public class CategoryService {
    // adding the book repository as a dependency
    private final CategoryRepository categoryRepo;
    
    public CategoryService(CategoryRepository categoryRepo) {
        this.categoryRepo = categoryRepo;
    }
    // returns all the books
    public List<Category> allCategories() {
        return categoryRepo.findAll();
    }
    
    public Category createCategory(Category category) {
    	return categoryRepo.save(category);
    }
    
    public Category updateCategory(Category category) {
    	return categoryRepo.save(category);
    }
    public List<Category> getAssignedCategories(Product product){
		return categoryRepo.findAllByProducts(product);
	}
	
	public List<Category> getUnassignedCategories(Product product){
		return categoryRepo.findByProductsNotContains(product);
	}
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		}
		else {
			return null;
		}
	}
}
