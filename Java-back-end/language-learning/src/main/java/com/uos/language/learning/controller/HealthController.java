package com.uos.language.learning.controller;

import static com.uos.language.learning.constant.Constant.HEALTH_CHECK_SUCCESS;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;;

@RestController
public class HealthController {
	
	@GetMapping(value = "/health")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<String> healthCheck() {
		return new ResponseEntity<>(HEALTH_CHECK_SUCCESS, HttpStatus.OK);
	}

}
