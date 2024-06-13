package com.uos.language.learning.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "translation")
@Data
public class Translation {
	
	@Id
	@Column(name = "trans_id")
	private int transId;
	@ManyToOne
	@JoinColumn(name = "word_id", nullable = false)
	private Word word;
	@ManyToOne
	@JoinColumn(name = "lang_id", nullable = false)
	private Language language;
	@Column(name = "translation_word")
	private String translationWord;
}
