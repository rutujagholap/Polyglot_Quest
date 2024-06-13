package com.uos.language.learning.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NewScoreBean {
	
	private String userName;
	private String language;
	private int score;

}
