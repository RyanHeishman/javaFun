package com.codingdojo.manytomany.controllers;

import java.util.List;
import java.util.Locale.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.manytomany.models.Product;
import com.codingdojo.manytomany.services.CategoryService;
import com.codingdojo.manytomany.services.ProductService;

import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;

	
	@GetMapping("/")
	public String index(Model model) {
		List<com.codingdojo.manytomany.models.Category> categories = categoryService.allCategories();
		model.addAttribute("categories",categories);
		List<Product> products = productService.allProducts();
		model.addAttribute("products",products);
		return "index.jsp";
	}
	
	@GetMapping("/categories/new")
	public String newCategory(@ModelAttribute("category")com.codingdojo.manytomany.models.Category category) {
		return "newCategory.jsp";
	}
	
	@PostMapping("/categories/new")
	public String createNewCategory(@Valid @ModelAttribute("category")com.codingdojo.manytomany.models.Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "newCategory.jsp";
		}
		else {
			categoryService.createCategory(category);
			return "redirect:/";
		}
	}
	
	@GetMapping("/products/new")
	public String newProduct(@ModelAttribute("product")Product product) {
		return "newProduct.jsp";
	}
	
	@PostMapping("/products/new")
	public String createNewProduct(@Valid @ModelAttribute("product")Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "newProduct.jsp";
		}
		else {
			productService.createProduct(product);
			return "redirect:/";
		}
	}
	
	@GetMapping("/products/{id}")
	public String showProduct(@PathVariable("id")Long id, Model model){
		Product product = productService.findProduct(id);
		model.addAttribute("product",product);
		model.addAttribute("assignedCategories", categoryService.getAssignedCategories(product));
		model.addAttribute("unassignedCategories", categoryService.getUnassignedCategories(product));
		return "seeProduct.jsp";
	}
	
	@PostMapping("/products/{id}")
	public String updateProduct(@PathVariable("id")Long id, @RequestParam(value="categoryId")Long categoryId, Model model) {
		Product product = productService.findProduct(id);
		com.codingdojo.manytomany.models.Category category = categoryService.findCategory(categoryId);
		product.getCategories().add(category);
		productService.updateProduct(product);
		return "redirect:/products/"+id;
	}
	@GetMapping("/categories/{id}")
	public String showCategory(@PathVariable("id")Long id, Model model){
		com.codingdojo.manytomany.models.Category category = categoryService.findCategory(id);
		model.addAttribute("category",category);
		model.addAttribute("assignedProducts",productService.assignedProducts(category));
		model.addAttribute("unassignedProducts",productService.unassignedProducts(category));
		return "seeCategory.jsp";
	}
	@PostMapping("/categories/{id}")
	public String updateCategory(@PathVariable("id")Long id, @RequestParam(value="productId")Long productId, Model model) {
		com.codingdojo.manytomany.models.Category category = categoryService.findCategory(id);
		Product product = productService.findProduct(productId);
		category.getProducts().add(product);
		categoryService.updateCategory(category);
		return "redirect:/categories/"+id;
	}
}