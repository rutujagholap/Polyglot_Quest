package com.uos.language.learning.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserRegisterationBean {
	
	private String userName;
	private String email;
	private String language;

}
