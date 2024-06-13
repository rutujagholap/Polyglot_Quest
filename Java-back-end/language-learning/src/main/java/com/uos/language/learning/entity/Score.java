package com.uos.language.learning.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "score")
@Data
public class Score {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "score_id")
	private int scoreId;
	@ManyToOne
	@JoinColumn(name = "user_lang_id", nullable = false)
	private UserLanguage userLanguage;
	@Column(name = "highest_score")
	private int highestScore;
	@Column(name = "latest_score")
	private int latestScore;
}