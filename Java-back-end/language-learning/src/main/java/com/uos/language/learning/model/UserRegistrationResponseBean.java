package com.uos.language.learning.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserRegistrationResponseBean {
	
	private String email;
	private String userName;
	private String language;
	private String message;

}
