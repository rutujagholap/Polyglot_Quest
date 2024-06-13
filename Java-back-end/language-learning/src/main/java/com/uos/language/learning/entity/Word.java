package com.uos.language.learning.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "word")
@Data
public class Word {
	
	@Id
	@Column(name = "word_id")
	private int wordId;
	@Column(name = "word_name")
	private String wordName; 
}
