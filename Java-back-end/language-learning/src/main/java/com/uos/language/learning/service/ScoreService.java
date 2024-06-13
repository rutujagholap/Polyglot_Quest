package com.uos.language.learning.service;

import com.uos.language.learning.model.NewScoreBean;
import com.uos.language.learning.model.NewScoreResponseBean;

public interface ScoreService {
	
	int fetchHighestScore(String userName, String language);
	
	int fetchLatestScore(String userName, String language);
	
	NewScoreResponseBean saveNewScore(NewScoreBean newScoreBean);

}
