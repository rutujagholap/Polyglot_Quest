package com.uos.language.learning.controller;

import static com.uos.language.learning.constant.Constant.USER_ALREADY_EXISTS;
import static com.uos.language.learning.constant.Constant.USER_CREATED;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.uos.language.learning.model.UserRegisterationBean;
import com.uos.language.learning.model.UserRegistrationResponseBean;
import com.uos.language.learning.service.UserRegistrationService;

@RestController
public class UserRegistrationController {

	@Autowired
	private UserRegistrationService userRegistrationService;

	@GetMapping("/languages")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<List<String>> findAllLanguages() {
		return new ResponseEntity<>(userRegistrationService.findAllLanguages(), HttpStatus.OK);
	}

	@PostMapping("/users/register")
	@CrossOrigin(origins = "http://localhost:5173")
	public ResponseEntity<UserRegistrationResponseBean> registerUser(@RequestBody UserRegisterationBean userRegisterationBean) {
		UserRegistrationResponseBean userRegistrationResponseBean = new UserRegistrationResponseBean();
		userRegistrationResponseBean.setEmail(userRegisterationBean.getEmail());
		userRegistrationResponseBean.setUserName(userRegisterationBean.getUserName());
		userRegistrationResponseBean.setLanguage(userRegisterationBean.getLanguage());
		String userRegistrationResponse = userRegistrationService.registerUser(userRegisterationBean);
		if (userRegistrationResponse.equals(USER_CREATED)) {
			userRegistrationResponseBean.setMessage(USER_CREATED);
			return new ResponseEntity<>(userRegistrationResponseBean, HttpStatus.CREATED);
		} else {
			userRegistrationResponseBean.setMessage(USER_ALREADY_EXISTS);
			return new ResponseEntity<>(userRegistrationResponseBean, HttpStatus.OK);
		}

	}

}
