package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class BookController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	BookService bookService;
	
	
	// Get Requests
	
	@GetMapping("/books/{id}")
	public String viewBook(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session
			) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		model.addAttribute("book", bookService.oneBook(id));
		model.addAttribute("user", userService.oneUser((Long)session.getAttribute("userId")));
		
		return "OneBook.jsp";
	}
	
	@GetMapping("/books/update/{id}")
	public String viewEdit(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session
			) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		model.addAttribute("book", bookService.oneBook(id));
		
		return "EditBook.jsp";
	}
	
	
	// Post Requests
	
	@PostMapping("/books/create")
	public String createBook(
			@Valid @ModelAttribute("book") Book book,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		if (result.hasErrors()) {
			return "NewBook.jsp";
		}
		
		bookService.createBook(book);
		
		return "redirect:/books";
	}
	
	// Put Requests
	
	@PutMapping("/books/update/{id}")
	public String updateBook(
			@Valid @ModelAttribute("book") Book book,
			BindingResult result,
			Model model
			) {
		
		if (result.hasErrors()) {
			model.addAttribute("book", book);
			return "EditBook.jsp";
			
		}
		
		bookService.updateBook(book);
		
		return "redirect:/books";
		
	}
	
}
