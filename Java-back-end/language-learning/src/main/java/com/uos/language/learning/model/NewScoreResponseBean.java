package com.uos.language.learning.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NewScoreResponseBean {
	
	private String userName;
	private String email;
	private String language;
	private int score;

}
