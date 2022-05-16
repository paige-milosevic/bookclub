package com.codingdojo.bookclub.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	// Get All Books
	
	public List<Book> allBooks() {
		return bookRepository.findAll();
	}
	
	// Create A Book
	
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	
	// Update One Book
	
	public Book updateBook(Book book) {
		return bookRepository.save(book);
	}
	
	// Get One Book
	
	public Book oneBook(Long id) {
		return bookRepository.findById(id).orElse(null);
	}
	
	
	// Delete Book
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}
	

}
