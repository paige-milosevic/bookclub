package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.bookclub.models.Show;
import com.codingdojo.bookclub.repositories.ShowRepository;

@Service
public class ShowService {

	@Autowired
	private ShowRepository showRepo;
	
	// Get All Shows
	
	public List<Show> allShows() {
		return showRepo.findAll();
	}
	
	// Create A Show
	
	public Show createShow(Show show, BindingResult result) {
		
		Optional<Show> showLookUp = showRepo.findByTitle(show.getTitle());
		
		if (showLookUp.isPresent()) {
			result.rejectValue("title", "Unique", "Entry with this title already exists");
		}
		
		
		return showRepo.save(show);
	}
	
	// Update One Show
	
	public Show updateShow(Show show) {
		return showRepo.save(show);
	}
	
	// Get One Show
	
	public Show oneShow(Long id) {
		return showRepo.findById(id).orElse(null);
	}
	
	
	// Delete Show
	public void deleteShow(Long id) {
		showRepo.deleteById(id);
	}
	
	
	
}
