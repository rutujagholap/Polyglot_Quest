package com.uos.language.learning.service;

import java.util.List;

import com.uos.language.learning.model.UserRegisterationBean;

public interface UserRegistrationService {
	
	List<String> findAllLanguages();
	
	String registerUser(UserRegisterationBean userRegisterationBean);

}
