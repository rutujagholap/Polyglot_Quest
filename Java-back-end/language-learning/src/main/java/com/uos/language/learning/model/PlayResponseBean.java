package com.uos.language.learning.model;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PlayResponseBean {

	private String englishWord;
	private List<String> allLangTranslationWords;
	private String correctAnswer;
	
}
