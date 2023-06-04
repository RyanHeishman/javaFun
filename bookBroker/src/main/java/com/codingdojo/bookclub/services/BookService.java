package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;

@Service
public class BookService {
    // adding the book repository as a dependency
    private final BookRepository bookRepo;
    
    public BookService(BookRepository bookRepo) {
        this.bookRepo = bookRepo;
    }
    // returns all the books
    public List<Book> allBooks() {
        return bookRepo.findAll();
    }
    
    public Book createBook(Book book) {
    	return bookRepo.save(book);
    }
    
    public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}
		else {
			return null;
		}
	}
    public Book updateBurger(Book book) {
		return bookRepo.save(book);
	}
    public void deleteBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			bookRepo.deleteById(id);
		}
    }
    
}