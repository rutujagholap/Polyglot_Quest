package com.uos.language.learning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.uos.language.learning.model.LearnResponseBean;
import com.uos.language.learning.model.PlayResponseBean;
import com.uos.language.learning.service.LearnAndPlayService;

@RestController
public class LearnAndPlayController {
	
	@Autowired
	private LearnAndPlayService learnAndPlayService;

	@GetMapping(value = "/learn/{language}")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<List<LearnResponseBean>> learnNewLanguage(@PathVariable String language) {
		return new ResponseEntity<>(learnAndPlayService.learnNewLanguage(language), HttpStatus.OK);
	}
	
	@GetMapping(value = "/play/{language}")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<List<PlayResponseBean>> playGame(@PathVariable String language) {
		return new ResponseEntity<>(learnAndPlayService.playGame(language), HttpStatus.OK);
	}
	
}
