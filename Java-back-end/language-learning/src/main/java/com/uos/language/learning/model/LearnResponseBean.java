package com.uos.language.learning.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class LearnResponseBean {
	
	private String englishWord;
	private String translatedWord;

}
