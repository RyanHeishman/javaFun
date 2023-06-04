package com.codingdojo.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
    
    // Add once service is implemented:
	@Autowired
    private UserService userServ;
	@Autowired
    private BookService bookService;
    
    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {

    	userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("userId", newUser.getId());
        return "redirect:/bookmarket";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
        return "redirect:/bookmarket";
    }
    
    @GetMapping("/welcome")
    public String welcome(Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	if(userId==null) {
    		return "redirect:/";
    	}
    	User user = userServ.findById(userId);
    	model.addAttribute("user", user);
    	List <Book> books = bookService.allBooks();
    	model.addAttribute("books",books);
    	return "bookLender.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	if(userId==null) {
    		return "redirect:/";
    	}
    	session.invalidate();
    	return "redirect:/";
    }
    @GetMapping("/book")
	public String newBook(Model model, HttpSession session,@ModelAttribute("book")Book book) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = userServ.findById(userId);
    	model.addAttribute("user",user);
		return "newBook.jsp";
	}
	
	@PostMapping("/books/new")
	public String createNewBook(Model model, HttpSession session, @Valid @ModelAttribute("book")Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "newBook.jsp";
		}
		bookService.createBook(book);
		return "redirect:/bookmarket";
	}
	@GetMapping("/book/{id}")
	public String showBook(@PathVariable("id")Long id, Model model, HttpSession session){
		model.addAttribute("book",bookService.findBook(id));
    	Long userId = (Long) session.getAttribute("userId");
    	User user = userServ.findById(userId);
    	model.addAttribute("user",user);
    	return "seeBook.jsp";
	}
	@GetMapping("/books/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book",book);
		return "edit.jsp";
	}
	@PostMapping("/book/{id}/update")
	public String update(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		bookService.updateBurger(book);
		return "redirect:/bookmarket";
	}
	 @GetMapping("/bookmarket")
	    public String borrowBook(Model model, HttpSession session) {
	    	Long userId = (Long) session.getAttribute("userId");
	    	if(userId==null) {
	    		return "redirect:/";
	    	}
	    	User user = userServ.findById(userId);
	    	model.addAttribute("user", user);
	    	List <Book> books = bookService.allBooks();
	    	model.addAttribute("books",books);
	    	return "bookLender.jsp";
	    }
	
	 @GetMapping("/books/{id}/borrow")
	    public String borrowBook(@PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Book book = bookService.findBook(id);
	    	bookService.updateBurger(book);
	    	Long userId = (Long) session.getAttribute("userId");
	    	book.setBorrower(userServ.findById(userId));
	    	bookService.updateBurger(book);
	    	return "redirect:/bookmarket";
	    }
	 @GetMapping("/books/{id}/return")
	    public String returnBook(@PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Book book = bookService.findBook(id);
	    	book.setBorrower(null);
	    	bookService.updateBurger(book);
	    	
	    	return "redirect:/bookmarket";
	    }
	 @GetMapping("/books/{id}/delete")
		public String delete(@PathVariable("id")Long id) {
			bookService.deleteBook(id);
			return "redirect:/bookmarket";
		}
}

