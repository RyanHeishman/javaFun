package com.codingdojo.manytomany.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.manytomany.models.Category;
import com.codingdojo.manytomany.models.Product;
import com.codingdojo.manytomany.repositories.ProductRepository;


@Service
public class ProductService {
    // adding the book repository as a dependency
    private final ProductRepository productRepo;
    
    public ProductService(ProductRepository productRepo) {
        this.productRepo = productRepo;
    }
    // returns all the books
    public List<Product> allProducts() {
        return productRepo.findAll();
    }
    
    public Product createProduct(Product product) {
    	return productRepo.save(product);
    }
    
    public Product updateProduct(Product product) {
    	return productRepo.save(product);
    }
    
    public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		}
		else {
			return null;
		}
	}
    public List<Product> assignedProducts(Category category){
    	return productRepo.findAllByCategories(category);
    }
    public List<Product> unassignedProducts(Category category){
    	return productRepo.findByCategoriesNotContains(category);
    }
}	
