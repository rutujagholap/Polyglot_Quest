package com.uos.language.learning.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "language")
@Data
public class Language {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "lang_id")
	private int langId;
	@Column(name = "lang_name")
	private String langName;

}
