package com.uos.language.learning.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uos.language.learning.entity.Score;
import com.uos.language.learning.entity.UserLanguage;
import com.uos.language.learning.model.NewScoreBean;
import com.uos.language.learning.model.NewScoreResponseBean;
import com.uos.language.learning.repository.ScoreRepository;
import com.uos.language.learning.repository.UserLanguageRepository;
import com.uos.language.learning.service.ScoreService;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	private ScoreRepository scoreRepository;

	@Autowired
	private UserLanguageRepository userLanguageRepository;

	@Override
	public int fetchHighestScore(String userName, String language) {
		Optional<Score> highestScoreOptional = scoreRepository.findHighestScoreByEmailAndLanguage(userName, language)
				.stream().findFirst();
		if (highestScoreOptional.isPresent()) {
			return highestScoreOptional.get().getHighestScore();
		} else {
			return 0;
		}
	}

	@Override
	public int fetchLatestScore(String userName, String language) {
		Optional<Score> latestScoreOptional = scoreRepository.findLatestScoreByUserLangId(userName, language).stream()
				.findFirst();
		if (latestScoreOptional.isPresent()) {
			return latestScoreOptional.get().getLatestScore();
		} else {
			return 0;
		}
	}

	@Override
	public NewScoreResponseBean saveNewScore(NewScoreBean newScoreBean) {
		int highestScore = fetchHighestScore(newScoreBean.getUserName(), newScoreBean.getLanguage());
		Score score = new Score();
		Optional<UserLanguage> userLanguageOptional = userLanguageRepository
				.findByUserNameAndLanguage(newScoreBean.getUserName(), newScoreBean.getLanguage());
		score.setLatestScore(newScoreBean.getScore());
		score.setHighestScore(newScoreBean.getScore() > highestScore ? newScoreBean.getScore() : highestScore);
		score.setUserLanguage(userLanguageOptional.orElse(null));
		scoreRepository.save(score);
		
		NewScoreResponseBean newScoreResponseBean = new NewScoreResponseBean();
		newScoreResponseBean.setEmail(score.getUserLanguage().getUser().getEmail());
		newScoreResponseBean.setUserName(score.getUserLanguage().getUser().getUserName());
		newScoreResponseBean.setLanguage(score.getUserLanguage().getLanguage().getLangName());
		newScoreResponseBean.setScore(newScoreBean.getScore());
		return newScoreResponseBean;
	}

}
