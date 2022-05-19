package com.codingdojo.bookclub.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.bookclub.models.Show;


@Repository
public interface ShowRepository extends CrudRepository <Show, Long> {
	
	List<Show> findAll();
	Optional<Show> findByTitle(String title);

}