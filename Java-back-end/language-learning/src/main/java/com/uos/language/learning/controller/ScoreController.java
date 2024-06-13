package com.uos.language.learning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.uos.language.learning.model.NewScoreBean;
import com.uos.language.learning.model.NewScoreResponseBean;
import com.uos.language.learning.service.ScoreService;

@RestController
@RequestMapping(value = "/scores")
public class ScoreController {
	
	@Autowired
	private ScoreService scoreService;
	
	@GetMapping(value = "/highest/{user-name}/{language}")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<Integer> fetchHighestScore(@PathVariable(name = "user-name") String userName, @PathVariable String language) throws InterruptedException {
		Thread.sleep(100);
		return new ResponseEntity<>(scoreService.fetchHighestScore(userName, language), HttpStatus.OK);
	}
	
	@GetMapping(value = "/latest/{user-name}/{language}")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<Integer> fetchLatestScore(@PathVariable(name = "user-name") String userName, @PathVariable String language) throws InterruptedException {
		Thread.sleep(100);
		return new ResponseEntity<>(scoreService.fetchLatestScore(userName, language), HttpStatus.OK);
	}
	
	@PostMapping
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<NewScoreResponseBean> saveNewScore(@RequestBody NewScoreBean newScoreBean) {
		return new ResponseEntity<>(scoreService.saveNewScore(newScoreBean), HttpStatus.CREATED);
	}
	
}
