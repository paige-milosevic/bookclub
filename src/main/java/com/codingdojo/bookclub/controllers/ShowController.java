package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.bookclub.models.Show;
import com.codingdojo.bookclub.services.ShowService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class ShowController {
	
	@Autowired 
	UserService userService;
	
	@Autowired
	ShowService showService;
	
	// Get Requests
	
	@GetMapping("/shows")
	public String dashboard(
			Model model,
			HttpSession session
			) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		model.addAttribute("shows", showService.allShows());
		model.addAttribute("user", userService.oneUser((Long)session.getAttribute("userId")));
		
		return "Dashboard.jsp";
	}
	
	@GetMapping("/shows/new")
	public String addShow(
			@ModelAttribute("show") Show show,
			Model model,
			HttpSession session
			) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		model.addAttribute("user", userService.oneUser((Long)session.getAttribute("userId")));
		
		return "NewShow.jsp";
	}
	
	
	@GetMapping("/shows/{id}")
	public String viewShow(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session
			) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		model.addAttribute("show", showService.oneShow(id));
		model.addAttribute("user", userService.oneUser((Long)session.getAttribute("userId")));
		
		return "OneShow.jsp";
	}
	
	@GetMapping("/shows/{id}/edit")
	public String viewEdit(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session
			) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		model.addAttribute("show", showService.oneShow(id));
		
		return "EditShow.jsp";
	}
	
	
	
	// Post Requests
	
	@PostMapping("/shows/create")
	public String createShow(
			@Valid @ModelAttribute("show") Show show,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		} 
		
		if (result.hasErrors()) {
			return "NewShow.jsp";
		}
		
		showService.createShow(show);
		
		return "redirect:/shows";
	}
	
	
	// Put Requests
	
	@PutMapping("/shows/update/{id}")
	public String updateBook(
			@Valid @ModelAttribute("show") Show show,
			BindingResult result,
			Model model
			) {
		
		if (result.hasErrors()) {
			model.addAttribute("show", show);
			return "EditShow.jsp";
			
		}
		
		showService.updateShow(show);
		
		return "redirect:/shows";
		
	}
	
	
	// Delete 
	@DeleteMapping("/shows/destroy/{id}")
	public String destroy(
			@PathVariable("id") Long id
			) {
		
		
		showService.deleteShow(id);
		return "redirect:/shows";
		
	}
	
	

}
